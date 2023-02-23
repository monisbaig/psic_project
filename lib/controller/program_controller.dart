// ignore_for_file: depend_on_referenced_packages

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ProgramController {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'database.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE Sessions(id INTEGER PRIMARY KEY AUTOINCREMENT,title TEXT,description TEXT,casename TEXT,casetime TEXT)",
        );
        await database.execute(
          "CREATE TABLE Notifications(id INTEGER PRIMARY KEY AUTOINCREMENT,title TEXT,description TEXT,time TEXT)",
        );
      },
      version: 1,
    );
  }

  createItem(Sessions session) async {
    // int result = 0;
    final Database db = await initializeDB();
    final id = await db.insert(
      'Sessions',
      session.toMap(),
    );
    print(id);
  }

  createNotif(CustomNotifications session) async {
    // int result = 0;
    final Database db = await initializeDB();
    final id = await db.insert(
      'Notifications',
      session.toMap(),
    );
    print(id);
  }
}

class SqliteService {
  Future<List<Sessions>> getItems() async {
    try {
      String path = await getDatabasesPath();
      var db = await openDatabase(
        join(path, 'database.db'),
        onCreate: (database, version) async {
          await database.execute(
            "CREATE TABLE Sessions(id INTEGER PRIMARY KEY AUTOINCREMENT,title TEXT,description TEXT,casename TEXT,casetime TEXT)",
          );
        },
        version: 1,
      );
      final List<Map<String, Object?>> queryResult = await db.query('Sessions');
      print(queryResult.map((e) => e['description'].toString()).toList());
      return queryResult.map((e) => Sessions.fromMap(e)).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<CustomNotifications>> getNotif() async {
    String path = await getDatabasesPath();
    var db = await openDatabase(
      join(path, 'database.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE Notifications(id INTEGER PRIMARY KEY AUTOINCREMENT,title TEXT,description TEXT,time TEXT)",
        );
      },
      version: 1,
    );
    final List<Map<String, Object?>> queryResult =
        await db.query('Notifications');
    print(queryResult.map((e) => e['description'].toString()).toList());
    return queryResult.map((e) => CustomNotifications.fromMap(e)).toList();
  }

  deleteItem(name) async {
    // print(name);
    String path = await getDatabasesPath();
    var db = await openDatabase(
      join(path, 'database.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE Sessions(id INTEGER PRIMARY KEY AUTOINCREMENT,title TEXT,description TEXT,casename TEXT,casetime TEXT)",
        );
      },
      version: 1,
    );
    try {
      await db.delete('Sessions', where: 'casename = ?', whereArgs: ['$name']);
    } catch (ex) {
      print(ex);
    }
  }
}

class Sessions {
  int? id;
  String? title = "";
  String? description = "";
  String? caseName = "";
  String? caseTime = "";
  Sessions({
    this.id,
    this.description,
    this.title,
    this.caseName,
    this.caseTime,
  });

  Sessions.fromMap(Map<String, dynamic> item)
      : description = item["description"],
        title = item['title'],
        caseName = item['casename'],
        caseTime = item['casetime'];

  Map<String, Object> toMap() {
    return {
      'id': id!,
      'description': description!,
      'title': title!,
      'casename': caseName!,
      'casetime': caseTime!
    };
  }
}

class CustomNotifications {
  int? id;
  dynamic title;
  dynamic description;
  dynamic time;

  CustomNotifications({this.id, this.description, this.title, this.time});

  CustomNotifications.fromMap(Map<String, dynamic> item)
      : description = item["description"],
        title = item['title'],
        time = item['time'];

  Map<String, Object> toMap() {
    return {
      'id': id!,
      'description': description,
      'title': title,
      'time': time
    };
  }
}
