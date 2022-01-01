import 'dart:convert';

import '../../data/mocks/local_storage_factory.dart';

class DatabaseFactory {
  static List<Map<String, Object?>> makeWarehouseWithRegisterResult() => [
        {
          "json": jsonEncode(
            LocalStorageFactory.makeWarehouseWithRegisterResult(),
          ),
        }
      ];

  static List<Map<String, Object?>>
      makeWarehouseWithMalformedRegisterResult() => [
            {
              "malformed_json_key": jsonEncode(
                LocalStorageFactory.makeWarehouseWithRegisterResult(),
              ),
            }
          ];

  static List<Map<String, Object?>> makeAllProductsListResult() => [
        {"json": jsonEncode(LocalStorageFactory.makeAllProductsListResult())}
      ];
}
