import '../../entities/entities.dart';

abstract class FindProductFromCode {
  Future<ProductEntity> call(
    FindProductFromCodeParams params,
  );
}

class FindProductFromCodeParams {
  final int code;

  FindProductFromCodeParams({
    required this.code,
  });
}
