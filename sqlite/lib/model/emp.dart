class Employee {
  final int id;
  final String firstName;
  final String lastName;
  final double salary;

  Employee(
      {required this.id,
        required this.firstName,
        required this.lastName,
        required this.salary});

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        salary: json["salary"]);
  }
}
