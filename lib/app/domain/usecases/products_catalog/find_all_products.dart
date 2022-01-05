import '../../entities/entities.dart';

abstract class FindAllProducts {
  Future<List<ProductEntity>> call();
}
