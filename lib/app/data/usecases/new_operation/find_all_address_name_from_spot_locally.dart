import 'package:warehouse_flow/app/data/local_storage/local_storage.dart';
import 'package:warehouse_flow/app/data/local_storage/local_storage_errors.dart';
import 'package:warehouse_flow/app/data/local_storage/query_helper/query_helper.dart';
import 'package:warehouse_flow/app/domain/helpers/errors/domain_errors.dart';
import '../../../domain/usecases/new_operation/find_all_address_name_from_spot.dart';

class FindAllAddressNamesFromSpotLocally
    implements FindAllAddressNamesFromSpot {
  final LocalStorage localStorage;

  FindAllAddressNamesFromSpotLocally(this.localStorage);

  @override
  Future<List<String>> call(FindAllAddressNamesFromSpotParams params) async {
    final localParams = FindAllAddressNamesFromSpotLocallyParams.fromDomain(
      params,
    );

    try {
      return await localStorage.find(
        query: QueryHelper.findAddressNamesFromSpot,
        arguments: [localParams.spotId],
      );
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
