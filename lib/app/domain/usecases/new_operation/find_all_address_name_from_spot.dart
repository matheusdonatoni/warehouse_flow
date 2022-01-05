import '../../entities/entities.dart';

abstract class FindAllAddressNamesFromSpot {
  Future<List<String>> call(
    FindAllAddressNamesFromSpotParams params,
  );
}

class FindAllAddressNamesFromSpotParams {
  final int spotId;

  FindAllAddressNamesFromSpotParams({
    required this.spotId,
  });
}
