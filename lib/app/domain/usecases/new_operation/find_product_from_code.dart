import '../../entities/entities.dart';

abstract class FindProductFromCode {
  Future<ProductEntity> call();
}
