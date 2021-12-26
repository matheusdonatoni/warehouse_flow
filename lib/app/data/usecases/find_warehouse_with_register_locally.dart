import 'package:warehouse_flow/app/data/local_storage/local_storage.dart';
import 'package:warehouse_flow/app/data/local_storage/local_storage_errors.dart';
import 'package:warehouse_flow/app/data/local_storage/query_helper/query_helper.dart';
import 'package:warehouse_flow/app/data/models/local_warehouse_models.dart';
import 'package:warehouse_flow/app/domain/entities/entities.dart';
import 'package:warehouse_flow/app/domain/usecases/find_warehouse_with_register.dart';

class FindWarehouseWithRegisterLocally implements FindWarehouseWithRegister {
  final LocalStorage localStorage;

  FindWarehouseWithRegisterLocally({
    required this.localStorage,
  });

  @override
  Future<WarehouseEntity> call(FindWarehouseWithRegisterParams params) async {
    final localParams = FindWarehouseWithRegisterLocallyParams.fromDomain(
      params,
    );

    var result = await localStorage.find(
      query: QueryHelper.findWarehouseWithResiter(
        localParams.id,
      ),
    );

    try {
      if (result.single['json'] is String) {
        return LocalWarehouseModel.fromJson(result.single['json']).toEntity();
      }

      throw LocalStorageError.unexpectedFormat;
    } catch (_) {
      throw LocalStorageError.unknown;
    }
  }
}

class FindWarehouseWithRegisterLocallyParams {
  final int id;

  FindWarehouseWithRegisterLocallyParams({
    required this.id,
  });

  factory FindWarehouseWithRegisterLocallyParams.fromDomain(
          FindWarehouseWithRegisterParams params) =>
      FindWarehouseWithRegisterLocallyParams(
        id: params.id,
      );
}
