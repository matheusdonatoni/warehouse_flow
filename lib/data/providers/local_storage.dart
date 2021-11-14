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

  Future<void> _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  Future<void> _onCreate(Database db, int version) async {
    _migrations(db);
  }

  Future<void> _migrations(Database db) async {
    // Create Warehouse table
    await db.execute(
      '''CREATE TABLE warehouses
      (
        id INTEGER PRIMARY KEY, 
        name TEXT,
        createdAt TEXT,
        updatedAt TEXT
      )''',
    );

    // Create Chamber table
    await db.execute(
      '''CREATE TABLE chambers
      (
        id INTEGER PRIMARY KEY, 
        name TEXT,
        warehouseId INTEGER,
        createdAt TEXT,
        updatedAt TEXT,
        FOREIGN KEY (warehouseId) REFERENCES warehouses(id) ON UPDATE CASCADE
      )''',
    );

    // Create Street table
    await db.execute(
      '''CREATE TABLE streets
      (
        id INTEGER PRIMARY KEY, 
        name TEXT,
        number INTEGER,
        chamberId INTEGER,
        createdAt TEXT,
        updatedAt TEXT,
        FOREIGN KEY (chamberId) REFERENCES chambers(id) ON UPDATE CASCADE
      )''',
    );

    // Create Position table
    await db.execute(
      '''CREATE TABLE positions
      (
        id INTEGER PRIMARY KEY, 
        height INTEGER,
        depth INTEGER,
        type TEXT,
        streetId INTEGER,
        createdAt TEXT,
        updatedAt TEXT,
        FOREIGN KEY (streetId) REFERENCES streets(id) ON UPDATE CASCADE
      )''',
    );

    // Create register table
    await db.execute(
      '''CREATE TABLE registers
      (
        id INTEGER PRIMARY KEY,
        positionId INTEGER,
        createdAt TEXT,
        updatedAt TEXT,
        FOREIGN KEY (positionId) REFERENCES positions(id) ON UPDATE CASCADE
      )''',
    );

    // Create Product table
    await db.execute(
      '''CREATE TABLE products
      (
        id INTEGER PRIMARY KEY, 
        code TEXT,
        description TEXT,
        unit TEXT,
        type TEXT,
        createdAt TEXT,
        updatedAt TEXT
      )''',
    );

    // Create Operation table
    await db.execute(
      '''CREATE TABLE operations
      (
        id INTEGER PRIMARY KEY,
        amount REAL,
        type TEXT,
        registerId INTEGER,
        productId INTEGER,
        createdAt TEXT,
        updatedAt TEXT,
        FOREIGN KEY (registerId) REFERENCES registers(id) ON UPDATE CASCADE
        FOREIGN KEY (productId) REFERENCES products(id) ON UPDATE CASCADE
      )''',
    );
  }
}
