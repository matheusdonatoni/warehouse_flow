import 'package:warehouse_flow/app/domain/usecases/new_operation/find_all_position_depths_from_address_and_position_height.dart';

import '../../../domain/entities/entities.dart';

class FindAllPositionDepthsFromAddressAndPositionHeightLocally
    implements FindAllPositionDepthsFromAddressAndPositionHeight {
  @override
  Future<List<int>> call(
      FindAllPositionDepthsFromAddressAndPositionHeightParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}

class FindAllPositionDepthsFromAddressAndPositionHeightLocallyParams {
  final int addressId;
  final int height;

  FindAllPositionDepthsFromAddressAndPositionHeightLocallyParams({
    required this.addressId,
    required this.height,
  });

  factory FindAllPositionDepthsFromAddressAndPositionHeightLocallyParams.fromDomain(
    FindAllPositionDepthsFromAddressAndPositionHeightParams params,
  ) =>
      FindAllPositionDepthsFromAddressAndPositionHeightLocallyParams(
        addressId: params.addressId,
        height: params.height,
      );
}
