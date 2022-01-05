import '../../entities/entities.dart';

abstract class FindPositionFromHeightDepthAndAddress {
  Future<PositionEntity> call();
}