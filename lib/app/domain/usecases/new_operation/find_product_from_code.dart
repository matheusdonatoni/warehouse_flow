import '../../entities/entities.dart';

abstract class FindProductFromCode {
  Future<ProductEntity> call();
}

class FindProductFromCodeParams {
  final int code;

  FindProductFromCodeParams({
    required this.code,
  });
}
