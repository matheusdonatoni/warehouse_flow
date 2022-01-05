import '../../entities/entities.dart';

abstract class FindAllAddressNamesFromSpot {
  Future<List<String>> call();
}

class FindAllAddressNamesFromSpotParams {
  final SpotEntity spot;

  FindAllAddressNamesFromSpotParams({
    required this.spot,
  });
}
