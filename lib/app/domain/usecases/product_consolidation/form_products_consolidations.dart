import '../../entities/entities.dart';

abstract class FormProductsConsolidations {
  Future<List<ProductConsolidation>> call();
}
