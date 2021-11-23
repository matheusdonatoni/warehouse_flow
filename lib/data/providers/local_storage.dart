import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../utils/constants.dart';

import '../models/operation.dart';
import '../models/position.dart';
import '../models/register.dart';
import '../models/warehouse.dart';
import '../models/chamber.dart';
import '../models/street.dart';

class LocalStorage {
  LocalStorage._init();

  late final Database _database;

  Future<List<Map<String, dynamic>>> findWarehouseEagerLoading(int id) async {
    final sql = '''SELECT 
                $kWarehouseAliasQuery,
                $kChamberAliasQuery,
                $kStreetAliasQuery,
                $kPositionAliasQuery,
                $kRegisterAliasQuery,
                $kOperationAliasQuery,
                $kProductAliasQuery
                FROM warehouses as w
                LEFT JOIN chambers as c
                ON c.warehouseid = w.id
                LEFT JOIN streets as s
                ON s.chamberid = c.id
                LEFT JOIN positions as p
                ON p.streetid = s.id
                LEFT JOIN registers as r
                ON r.positionId = p.id
                LEFT JOIN operations as o
                ON o.registerId = r.id
                LEFT JOIN products as pr
                ON o.productId = pr.id
                WHERE w.id = ?''';

    final result = _database.rawQuery(sql, [id]);

    return result;
  }

  Future<Map<String, dynamic>> findWarehouse(int id) async {
    var result = await _database.rawQuery(
      'SELECT * FROM warehouses WHERE id = $id',
    );

    try {
      return result.single;
    } catch (e) {
      throw e;
    }
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
    String name,
  ) async {
    var result = await _database.rawQuery(
      'SELECT * FROM chambers WHERE name = "$name"',
    );

    try {
      return result.single;
    } catch (e) {
      throw e;
    }
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

    try {
      return result.single;
    } catch (e) {
      throw e;
    }
  }

  Future<List<Map<String, dynamic>>> findPositions(
    Street street,
  ) async {
    var result = await _database.rawQuery(
      'SELECT * FROM positions WHERE streetId = ${street.id}',
    );

    return result;
  }

  Future<List<Map<String, dynamic>>> findPosition(
    Street street,
    Position position,
  ) async {
    var result = await _database.rawQuery(
      '''SELECT
      $kPositionAliasQuery,
      $kRegisterAliasQuery,
      $kOperationAliasQuery,
      $kProductAliasQuery
      FROM positions AS p
      LEFT JOIN registers as r
      ON r.positionid = p.id
      LEFT JOIN operations as o
      ON o.registerid = r.id
      LEFT JOIN products as pr
      ON pr.id = o.productid
      WHERE p.streetid = ${street.id} 
      AND p.height = ${position.height} 
      AND p.depth = ${position.depth}''',
    );

    return result;
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
    int? height,
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

    try {
      return result.single;
    } catch (e) {
      throw e;
    }
  }

  Future<Map<String, dynamic>> findRegisterFromPosition(
    Position position,
  ) async {
    var result = await _database.rawQuery(
      '''SELECT * FROM registers 
      WHERE positionId = ${position.id}''',
    );

    return result.single;
  }

  Future<Map<String, dynamic>> createOperation(
    Operation operation,
    Register register,
  ) async {
    var id = await _database.rawInsert(
      '''INSERT INTO operations 
      (amount, type, registerid, productid, createdat, updatedat) 
      VALUES 
      (${operation.amount}, "${operation.type.valueToString()}", ${register.id}, 
      ${operation.product.id}, "$kNowtoIso", "$kNowtoIso")''',
    );

    var result = await _database.rawQuery(
      '''SELECT
      $kOperationAliasQuery,
      $kProductAliasQuery
      FROM operations AS o
      LEFT JOIN products as pr
      ON pr.id = o.productId
      WHERE o.id = $id''',
    );

    return result.single;
  }

  Future<List<Map<String, dynamic>>> findOperationsFromRegister(
    Register register,
  ) async {
    var result = await _database.rawQuery(
      '''SELECT * FROM operations WHERE registerid = ${register.id}''',
    );

    return result;
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
