import '../../entities/entities.dart';

abstract class FindAllPositionHeightsFromAddress {
  Future<List<int>> call(
    FindAllPositionHeightsFromAddressParams params,
  );
}

class FindAllPositionHeightsFromAddressParams {
  final int addressId;

  FindAllPositionHeightsFromAddressParams({
    required this.addressId,
  });
}
