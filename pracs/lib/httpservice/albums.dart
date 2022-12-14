import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pracs/httpservice/service/http_service.dart';
import 'album_detail.dart';
import 'album_item.dart';
import 'models/Album.dart';

class Albums extends StatefulWidget {
  @override
  State<Albums> createState() => _AlbumState();
}

class _AlbumState extends State<Albums> {
  final List<Album> _albums = [];
  HttpService service = HttpService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllAlbums();
  }

  getAllAlbums() {

    service.getAlbums().then((response) {
      if (response.statusCode == 200) {
        print("Sucesss");
        List myList = jsonDecode(response.body) as List;
        myList.forEach((element) {
          _albums.add(Album(
              userId: element["userId"],
              id: element["id"],
              title: element["title"]));
        });
        setState(() {});
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
        title: const Center(child: Text("Json Albums")),
      ),
      body: FutureBuilder<Response>(
        future: service.getAlbums(),
        builder: (
            BuildContext context,
            AsyncSnapshot<Response> snapshot,
            ) {
          print(snapshot.connectionState);
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Text('Error');
            } else if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: _albums.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>AlbumDetail(
                            albumId:_albums[index].id.toString(),
                          )),);
                          print("Clicked on record ${index}");
                        },
                        child: AlbumItem(
                          album: _albums[index],
                        ),
                      ),
                    );
                  });
            } else {
              return const Text('Empty data');
            }
          } else {
            return const Text("data");
          }
        },
      ),
    );
  }
}
