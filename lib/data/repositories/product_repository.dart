import 'package:warehouse_flow/data/models/product.dart';

import '_impl/base_repository_impl.dart';

class ProductRepository extends BaseRepositoryImpl {
  Future<Product> findFromCode(String code) async {
    var result = await localStorage.findProductFromCode(code);

    return Product.fromMap(result);
  }
}
