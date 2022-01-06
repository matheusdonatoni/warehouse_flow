import 'package:warehouse_flow/app/data/local_storage/local_storage.dart';
import 'package:warehouse_flow/app/data/local_storage/local_storage_errors.dart';
import 'package:warehouse_flow/app/data/local_storage/query_helper/query_helper.dart';
import 'package:warehouse_flow/app/domain/helpers/errors/domain_errors.dart';
import 'package:warehouse_flow/app/domain/usecases/new_operation/find_all_spot_names_from_warehouse.dart';

class FindAllSpotFromWarehouseLocally implements FindAllSpotNamesFromWarehouse {
  final LocalStorage localStorage;

  FindAllSpotFromWarehouseLocally(this.localStorage);

  @override
  Future<List<String>> call(FindAllSpotNamesFromWarehouseParams params) async {
    final localParams = FindAllSpotFromWarehouseLocallyParams.fromDomain(
      params,
    );

    try {
      return await localStorage.find(
        query: QueryHelper.findSpotNamesFromWarehouse,
        arguments: [localParams.warehouseId],
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

class FindAllSpotFromWarehouseLocallyParams {
  final int warehouseId;

  FindAllSpotFromWarehouseLocallyParams({
    required this.warehouseId,
  });

  factory FindAllSpotFromWarehouseLocallyParams.fromDomain(
          FindAllSpotNamesFromWarehouseParams params) =>
      FindAllSpotFromWarehouseLocallyParams(
        warehouseId: params.warehouseId,
      );
}
