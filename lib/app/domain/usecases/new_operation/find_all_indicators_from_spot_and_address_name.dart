import '../../entities/entities.dart';

abstract class FindAllIndicatorsFromSpotAndAddressName {
  Future<List<String>> call(
    FindAllIndicatorsFromSpotAndAddressNameParams params,
  );
}

class FindAllIndicatorsFromSpotAndAddressNameParams {
  final int spotId;
  final String name;

  FindAllIndicatorsFromSpotAndAddressNameParams({
    required this.spotId,
    required this.name,
  });
}
