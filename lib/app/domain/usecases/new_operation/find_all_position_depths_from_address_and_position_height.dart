import '../../entities/entities.dart';

abstract class FindAllPositionDepthsFromAddressAndPositionHeight {
  Future<List<int>> call(
    FindAllPositionDepthsFromAddressAndPositionHeightParams params,
  );
}

class FindAllPositionDepthsFromAddressAndPositionHeightParams {
  final int addressId;
  final int height;

  FindAllPositionDepthsFromAddressAndPositionHeightParams({
    required this.addressId,
    required this.height,
  });
}
