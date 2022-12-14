import 'dart:convert';
/// users : [{"id":0,"name":"Adam Carter","work":"Unilogic","email":"adam.carter@unilogic.com","dob":"1978","address":"83 Warner Street","city":"Boston","optedin":true},{"id":1,"name":"Leanne Brier","work":"Connic","email":"leanne.brier@connic.org","dob":"1987","address":"9 Coleman Avenue","city":"Toronto","optedin":false}]
/// images : ["img0.png","img1.png","img2.png"]
/// coordinates : {"x":35.12,"y":-21.49}
/// price : "$59,395"

MyClass myClassFromJson(String str) => MyClass.fromJson(json.decode(str));
String myClassToJson(MyClass data) => json.encode(data.toJson());
class MyClass {
  MyClass({
      List<Users>? users, 
      List<String>? images, 
      Coordinates? coordinates, 
      String? price,}){
    _users = users;
    _images = images;
    _coordinates = coordinates;
    _price = price;
}

  MyClass.fromJson(dynamic json) {
    if (json['users'] != null) {
      _users = [];
      json['users'].forEach((v) {
        _users?.add(Users.fromJson(v));
      });
    }
    _images = json['images'] != null ? json['images'].cast<String>() : [];
    _coordinates = json['coordinates'] != null ? Coordinates.fromJson(json['coordinates']) : null;
    _price = json['price'];
  }
  List<Users>? _users;
  List<String>? _images;
  Coordinates? _coordinates;
  String? _price;
MyClass copyWith({  List<Users>? users,
  List<String>? images,
  Coordinates? coordinates,
  String? price,
}) => MyClass(  users: users ?? _users,
  images: images ?? _images,
  coordinates: coordinates ?? _coordinates,
  price: price ?? _price,
);
  List<Users>? get users => _users;
  List<String>? get images => _images;
  Coordinates? get coordinates => _coordinates;
  String? get price => _price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_users != null) {
      map['users'] = _users?.map((v) => v.toJson()).toList();
    }
    map['images'] = _images;
    if (_coordinates != null) {
      map['coordinates'] = _coordinates?.toJson();
    }
    map['price'] = _price;
    return map;
  }

}

/// x : 35.12
/// y : -21.49

Coordinates coordinatesFromJson(String str) => Coordinates.fromJson(json.decode(str));
String coordinatesToJson(Coordinates data) => json.encode(data.toJson());
class Coordinates {
  Coordinates({
      num? x, 
      num? y,}){
    _x = x;
    _y = y;
}

  Coordinates.fromJson(dynamic json) {
    _x = json['x'];
    _y = json['y'];
  }
  num? _x;
  num? _y;
Coordinates copyWith({  num? x,
  num? y,
}) => Coordinates(  x: x ?? _x,
  y: y ?? _y,
);
  num? get x => _x;
  num? get y => _y;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['x'] = _x;
    map['y'] = _y;
    return map;
  }

}

/// id : 0
/// name : "Adam Carter"
/// work : "Unilogic"
/// email : "adam.carter@unilogic.com"
/// dob : "1978"
/// address : "83 Warner Street"
/// city : "Boston"
/// optedin : true

Users usersFromJson(String str) => Users.fromJson(json.decode(str));
String usersToJson(Users data) => json.encode(data.toJson());
class Users {
  Users({
      num? id, 
      String? name, 
      String? work, 
      String? email, 
      String? dob, 
      String? address, 
      String? city, 
      bool? optedin,}){
    _id = id;
    _name = name;
    _work = work;
    _email = email;
    _dob = dob;
    _address = address;
    _city = city;
    _optedin = optedin;
}

  Users.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _work = json['work'];
    _email = json['email'];
    _dob = json['dob'];
    _address = json['address'];
    _city = json['city'];
    _optedin = json['optedin'];
  }
  num? _id;
  String? _name;
  String? _work;
  String? _email;
  String? _dob;
  String? _address;
  String? _city;
  bool? _optedin;
Users copyWith({  num? id,
  String? name,
  String? work,
  String? email,
  String? dob,
  String? address,
  String? city,
  bool? optedin,
}) => Users(  id: id ?? _id,
  name: name ?? _name,
  work: work ?? _work,
  email: email ?? _email,
  dob: dob ?? _dob,
  address: address ?? _address,
  city: city ?? _city,
  optedin: optedin ?? _optedin,
);
  num? get id => _id;
  String? get name => _name;
  String? get work => _work;
  String? get email => _email;
  String? get dob => _dob;
  String? get address => _address;
  String? get city => _city;
  bool? get optedin => _optedin;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['work'] = _work;
    map['email'] = _email;
    map['dob'] = _dob;
    map['address'] = _address;
    map['city'] = _city;
    map['optedin'] = _optedin;
    return map;
  }

}
void main() {
  MyClass data = MyClass.fromJson({
    "users": [
      {
        "id": 0,
        "name": "Adam Carter",
        "work": "Unilogic",
        "email": "adam.carter@unilogic.com",
        "dob": "1978",
        "address": "83 Warner Street",
        "city": "Boston",
        "optedin": true
      },
      {
        "id": 1,
        "name": "Leanne Brier",
        "work": "Connic",
        "email": "leanne.brier@connic.org",
        "dob": "1987",
        "address": "9 Coleman Avenue",
        "city": "Toronto",
        "optedin": false
      }
    ],
    "images": [
      "img0.png",
      "img1.png",
      "img2.png"
    ],
    "coordinates": {
      "x": 35.12,
      "y": -21.49
    },
    "price": "59,395"
  });
  // print(data._coordinates!._x);
  // print(data._coordinates!._y);
  data.toJson().forEach((key, value) {
    if (key == 'users') {
      for (var element in value) {
        print('key: $key Value: $value\n');
      }
    };
  });
}