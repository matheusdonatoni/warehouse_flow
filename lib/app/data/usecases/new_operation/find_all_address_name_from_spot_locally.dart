import '../../../domain/entities/entities.dart';
import '../../../domain/usecases/new_operation/find_all_address_name_from_spot.dart';

class FindAllAddressNamesFromSpotLocally
    implements FindAllAddressNamesFromSpot {
  @override
  Future<List<String>> call(FindAllAddressNamesFromSpotParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}

class FindAllAddressNamesFromSpotLocallyParams {
  final int spotId;

  FindAllAddressNamesFromSpotLocallyParams({
    required this.spotId,
  });

  factory FindAllAddressNamesFromSpotLocallyParams.fromDomain(
          FindAllAddressNamesFromSpotParams params) =>
      FindAllAddressNamesFromSpotLocallyParams(
        spotId: params.spotId,
      );
}
