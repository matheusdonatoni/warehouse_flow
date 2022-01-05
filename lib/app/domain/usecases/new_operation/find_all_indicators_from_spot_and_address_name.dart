import '../../entities/entities.dart';

abstract class FindAllIndicatorsFromSpotAndAddressName {
  Future<List<String>> call(
    FindAllIndicatorsFromSpotAndAddressNameParams params,
  );
}

class FindAllIndicatorsFromSpotAndAddressNameParams {
  final SpotEntity spot;
  final String name;

  FindAllIndicatorsFromSpotAndAddressNameParams({
    required this.spot,
    required this.name,
  });
}
