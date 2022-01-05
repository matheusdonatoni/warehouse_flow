import '../../../domain/usecases/new_operation/find_all_indicators_from_spot_and_address_name.dart';
import '../../../domain/entities/entities.dart';

class FindAllIndicatorsFromSpotAndAddressNameLocally
    implements FindAllIndicatorsFromSpotAndAddressName {
  @override
  Future<List<String>> call(
      FindAllIndicatorsFromSpotAndAddressNameParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}

class FindAllIndicatorsFromSpotAndAddressNameLocallyParams {
  final int spotId;
  final String name;

  FindAllIndicatorsFromSpotAndAddressNameLocallyParams({
    required this.spotId,
    required this.name,
  });

  factory FindAllIndicatorsFromSpotAndAddressNameLocallyParams.fromDomain(
          FindAllIndicatorsFromSpotAndAddressNameParams params) =>
      FindAllIndicatorsFromSpotAndAddressNameLocallyParams(
        spotId: params.spotId,
        name: params.name,
      );
}
