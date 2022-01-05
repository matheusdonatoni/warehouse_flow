import '../../entities/entities.dart';

abstract class FindAllSpotFromWarehouse {
  Future<List<SpotEntity>> call();
}
