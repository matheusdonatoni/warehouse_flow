import 'package:warehouse_flow/app/domain/usecases/new_operation/find_all_position_heights_from_address.dart';

import '../../../domain/entities/entities.dart';

class FindAllPositionHeightsFromAddressLocally
    implements FindAllPositionHeightsFromAddress {
  @override
  Future<List<int>> call(FindAllPositionHeightsFromAddressParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}

class FindAllPositionHeightsFromAddressLocallyParams {
  final int addressId;

  FindAllPositionHeightsFromAddressLocallyParams({
    required this.addressId,
  });

  factory FindAllPositionHeightsFromAddressLocallyParams.toDomain(
          FindAllPositionHeightsFromAddressParams params) =>
      FindAllPositionHeightsFromAddressLocallyParams(
        addressId: params.addressId,
      );
}
