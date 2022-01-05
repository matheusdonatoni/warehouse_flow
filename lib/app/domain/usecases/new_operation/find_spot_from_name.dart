import '../../entities/entities.dart';

abstract class FindSpotFromName {
  Future<SpotEntity> call();
}
