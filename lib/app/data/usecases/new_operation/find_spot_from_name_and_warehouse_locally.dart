import 'package:warehouse_flow/app/data/local_storage/local_storage.dart';
import 'package:warehouse_flow/app/data/local_storage/local_storage_errors.dart';
import 'package:warehouse_flow/app/data/local_storage/query_helper/query_helper.dart';
import 'package:warehouse_flow/app/data/models/local_spot_model.dart';
import 'package:warehouse_flow/app/domain/helpers/errors/domain_errors.dart';
import 'package:warehouse_flow/app/domain/usecases/new_operation/find_spot_from_name_and_warehouse.dart';

import '../../../domain/entities/entities.dart';

class FindSpotFromNameAndWarehouseLocally
    implements FindSpotFromNameAndWarehouse {
  final LocalStorage localStorage;

  FindSpotFromNameAndWarehouseLocally({required this.localStorage});

  @override
  Future<SpotEntity> call(FindSpotFromNameAndWarehouseParams params) async {
    final localParams = FindSpotFromNameAndWarehouseLocallyParams.fromDomain(
      params,
    );

    try {
      var result = await localStorage.find(
        query: QueryHelper.findSpotFromNameAndWarehouse,
        arguments: [localParams.name, localParams.warehouseId],
      );

      return LocalSpotModel.fromMap(result).toEntity();
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

class FindSpotFromNameAndWarehouseLocallyParams {
  final String name;
  final int warehouseId;

  FindSpotFromNameAndWarehouseLocallyParams({
    required this.name,
    required this.warehouseId,
  });

  factory FindSpotFromNameAndWarehouseLocallyParams.fromDomain(
          FindSpotFromNameAndWarehouseParams params) =>
      FindSpotFromNameAndWarehouseLocallyParams(
        name: params.name,
        warehouseId: params.warehouseId,
      );
}
