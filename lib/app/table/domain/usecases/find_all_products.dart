import 'package:dartz/dartz.dart';
import '../repositories/product_repository.dart';

import '../errors/table_exception.dart';
import '../entities/product.dart';

abstract class FindAllProducts {
  Future<Either<TableException, List<Product>>> call();
}

class FindAllProductsImpl implements FindAllProducts {
  final ProductRepository repository;

  FindAllProductsImpl(this.repository);

  @override
  Future<Either<TableException, List<Product>>> call() async {
    var option = none();

    return option.fold(
      () => Left(DataSourceException()),
      (_) async {
        var result = await repository.findAll();

        return result.where((r) => r.isNotEmpty, () => EmptyListException());
      },
    );
  }
}
