import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pracs/httpservice/service/http_service.dart';
import 'models/Album.dart';

class AlbumDetail extends StatefulWidget {
  final String albumId;
  const AlbumDetail({required this.albumId});
  @override
  State<AlbumDetail> createState() => _AlbumDetailState();
}
class _AlbumDetailState extends State<AlbumDetail> {
  final List<Album> _album=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAlbum();
  }
  getAlbum() {
    HttpService service = HttpService();
    service.getAlbums().then((response) {
      if (response.statusCode == 200) {
        print("Sucesss");
        List myList=jsonDecode(response.body) as List;
        myList.forEach((element) {
          _album.add(Album(userId: element["userId"], id: element["id"],
              title: element["title"]));
        });
        setState(() {

        });
      }

    }).catchError((onError) {
      print((onError.toString()));
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title:const Text("Album Detail"),
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // children: [Text("User Id: ${_album.userId}"),
        //   Text("Album Id:${_album.id}"),
        //   Text("Album title:${_album.title}"),],
      ),
    );
  }
}
