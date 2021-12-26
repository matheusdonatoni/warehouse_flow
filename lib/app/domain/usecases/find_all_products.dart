import 'package:warehouse_flow/app/domain/entities/entities.dart';


abstract class FindAllProducts {
  Future<List<ProductEntity>> call();
}
