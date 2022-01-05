import '../../entities/entities.dart';

abstract class FindAllPositionDepthsFromAddressAndPositionHeight {
  Future<List<int>> call(
    FindAllPositionDepthsFromAddressAndPositionHeightParams params,
  );
}

class FindAllPositionDepthsFromAddressAndPositionHeightParams {
  final AddressEntity address;
  final int height;

  FindAllPositionDepthsFromAddressAndPositionHeightParams({
    required this.address,
    required this.height,
  });
}
