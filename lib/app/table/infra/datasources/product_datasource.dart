import '../models/product_models.dart';

abstract class ProductDatasource {
  Future<List<ProductModel>> findAll();
}
