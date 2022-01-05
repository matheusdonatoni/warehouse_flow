import 'package:warehouse_flow/app/domain/usecases/new_operation/find_product_from_code.dart';

import '../../../domain/entities/entities.dart';

class FindProductFromCodeLocally implements FindProductFromCode {
  @override
  Future<ProductEntity> call(FindProductFromCodeParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}

class FindProductFromCodeLocallyParams {
  final int code;

  FindProductFromCodeLocallyParams({
    required this.code,
  });

  factory FindProductFromCodeLocallyParams.fromDomain(
          FindProductFromCodeParams params) =>
      FindProductFromCodeLocallyParams(code: params.code);
}
