import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


import 'model/emp.dart';

class DatabaseService {
  static final DatabaseService instance = DatabaseService._privateConstructor();

  DatabaseService._privateConstructor();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('employee.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path,
        version: 2, onCreate: _createDB, onUpgrade: _upgrade);
  }

  _upgrade(Database db, int oldVersion, int newVersion) {
    if (newVersion > oldVersion)
      db.execute("ALTER TABLE Employee ADD AGE INTEGER");
  }

  Future _createDB(Database db, int version) async {
    try {
      await db.execute(
          'CREATE TABLE Employee (id INTEGER PRIMARY KEY AUTOINCREMENT, '
              'firstName TEXT,lastName TEXT ,salary REAL)');
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<Employee>> getAllEmployee() async {
    final db = await instance.database;

    final result = await db.rawQuery('SELECT * FROM Employee');
    print("Employee is ${result}");
    return result.length > 0
        ? result.map((json) => Employee.fromJson(json)).toList()
        : [];
  }

  Future<Employee> getEmployee(int id) async {
    final db = await instance.database;

    final result = await db.rawQuery('SELECT * FROM Employee WHERE id=${id}');

    return result.map((json) => Employee.fromJson(json)).toList()[0];
  }

  Future createEmployee(Map<String, dynamic> employee) async {
    final db = await instance.database;

    try {
      int result = await db.insert('Employee', employee);

      return "Record inserted";
    } catch (e) {
      print(e);
      return Exception("Something went wrong");
    }
  }

  Future updateEmployee(Map<String, dynamic> employee) async {
    final db = await instance.database;

    try {
      int result = await db.update('Employee', employee,
          where: 'id = ?', whereArgs: [employee["id"]]);

      return "Record updated";
    } catch (e) {
      print(e);
      return Exception("Something went wrong");
    }
  }

  Future deleteEmployee(int id) async {
    final db = await instance.database;

    try {
      int result =
      await db.delete('EMPLOYEE', where: 'id = ?', whereArgs: [id]);

      return "Record deleted";
    } catch (e) {
      print(e);
      return Exception("Something went wrong");
    }
  }
}
