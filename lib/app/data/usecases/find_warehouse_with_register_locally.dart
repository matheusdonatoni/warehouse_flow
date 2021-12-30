import 'package:warehouse_flow/app/data/local_storage/local_storage.dart';
import 'package:warehouse_flow/app/data/local_storage/local_storage_errors.dart';
import 'package:warehouse_flow/app/data/local_storage/query_helper/query_helper.dart';
import 'package:warehouse_flow/app/data/models/local_warehouse_models.dart';
import 'package:warehouse_flow/app/domain/entities/entities.dart';
import 'package:warehouse_flow/app/domain/helpers/domain_errors.dart';
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

    try {
      var result = await localStorage.find(
        query: QueryHelper.findWarehouseWithRegister,
        arguments: [localParams.id],
      );

      return LocalWarehouseModel.fromMap(result).toEntity();
    } on LocalStorageError catch (error) {
      if (error == LocalStorageError.malformedData) {
        throw DomainError.malformedData;
      } else if (error == LocalStorageError.missingEntity) {
        throw DomainError.missingEntity;
      }

      throw DomainError.unexpected;
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
