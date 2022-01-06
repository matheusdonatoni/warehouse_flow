import '../../../data/local_storage/local_storage.dart';
import '../../../data/local_storage/local_storage_errors.dart';
import '../../../data/local_storage/query_helper/query_helper.dart';
import '../../../data/models/local_address_model.dart';
import '../../../domain/helpers/errors/domain_errors.dart';
import '../../../domain/entities/entities.dart';
import '../../../domain/usecases/new_operation/find_address_from_name_indicator_and_spot.dart';

class FindAddressFromNameIndicatorAndSpotLocally
    implements FindAddressFromNameIndicatorAndSpot {
  final LocalStorage localStorage;

  FindAddressFromNameIndicatorAndSpotLocally(this.localStorage);

  @override
  Future<AddressEntity> call(
      FindAddressFromNameIndicatorAndSpotParams params) async {
    final localParams =
        FindAddressFromNameIndicatorAndSpotLocallyParams.fromDomain(params);

    try {
      var result = await localStorage.find(
        query: QueryHelper.findAddressFromNameIndicatorAndSpot,
        arguments: [
          localParams.name,
          localParams.indicator,
          localParams.spotId,
        ],
      );

      return LocalAddressModel.fromMap(result).toEntity();
    } on LocalStorageError catch (error) {
      if (error == LocalStorageError.malformedData) {
        throw DomainError.malformedData;
      } else if (error == LocalStorageError.missingEntity) {
        throw DomainError.missingEntity;
      }

      throw DomainError.unexpected;
    }
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
