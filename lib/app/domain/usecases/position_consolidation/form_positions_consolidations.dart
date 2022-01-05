import '../../entities/entities.dart';

abstract class FormPositionsConsolidations {
  Future<List<PositionConsolidation>> call();
}
