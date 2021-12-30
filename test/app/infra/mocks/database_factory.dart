import 'dart:convert';

import '../../data/mocks/local_storage_factory.dart';

class DatabaseFactory {
  static List<Map<String, dynamic>> makeWarehouseWithRegisterResult() => [
        {
          "json": jsonEncode(
            LocalStorageFactory.makeWarehouseWithRegisterResult(),
          ),
        }
      ];

  static List<Map<String, dynamic>> makeAllProductsListResult() => [
        {"json": jsonEncode(LocalStorageFactory.makeAllProductsListResult())}
      ];
}
