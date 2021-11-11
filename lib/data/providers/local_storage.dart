import 'package:flutter/widgets.dart';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalStorage {
  LocalStorage._init();

  late final Database _database;

  static Future<LocalStorage> init() async {
    WidgetsFlutterBinding.ensureInitialized();

    final localStorage = LocalStorage._init();

    localStorage._database = await openDatabase(
      join(await getDatabasesPath(), 'warehouse.db'),
      onCreate: localStorage._onCreate,
      onConfigure: localStorage._onConfigure,
      version: 1,
    );

    return localStorage;
  }

  Future _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  Future _onCreate(Database db, int version) async {
    // Create Warehouse table
    await db.execute(
      '''CREATE TABLE Warehouse
      (
        id INTEGER PRIMARY KEY, 
        name TEXT, 
      )''',
    );

    // Create Chamber table
    await db.execute(
      '''CREATE TABLE Chamber
      (
        id INTEGER PRIMARY KEY, 
        name TEXT,
        warehouseId INTEGER,
        FOREIGN KEY (warehouseId) REFERENCES Warehouse(id) 
        ON UPDATE CASACADE
      )''',
    );

    // Create Street table
    await db.execute(
      '''CREATE TABLE Street
      (
        id INTEGER PRIMARY KEY, 
        name TEXT,
        chamberId INTEGER,
        FOREIGN KEY (chamberId) REFERENCES Chamber(id) 
        ON UPDATE CASACADE
      )''',
    );

    // Create Position table
    await db.execute(
      '''CREATE TABLE position
      (
        id INTEGER PRIMARY KEY, 
        name TEXT,
        height INTEGER,
        depth INTEGER,
        streetId INTEGER,
        FOREIGN KEY (streetId) REFERENCES Street(id) 
        ON UPDATE CASACADE
      )''',
    );
  }
}
