import '../../entities/entities.dart';

abstract class FindAllPositionHeightsFromAddress {
  Future<List<int>> call(
    FindAllPositionHeightsFromAddressParams params,
  );
}

class FindAllPositionHeightsFromAddressParams {
  final AddressEntity address;

  FindAllPositionHeightsFromAddressParams({
    required this.address,
  });
}
