import "package:equatable/equatable.dart";
class Person extends Equatable {
  final String name;
  final int age;
  final int phone;

  Person({required this.phone, required this.name,required this.age});

  // @override
  //  bool operator ==(Object other) =>
  //     identical(this, other) ||
  //  other is Person &&
  //  runtimeType == other.runtimeType &&
  //  name == other.name &&
  //  age == other.age;           //main override

  // @override
  //  int get hashCode => name.hashCode ^ age.hashCode;  //method 1

  @override
  List<Object?> get props => [name, age];  //method - 2
 }
 void main(){
  final Person bob = Person(name: 'bob', age: 400, phone: 123654789);
  print(bob == Person(name: 'bob', age: 400, phone: 123654789));
 }