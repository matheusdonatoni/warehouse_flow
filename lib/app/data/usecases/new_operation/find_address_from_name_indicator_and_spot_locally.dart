import '../../../domain/entities/entities.dart';
import '../../../domain/usecases/new_operation/find_address_from_name_indicator_and_spot.dart';

class FindAddressFromNameIndicatorAndSpotLocally
    implements FindAddressFromNameIndicatorAndSpot {
  @override
  Future<AddressEntity> call(FindAddressFromNameIndicatorAndSpotParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}

class FindAddressFromNameIndicatorAndSpotLocallyParams {
  final String name;
  final String indicator;
  final int spotId;

  FindAddressFromNameIndicatorAndSpotLocallyParams({
    required this.name,
    required this.indicator,
    required this.spotId,
  });

  factory FindAddressFromNameIndicatorAndSpotLocallyParams.fromDomain(
    FindAddressFromNameIndicatorAndSpotParams params,
  ) =>
      FindAddressFromNameIndicatorAndSpotLocallyParams(
        name: params.name,
        indicator: params.indicator,
        spotId: params.spotId,
      );
}
