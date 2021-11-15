import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '/data/models/warehouse.dart';
import '/data/models/chamber.dart';
import '/data/models/street.dart';

class LocalStorage {
  LocalStorage._init();

  late final Database _database;

  static Future<LocalStorage> init() async {
    WidgetsFlutterBinding.ensureInitialized();

    final localStorage = LocalStorage._init();

    final path = join(await getDatabasesPath(), 'warehouse_flow.db');

    if (!await databaseExists(path)) {
      final directory = Directory(await getDatabasesPath());

      if (!await directory.exists()) {
        await directory.create(recursive: true);
      }

      ByteData data = await rootBundle.load(
        join(
          "assets",
          "warehouse_flow.db",
        ),
      );

      List<int> bytes = data.buffer.asUint8List(
        data.offsetInBytes,
        data.lengthInBytes,
      );

      await File(path).writeAsBytes(bytes, flush: true);
    }

    localStorage._database = await openDatabase(path);

    return localStorage;
  }

  Future<Map<String, dynamic>> findWarehouse(int id) async {
    var result = await _database.rawQuery(
      'SELECT * FROM warehouses WHERE id = $id',
    );

    return result.single;
  }

  Future<List<Map<String, dynamic>>> findChambersFromWarehouse(
    Warehouse warehouse,
  ) async {
    var result = await _database.rawQuery(
      'SELECT * FROM chambers WHERE warehouseId = ${warehouse.id}',
    );

    return result;
  }

  Future<List<Map<String, dynamic>>> findStreersFromChamber(
    Chamber chamber,
  ) async {
    var result = await _database.rawQuery(
      'SELECT * FROM streets WHERE chamberId = ${chamber.id}',
    );

    return result;
  }

  Future<List<Map<String, dynamic>>> findPositionsFromStreet(
    Street street,
  ) async {
    var result = await _database.rawQuery(
      'SELECT * FROM positions WHERE streetId = ${street.id}',
    );

    return result;
  }

  Future<Map<String, dynamic>> findProductFromCode(int code) async {
    var result = await _database.rawQuery(
      'SELECT * FROM products WHERE code = 34129',
    );

    return result.single;
  }
}
