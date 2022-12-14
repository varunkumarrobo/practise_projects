import 'package:http/http.dart' as http;

class HttpService{
  Future<http.Response>getAlbums(){
    return http.get(Uri.parse("https://jsonplaceholder.typicode.com/albums"));
  }
  Future<http.Response>getAlbum(int id){
    return http.get(Uri.parse("https://jsonplaceholder.typicode.com/albums/${id}"));
  }
  Future<http.Response>deleteAlbum(int id){
    return http.delete(Uri.parse("https://jsonplaceholder.typicode.com/albums/${id}"));
  }
}