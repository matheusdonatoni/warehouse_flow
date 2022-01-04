import '../../domain/helpers/errors/domain_errors.dart';
import '../../domain/entities/operation_entity.dart';
import '../../domain/usecases/find_warehouse_operations.dart';

import '../local_storage/local_storage_errors.dart';
import '../models/local_operation_model.dart';
import '../local_storage/query_helper/query_helper.dart';
import '../local_storage/local_storage.dart';

class FindWarehouseOperationsLocally implements FindWarehouseOperations {
  final LocalStorage localStorage;

  FindWarehouseOperationsLocally({
    required this.localStorage,
  });

  @override
  Future<List<OperationEntity>> call(
    FindWarehouseOperationsParams params,
  ) async {
    var localParams = FindWarehouseOperationsLocallyParams.fromDomain(params);

    try {
      final result = await localStorage.find(
        query: QueryHelper.findAllProducts,
        arguments: [localParams.warehouseId],
      );

      return List<OperationEntity>.from(
        result.map(
          (map) => LocalOperationModel.fromMap(map).toEntity(),
        ),
      );
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

class FindWarehouseOperationsLocallyParams {
  FindWarehouseOperationsLocallyParams({
    required this.warehouseId,
  });

  final int warehouseId;

  factory FindWarehouseOperationsLocallyParams.fromDomain(
    FindWarehouseOperationsParams params,
  ) =>
      FindWarehouseOperationsLocallyParams(warehouseId: params.id);
}
