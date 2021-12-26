import 'package:warehouse_flow/app/data/local_storage/local_storage.dart';
import 'package:warehouse_flow/app/data/local_storage/local_storage_errors.dart';
import 'package:warehouse_flow/app/data/local_storage/query_helper/query_helper.dart';
import 'package:warehouse_flow/app/data/models/local_product_models.dart';
import 'package:warehouse_flow/app/domain/entities/product_entity.dart';
import 'package:warehouse_flow/app/domain/usecases/find_all_products.dart';

class FindAllProductsLocally implements FindAllProducts {
  final LocalStorage sqLiteCursor;

  FindAllProductsLocally({
    required this.sqLiteCursor,
  });

  @override
  Future<List<ProductEntity>> call() async {
    final result = await sqLiteCursor.find(
      query: QueryHelper.findAllProducts(),
    );

    if (result.isEmpty) throw LocalStorageError.notFound;

    final products = List<ProductEntity>.from(
      result.map<ProductEntity>(
        (map) => LocalProductModel.fromMap(map).toEntity(),
      ),
    );

    if (products.isEmpty) throw LocalStorageError.notFound;

    return products;
  }
}
