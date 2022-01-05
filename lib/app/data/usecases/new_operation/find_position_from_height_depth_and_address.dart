import 'package:warehouse_flow/app/domain/usecases/new_operation/find_position_from_height_depth_and_address.dart';

import '../../../domain/entities/entities.dart';

class FindPositionFromHeightDepthAndAddressLocally
    implements FindPositionFromHeightDepthAndAddress {
  @override
  Future<PositionEntity> call(
      FindPositionFromHeightDepthAndAddressParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}

class FindPositionFromHeightDepthAndAddressLocallyParams {
  final int height;
  final int depth;
  final int addressId;

  FindPositionFromHeightDepthAndAddressLocallyParams({
    required this.height,
    required this.depth,
    required this.addressId,
  });

  factory FindPositionFromHeightDepthAndAddressLocallyParams.fromDomain(
          FindPositionFromHeightDepthAndAddressParams params) =>
      FindPositionFromHeightDepthAndAddressLocallyParams(
        height: params.height,
        depth: params.depth,
        addressId: params.addressId,
      );
}
