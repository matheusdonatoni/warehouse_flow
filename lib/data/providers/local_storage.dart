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
import '../models/spot.dart';
import '../models/address.dart';

class LocalStorage {
  LocalStorage._create();

  late final Database _database;

  Future<List<Object?>> findWarehouseEagerLoadAll(int id) async {
    final batch = _database.batch();

    final spaceSql = '''SELECT 
                      $kWarehouseAliasQuery,
                      $kSpotAliasQuery,
                      $kAddressAliasQuery,
                      $kPositionAliasQuery
                      FROM warehouses as w
                      LEFT JOIN spots as s
                      ON s.warehouseId = w.id
                      LEFT JOIN addresses as a
                      ON a.spotId = s.id
                      LEFT JOIN positions as p
                      ON p.addressId = a.id
                      WHERE w.id = ?''';

    final registerSql = '''SELECT 
                        $kRegisterAliasQuery,
                        $kSpotAliasQuery,
                        $kAddressAliasQuery,
                        $kPositionAliasQuery,
                        $kOperationAliasQuery,
                        $kProductAliasQuery
                        FROM registers as r
                        LEFT JOIN operations as o
                        ON r.id = o.registerId
                        LEFT JOIN spots as s
                        ON s.id = o.spotId
                        LEFT JOIN addresses as a
                        ON a.id = o.addressId
                        LEFT JOIN positions as p
                        ON p.id = o.positionId
                        LEFT JOIN products as pr
                        ON pr.id = o.productId
                        WHERE r.warehouseId = ?
                        ORDER BY o.createdAt DESC''';

    batch.rawQuery(spaceSql, [id]);
    batch.rawQuery(registerSql, [id]);

    return await batch.commit();
  }

  Future<List<Map<String, dynamic>>> findWarehouseEagerLoadRegister(
    int id,
  ) async {
    final sql = '''SELECT 
                $kWarehouseAliasQuery,
                $kRegisterAliasQuery,
                $kSpotAliasQuery,
                $kAddressAliasQuery,
                $kPositionAliasQuery,
                $kOperationAliasQuery,
                $kProductAliasQuery
                FROM warehouses as w
                LEFT JOIN registers as r
                ON w.id = r.warehouseId
                LEFT JOIN operations as o
                ON r.id = o.registerId
                LEFT JOIN spots as s
                ON s.id = o.spotId
                LEFT JOIN addresses as a
                ON a.id = o.addressId
                LEFT JOIN positions as p
                ON p.id = o.positionId
                LEFT JOIN products as pr
                ON pr.id = o.productId
                WHERE r.warehouseId = ?
                ORDER BY o.createdAt DESC''';

    return _database.rawQuery(sql, [id]);
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

  Future<List<Map<String, dynamic>>> findSpotsFromWarehouse(
    Warehouse warehouse,
  ) async {
    var result = await _database.rawQuery(
      'SELECT * FROM spots WHERE warehouseId = ${warehouse.id}',
    );

    return result;
  }

  Future<List<Map<String, dynamic>>> findSpotNames(
    Warehouse warehouse,
  ) async {
    var result = await _database.rawQuery(
      'SELECT name FROM spots WHERE warehouseid = ${warehouse.id}',
    );

    return result;
  }

  Future<Map<String, dynamic>> findSpotFromName(
    String name,
  ) async {
    var result = await _database.rawQuery(
      'SELECT * FROM spots WHERE name = "$name"',
    );

    try {
      return result.single;
    } catch (e) {
      throw e;
    }
  }

  Future<List<Map<String, dynamic>>> findAddresses(
    Spot? spot,
  ) async {
    var result = await _database.rawQuery(
      'SELECT * FROM addresses WHERE spotId = ${spot?.id}',
    );

    return result;
  }

  Future<List<Map<String, dynamic>>> findAddressNames(Spot spot) async {
    var result = await _database.rawQuery(
      'SELECT DISTINCT name FROM addresses WHERE spotid = ${spot.id}',
    );

    return result;
  }

  Future<List<Map<String, dynamic>>> findAddressIndicators(
    Spot spot,
    String? name,
  ) async {
    var result = await _database.rawQuery(
      '''SELECT DISTINCT indicator 
      FROM addresses WHERE spotid = ${spot.id} 
      AND name = "$name"''',
    );

    return result;
  }

  Future<Map<String, dynamic>> findAddressFromAddress(
    Spot spot,
    Address address,
  ) async {
    var result = await _database.rawQuery(
      '''SELECT * FROM addresses 
      WHERE spotId = ${spot.id} 
      AND name = "${address.name}" 
      AND indicator = "${address.indicator}"''',
    );

    try {
      return result.single;
    } catch (e) {
      throw e;
    }
  }

  Future<List<Map<String, dynamic>>> findPositions(
    Address address,
  ) async {
    var result = await _database.rawQuery(
      'SELECT * FROM positions WHERE addressId = ${address.id}',
    );

    return result;
  }

  Future<Map<String, dynamic>> findPosition(
    Address address,
    Position position,
  ) async {
    var result = await _database.rawQuery(
      '''SELECT * FROM positions
      WHERE addressid = ${address.id} 
      AND height = ${position.height} 
      AND depth = ${position.depth}''',
    );

    return result.single;
  }

  Future<List<Map<String, dynamic>>> findPositionHeights(
    Address address,
  ) async {
    var result = await _database.rawQuery(
      '''SELECT DISTINCT height 
      FROM positions 
      WHERE addressId = ${address.id}''',
    );

    return result;
  }

  Future<List<Map<String, dynamic>>> findPositionDepths(
    Address address,
    int? height,
  ) async {
    var result = await _database.rawQuery(
      '''SELECT DISTINCT depth 
      FROM positions 
      WHERE addressId = ${address.id} 
      AND height = $height''',
    );

    return result;
  }

  Future<Map<String, dynamic>> findProductFromCode(int? code) async {
    var result = await _database.rawQuery(
      'SELECT * FROM products WHERE code = $code',
    );

    try {
      return result.single;
    } catch (e) {
      throw e;
    }
  }

  Future<List<Map<String, dynamic>>> findAllProducts() async {
    var result = await _database.rawQuery(
      'SELECT * FROM products ORDER BY code ASC',
    );

    return result;
  }

  Future<List<Map<String, dynamic>>> findAllProductUnits() async {
    var result = await _database.rawQuery(
      'SELECT DISTINCT unit FROM products',
    );

    return result;
  }

  Future<List<Map<String, dynamic>>> findAllProductTypes() async {
    var result = await _database.rawQuery(
      'SELECT DISTINCT type FROM products',
    );

    return result;
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
      (amount, type, registerid, productid, spotId, 
      addressId, positionId, createdat, updatedat) 
      VALUES 
      (${operation.amount}, "${operation.type.valueToString()}", ${register.id}, 
      ${operation.product.id}, ${operation.spot.id}, ${operation.address.id},
      ${operation.position.id}, "$kNowToIso", "$kNowToIso")''',
    );

    var result = await _database.rawQuery(
      '''SELECT
      $kOperationAliasQuery,
      $kProductAliasQuery,
      $kSpotAliasQuery,
      $kAddressAliasQuery,
      $kPositionAliasQuery
      FROM operations AS o
      LEFT JOIN products as pr
      ON pr.id = o.productId
      LEFT JOIN spots as s
      ON s.id = o.spotId
      LEFT JOIN addresses as a
      ON a.id = o.addressId
      LEFT JOIN positions as p
      ON p.id = o.positionId
      WHERE o.id = $id''',
    );

    return result.single;
  }

  Future<List<Map<String, dynamic>>> findOperationsFromRegister(
    Register register,
  ) async {
    var result = await _database.rawQuery(
      '''SELECT
      $kOperationAliasQuery,
      $kProductAliasQuery,
      $kSpotAliasQuery,
      $kAddressAliasQuery,
      $kPositionAliasQuery
      FROM operations AS o
      LEFT JOIN products as pr
      ON pr.id = o.productId
      LEFT JOIN spots as s
      ON s.id = o.spotId
      LEFT JOIN addresses as a
      ON a.id = o.addressId
      LEFT JOIN positions as p
      ON p.id = o.positionId
      WHERE registerid = ${register.id}''',
    );

    return result;
  }

  static Future<LocalStorage> init() async {
    WidgetsFlutterBinding.ensureInitialized();

    final localStorage = LocalStorage._create();

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
