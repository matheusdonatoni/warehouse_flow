import 'package:dartz/dartz.dart';
import '../datasources/product_datasource.dart';
import '../../domain/errors/table_exception.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository {
  final ProductDatasource datasource;

  ProductRepositoryImpl(this.datasource);

  @override
  Future<Either<TableException, List<Product>>> findAll() {
    // TODO: implement findAll
    throw UnimplementedError();
  }
}
