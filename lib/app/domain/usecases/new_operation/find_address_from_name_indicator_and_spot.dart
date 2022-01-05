import 'package:warehouse_flow/app/domain/entities/entities.dart';

import '../../entities/address_entity.dart';

abstract class FindAddressFromNameIndicatorAndSpot {
  Future<AddressEntity> call(
    FindAddressFromNameIndicatorAndSpotParams params,
  );
}

class FindAddressFromNameIndicatorAndSpotParams {
  final String name;
  final String indicator;
  final SpotEntity spot;

  FindAddressFromNameIndicatorAndSpotParams({
    required this.name,
    required this.indicator,
    required this.spot,
  });
}
