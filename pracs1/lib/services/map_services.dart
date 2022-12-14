import 'package:http/http.dart' as http;
import 'dart:convert'as convert;

import 'package:pracs1/models/auto_complete.dart';

class MapServices{
  final String key = 'fsq3T7SKdVMGwe+IQk+L/A1uyXQgk+w0ILNgWBUGmoeyld8=';
  final String types = 'geocode';

  Future<List> searchPlaces(String searchInput) async{
    final String url = 'https://api.foursquare.com/v3/autocomplete?query=autocomplete&ll=13.3327621%2C74.7028231&radius=50000&types=address%2Cplace%2Cgeo&limit=15';
    var response = await http.get(Uri.parse(url));

    var json = convert.jsonDecode(response.body);

    var results = json['results'] as List;

    return results.map((e) => AutoCompleteResult.fromJson(e)).toList();
  }
}