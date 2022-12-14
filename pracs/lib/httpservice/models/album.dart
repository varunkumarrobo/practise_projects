class Album {
  int userId=0;
  int id=0;
  String title="";
  Album({
    required this.userId,
    required this.id,
    required this.title,});

  Album.fromJson(dynamic json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = userId;
    map['id'] = id;
    map['title'] = title;
    return map;
  }

}