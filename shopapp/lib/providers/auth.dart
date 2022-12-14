import 'dart:convert';
import 'dart:async';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


import '../models/http_exception.dart';

class Auth with ChangeNotifier{
  /*
  ┌─────────────────────────────────────────────────────────────────────────────┐
  │   Properties                                                                │
  └─────────────────────────────────────────────────────────────────────────────┘
 */
  String? _token;
  DateTime? _expiryDate;
  String? _userID;
  Timer? _authTimer;
  // bool returnSecureToken;


  /*
  ┌─────────────────────────────────────────────────────────────────────────────┐
  │   Getters                                                                   │
  └─────────────────────────────────────────────────────────────────────────────┘
 */

  bool get isAuth {
    return token != null;
  }

  String? get token {
    if(
    _expiryDate != null &&
    _expiryDate!.isAfter(DateTime.now())
    && _token != null
    ) {
      return _token!;
    }
    return null;
  }

  String get userId{
    return _userID.toString();
  }

  /*
  ┌─────────────────────────────────────────────────────────────────────────┐
  │ Authenticate                                                            │
  └─────────────────────────────────────────────────────────────────────────┘
 */

  Future<void> _authenticate(
     String email, String password,String urlSegment) async {
  final url =
   Uri.parse(
    'https://identitytoolkit.googleapis.com/v1/$urlSegment?key=AIzaSyCKlHi-GS3vqcY9hDw9VoFVaXluVfd5ziY');
    try{
      final response = await http.post(
      url,
      body:json.encode(
      {
      'email':email,
      'password':password,
      'returnSecureToken':true,
      },
     ),
    );
    print(json.decode(response.body));
    final responseData = json.decode(response.body);
    if(responseData['error'] != null){
      throw HttpException(responseData['error']['message']);
    } 
    _token = responseData['idToken'];
    _userID = responseData['localId']; 
    _expiryDate = DateTime.now().add(
      Duration(
      seconds: int.parse(
        responseData['expiresIn'],
      ),
    ),
    );
    _autoLogout();
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    final userData = json.encode(
      {
      'token': _token,
      'userId': _userID,
      'expiryDate': _expiryDate!.toIso8601String(),
        'refreshToken': responseData['refreshToken'],
      },
      );
    //
    prefs.setString('userData', userData);
    keepLoggedIn();
    } catch(error){
      rethrow;
    }  
  }
  

  Future<void> signup(String email, String password)async {
   return _authenticate(email, password, 'accounts:signUp' );
  
  }

  Future<void> login(String email, String password)async {
    return _authenticate(email, password, 'accounts:signInWithPassword' );
  }
  /*
  ┌─────────────────────────────────────────────────────────────────────────┐
  │ Keep Logged In                                                          │
  └─────────────────────────────────────────────────────────────────────────┘
 */
  Future<void> keepLoggedIn() async {
    final timeToExpiry = _expiryDate!.difference(DateTime.now()).inSeconds;
    _authTimer = Timer(Duration(seconds: timeToExpiry), tryAutoLogin);
  }
  /*
  ┌─────────────────────────────────────────────────────────────────────────┐
  │ Try Auto Login                                                          │
  └─────────────────────────────────────────────────────────────────────────┘
 */

  Future<bool> tryAutoLogin() async {
    // GET DATA FROM SHARED PREFERENCES
    final prefs = await SharedPreferences.getInstance();
    if(!prefs.containsKey('userData')){
      return false;
    }
    final extractedUserData =
    json.decode(prefs.getString('userData')!) as Map<String, dynamic>;
    final expiryDate = DateTime.parse(extractedUserData['expiryDate']);

    //IF EXPIRED
    if(expiryDate.isBefore(DateTime.now())){
      return refreshToken();
    }
    //iF NOT EXPIRED
    _token = extractedUserData['token'];
    _userID = extractedUserData['userId'];
    _expiryDate = expiryDate;
    notifyListeners();
    _autoLogout();
    return true;
  }

  /*
  ┌───────────────────────────────────────────────────────────────────────────┐
  │ Refresh Token                                                             │
  └───────────────────────────────────────────────────────────────────────────┘
 */

  Future<bool> refreshToken() async {
    //POST HTTP REQUEST
    final url =
        Uri.parse(
            'https://securetoken.googleapis.com/v1/token?key=AIzaSyCKlHi-GS3vqcY9hDw9VoFVaXluVfd5ziY');

    final prefs = await SharedPreferences.getInstance();
    final extractedUserData =
        json.decode(prefs.getString('userData')!) as Map<String, Object>;
    try{
      final response = await http.post(
        url,
          body: json.encode({
            'grant_type':'refresh_token',
            'refresh_token': extractedUserData['refreshToken'],
          },
          ));
      final responseData = json.decode(response.body);
      if(responseData['error'] != null){
        return false;
      }
      _token = responseData['id_token'];
      _userID = responseData['user_id'];
      _expiryDate = DateTime.now().add(
          Duration(
            seconds: int.parse(
              responseData['expires_in'],
            ),
          ));
      notifyListeners();

      //STORE DATA IN SHARED PREFERENCES
      final prefs = await SharedPreferences.getInstance();
      final userData = json.encode({
        'token':_token,
        'userId':_userID,
        'expiryDate':_expiryDate!.toIso8601String(),
      },
      );
      prefs.setString('userData', userData);
      keepLoggedIn();
      return true;
    } catch(error){
      return false;
    }
  }
  /*
  ┌─────────────────────────────────────────────────────────────────────────┐
  │ Logout                                                                  │
  └─────────────────────────────────────────────────────────────────────────┘
 */

  Future<void> logout()async{
    _token = null;
    _userID = null;
    _expiryDate = null;
    if(_authTimer != null){
      _authTimer!.cancel();
      _authTimer = null;
    }
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  void _autoLogout(){
    if(_authTimer != null){
      _authTimer!.cancel();
    }
    final timeToExpiry = _expiryDate!.difference(DateTime.now()).inSeconds;
    _authTimer = Timer(Duration(seconds: timeToExpiry),
     logout);
  }
}