import 'package:warehouse_flow/app/data/local_storage/local_storage.dart';
import 'package:warehouse_flow/app/data/local_storage/local_storage_errors.dart';
import 'package:warehouse_flow/app/data/local_storage/query_helper/query_helper.dart';
import 'package:warehouse_flow/app/data/models/local_product_model.dart';
import 'package:warehouse_flow/app/domain/entities/product_entity.dart';
import 'package:warehouse_flow/app/domain/helpers/errors/domain_errors.dart';
import 'package:warehouse_flow/app/domain/usecases/products_catalog/find_all_products.dart';

class FindAllProductsLocally implements FindAllProducts {
  final LocalStorage localStorage;

  FindAllProductsLocally({
    required this.localStorage,
  });

  @override
  Future<List<ProductEntity>> call() async {
    try {
      final result = await localStorage.find(
        query: QueryHelper.findAllProducts,
      );

      return List<ProductEntity>.from(
        result.map(
          (map) => LocalProductModel.fromMap(map).toEntity(),
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