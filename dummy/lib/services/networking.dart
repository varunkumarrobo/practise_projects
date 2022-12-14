import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper({required this.uri});
  final String uri;

  Future getData() async {
    var url = Uri.parse(uri);
    http.Response response = await http.get(url);
    String responseData = response.body;
    // print(responseData);
    var decoadedData = jsonDecode(responseData);
    // print(decoadedData);
    return decoadedData;
  }
}
