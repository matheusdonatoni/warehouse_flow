import 'package:dartz/dartz.dart';
import '../errors/table_exception.dart';
import '../entities/product.dart';

abstract class ProductRepository {
  Future<Either<TableException, List<Product>>> findAll();
}
