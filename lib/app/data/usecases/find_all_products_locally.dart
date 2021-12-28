import 'package:warehouse_flow/app/data/local_storage/local_storage.dart';
import 'package:warehouse_flow/app/data/local_storage/local_storage_errors.dart';
import 'package:warehouse_flow/app/data/local_storage/query_helper/query_helper.dart';
import 'package:warehouse_flow/app/data/models/local_product_models.dart';
import 'package:warehouse_flow/app/domain/entities/product_entity.dart';
import 'package:warehouse_flow/app/domain/helpers/domain_errors.dart';
import 'package:warehouse_flow/app/domain/usecases/find_all_products.dart';

class FindAllProductsLocally implements FindAllProducts {
  final LocalStorage localStorage;

  FindAllProductsLocally({
    required this.localStorage,
  });

  @override
  Future<List<ProductEntity>> call() async {
    try {
      final result = await localStorage.find(
        query: QueryHelper.findAllProducts(),
      );

      return List<ProductEntity>.from(
        result.map<ProductEntity>(
          (map) => LocalProductModel.fromMap(map).toEntity(),
        ),
      );
    } on LocalStorageError catch (error) {
      if (error == LocalStorageError.unexpectedFormat) {
        throw DomainError.malformedData;
      } else if (error == LocalStorageError.notFound) {
        throw DomainError.missingEntity;
      }

      throw DomainError.unexpected;
    }
  }
}
