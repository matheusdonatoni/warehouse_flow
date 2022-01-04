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
      makeWarehouseWithRegisterMalformedKeyResult() => [
            {
              "malformed_json_key": jsonEncode(
                LocalStorageFactory.makeWarehouseWithRegisterResult(),
              ),
            }
          ];

  static List<Map<String, Object?>>
      makeWarehouseWithRegisterMalformedLengthResult() => [
            {
              "malformed_json_key": jsonEncode(
                LocalStorageFactory.makeWarehouseWithRegisterResult(),
              ),
            },
            {
              "malformed_json_key": jsonEncode(
                LocalStorageFactory.makeWarehouseWithRegisterResult(),
              ),
            }
          ];

  static List<Map<String, Object?>>
      makeWarehouseWithRegisterMalformedValueResult() => [
            {
              "malformed_json_key":
                  LocalStorageFactory.makeWarehouseWithRegisterResult(),
            }
          ];

  static List<Map<String, Object?>> makeAllWarehouseOperationListResult() => [
        {
          "json": jsonEncode(
            LocalStorageFactory.makeWarehouseOperationListResult(),
          ),
        }
      ];

  static List<Map<String, Object?>>
      makeAllWarehouseOperationListMalformedKeyResult() => [
            {
              "malformed_json_key": jsonEncode(
                LocalStorageFactory.makeWarehouseOperationListResult(),
              ),
            }
          ];

  static List<Map<String, Object?>>
      makeAllWarehouseOperationListMalformedLengthResult() => [
            {
              "malformed_json_key": jsonEncode(
                LocalStorageFactory.makeWarehouseOperationListResult(),
              ),
            },
            {
              "malformed_json_key": jsonEncode(
                LocalStorageFactory.makeWarehouseOperationListResult(),
              ),
            }
          ];

  static List<Map<String, Object?>>
      makeAllWarehouseOperationListMalformedValueResult() => [
            {
              "malformed_json_key":
                  LocalStorageFactory.makeWarehouseOperationListResult(),
            }
          ];

  static List<Map<String, Object?>> makeAllProductsListResult() => [
        {"json": jsonEncode(LocalStorageFactory.makeAllProductsListResult())}
      ];
}
