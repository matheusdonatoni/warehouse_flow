import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:warehouse_flow/data/models/position.dart';
import '/data/models/warehouse.dart';
import '/data/models/chamber.dart';
import '/data/models/street.dart';

class LocalStorage {
  LocalStorage._init();

  late final Database _database;

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

  Future<List<Map<String, dynamic>>> findChamberNames(
    Warehouse warehouse,
  ) async {
    var result = await _database.rawQuery(
      'SELECT name FROM chambers WHERE warehouseid = ${warehouse.id}',
    );

    return result;
  }

  Future<Map<String, dynamic>> findChamberFromName(
    String? name,
  ) async {
    var result = await _database.rawQuery(
      'SELECT * FROM chambers WHERE name = "$name"',
    );

    return result.single;
  }

  Future<List<Map<String, dynamic>>> findStreets(
    Chamber? chamber,
  ) async {
    var result = await _database.rawQuery(
      'SELECT * FROM streets WHERE chamberId = ${chamber?.id}',
    );

    return result;
  }

  Future<List<Map<String, dynamic>>> findStreetNames(Chamber chamber) async {
    var result = await _database.rawQuery(
      'SELECT DISTINCT name FROM streets WHERE chamberid = ${chamber.id}',
    );

    return result;
  }

  Future<List<Map<String, dynamic>>> findStreetNumbers(
    Chamber chamber,
    String? name,
  ) async {
    var result = await _database.rawQuery(
      '''SELECT DISTINCT number 
      FROM streets WHERE chamberid = ${chamber.id} 
      AND name = "$name"''',
    );

    return result;
  }

  Future<Map<String, dynamic>> findStreetFromAddress(
    Chamber chamber,
    Street street,
  ) async {
    var result = await _database.rawQuery(
      '''SELECT * FROM streets 
      WHERE chamberid = ${chamber.id} 
      AND name = "${street.name}" 
      AND number = ${street.number}''',
    );

    return result.single;
  }

  Future<List<Map<String, dynamic>>> findPositions(
    Street street,
  ) async {
    var result = await _database.rawQuery(
      'SELECT * FROM positions WHERE streetId = ${street.id}',
    );

    return result;
  }

  Future<Map<String, dynamic>> findPosition(
    Street street,
    Position position,
  ) async {
    var result = await _database.rawQuery(
      '''SELECT * FROM positions
       WHERE streetid = ${street.id} 
       AND height = ${position.height} 
       AND depth = ${position.depth}''',
    );

    return result.single;
  }

  Future<List<Map<String, dynamic>>> findPositionHeights(
    Street street,
  ) async {
    var result = await _database.rawQuery(
      '''SELECT DISTINCT height 
      FROM positions 
      WHERE streetId = ${street.id}''',
    );

    return result;
  }

  Future<List<Map<String, dynamic>>> findPositionDepths(
    Street street,
    int height,
  ) async {
    var result = await _database.rawQuery(
      '''SELECT DISTINCT depth 
      FROM positions 
      WHERE streetId = ${street.id} 
      AND height = $height''',
    );

    return result;
  }

  Future<Map<String, dynamic>> findProductFromCode(String? code) async {
    var result = await _database.rawQuery(
      'SELECT * FROM products WHERE code = $code',
    );

    return result.single;
  }

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
}
