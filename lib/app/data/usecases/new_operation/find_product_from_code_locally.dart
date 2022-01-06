import 'package:warehouse_flow/app/data/local_storage/local_storage.dart';
import 'package:warehouse_flow/app/data/local_storage/local_storage_errors.dart';
import 'package:warehouse_flow/app/data/local_storage/query_helper/query_helper.dart';
import 'package:warehouse_flow/app/data/models/local_product_model.dart';
import 'package:warehouse_flow/app/domain/helpers/errors/domain_errors.dart';
import 'package:warehouse_flow/app/domain/usecases/new_operation/find_product_from_code.dart';

import '../../../domain/entities/entities.dart';

class FindProductFromCodeLocally implements FindProductFromCode {
  final LocalStorage localStorage;

  FindProductFromCodeLocally({required this.localStorage});

  @override
  Future<ProductEntity> call(FindProductFromCodeParams params) async {
    final localParams = FindProductFromCodeLocallyParams.fromDomain(params);

    try {
      var result = await localStorage.find(
        query: QueryHelper.findProductFromCode,
        arguments: [localParams.code],
      );

      return LocalProductModel.fromMap(result).toEntity();
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

class FindProductFromCodeLocallyParams {
  final int code;

  FindProductFromCodeLocallyParams({
    required this.code,
  });

  factory FindProductFromCodeLocallyParams.fromDomain(
          FindProductFromCodeParams params) =>
      FindProductFromCodeLocallyParams(code: params.code);
}
