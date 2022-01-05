import '../../entities/entities.dart';

abstract class FindPositionFromHeightDepthAndAddress {
  Future<PositionEntity> call(
    FindPositionFromHeightDepthAndAddressParams params,
  );
}

class FindPositionFromHeightDepthAndAddressParams {
  final int height;
  final int depth;
  final AddressEntity address;

  FindPositionFromHeightDepthAndAddressParams({
    required this.height,
    required this.depth,
    required this.address,
  });
}
