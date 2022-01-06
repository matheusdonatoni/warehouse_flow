import 'package:warehouse_flow/app/data/local_storage/local_storage.dart';
import 'package:warehouse_flow/app/data/local_storage/local_storage_errors.dart';
import 'package:warehouse_flow/app/data/local_storage/query_helper/query_helper.dart';
import 'package:warehouse_flow/app/domain/helpers/errors/domain_errors.dart';
import 'package:warehouse_flow/app/domain/usecases/new_operation/find_all_position_depths_from_address_and_position_height.dart';

class FindAllPositionDepthsFromAddressAndPositionHeightLocally
    implements FindAllPositionDepthsFromAddressAndPositionHeight {
  final LocalStorage localStorage;

  FindAllPositionDepthsFromAddressAndPositionHeightLocally(this.localStorage);

  @override
  Future<List<int>> call(
      FindAllPositionDepthsFromAddressAndPositionHeightParams params) async {
    final localParams =
        FindAllPositionDepthsFromAddressAndPositionHeightLocallyParams
            .fromDomain(
      params,
    );

    try {
      return await localStorage.find(
        query: QueryHelper.findPositionDepthsFromAddressAndPositionHeight,
        arguments: [localParams.addressId, localParams.height],
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

class FindAllPositionDepthsFromAddressAndPositionHeightLocallyParams {
  final int addressId;
  final int height;

  FindAllPositionDepthsFromAddressAndPositionHeightLocallyParams({
    required this.addressId,
    required this.height,
  });

  factory FindAllPositionDepthsFromAddressAndPositionHeightLocallyParams.fromDomain(
    FindAllPositionDepthsFromAddressAndPositionHeightParams params,
  ) =>
      FindAllPositionDepthsFromAddressAndPositionHeightLocallyParams(
        addressId: params.addressId,
        height: params.height,
      );
}
