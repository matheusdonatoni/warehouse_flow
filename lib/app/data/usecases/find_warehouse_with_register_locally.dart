import '../../domain/entities/entities.dart';
import '../../domain/helpers/errors/domain_errors.dart';
import '../../domain/usecases/find_warehouse_with_register.dart';

import '../local_storage/local_storage.dart';
import '../local_storage/local_storage_errors.dart';
import '../local_storage/query_helper/query_helper.dart';
import '../models/local_warehouse_model.dart';

// working on DB version 5 only

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
