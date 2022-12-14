import 'package:flutter/material.dart';

import 'models/Album.dart';


class AlbumItem extends StatelessWidget{
  final Album album;

  const AlbumItem({required this.album});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [Text("User Id:${album.id}"),Text("Album Id:${album.userId}"),
        Text("Album title:${album.title}"),const Divider(color: Colors.black,)],
    );
  }

}