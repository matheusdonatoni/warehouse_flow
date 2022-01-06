import 'package:warehouse_flow/app/data/local_storage/local_storage.dart';
import 'package:warehouse_flow/app/data/local_storage/local_storage_errors.dart';
import 'package:warehouse_flow/app/data/local_storage/query_helper/query_helper.dart';
import 'package:warehouse_flow/app/domain/helpers/errors/domain_errors.dart';

import '../../../domain/usecases/new_operation/find_all_indicators_from_spot_and_address_name.dart';

class FindAllIndicatorsFromSpotAndAddressNameLocally
    implements FindAllIndicatorsFromSpotAndAddressName {
  final LocalStorage localStorage;

  FindAllIndicatorsFromSpotAndAddressNameLocally({required this.localStorage});

  @override
  Future<List<String>> call(
      FindAllIndicatorsFromSpotAndAddressNameParams params) async {
    final localParams =
        FindAllIndicatorsFromSpotAndAddressNameLocallyParams.fromDomain(
      params,
    );

    try {
      return await localStorage.find(
        query: QueryHelper.findAddressIndicatorFromSpotAndAddressName,
        arguments: [localParams.spotId, localParams.name],
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
