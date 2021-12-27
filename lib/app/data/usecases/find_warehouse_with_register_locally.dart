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
        query: QueryHelper.findWarehouseWithRegister(
          localParams.id,
        ),
      );

      return LocalWarehouseModel.fromJson(result.single['json']).toEntity();
    } on LocalStorageError catch (error) {
      if (error == LocalStorageError.unexpectedFormat) {
        throw DomainError.malformedData;
      } else if (error == LocalStorageError.notFound) {
        throw DomainError.missingEntity;
      }

      throw DomainError.unexpected;
    } on DomainError catch (error) {
      throw error;
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
