import 'package:warehouse_flow/app/data/local_storage/local_storage.dart';
import 'package:warehouse_flow/app/data/local_storage/local_storage_errors.dart';
import 'package:warehouse_flow/app/data/local_storage/query_helper/query_helper.dart';
import 'package:warehouse_flow/app/data/models/local_position_model.dart';
import 'package:warehouse_flow/app/domain/helpers/errors/domain_errors.dart';
import 'package:warehouse_flow/app/domain/usecases/new_operation/find_position_from_height_depth_and_address.dart';

import '../../../domain/entities/entities.dart';

class FindPositionFromHeightDepthAndAddressLocally
    implements FindPositionFromHeightDepthAndAddress {
  final LocalStorage localStorage;

  FindPositionFromHeightDepthAndAddressLocally({required this.localStorage});

  @override
  Future<PositionEntity> call(
      FindPositionFromHeightDepthAndAddressParams params) async {
    final localParams =
        FindPositionFromHeightDepthAndAddressLocallyParams.fromDomain(params);

    try {
      var result = await localStorage.find(
        query: QueryHelper.findPositionFromHeightDepthAndAddress,
        arguments: [
          localParams.height,
          localParams.depth,
          localParams.addressId,
        ],
      );

      return LocalPositionModel.fromMap(result).toEntity();
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

class FindPositionFromHeightDepthAndAddressLocallyParams {
  final int height;
  final int depth;
  final int addressId;

  FindPositionFromHeightDepthAndAddressLocallyParams({
    required this.height,
    required this.depth,
    required this.addressId,
  });

  factory FindPositionFromHeightDepthAndAddressLocallyParams.fromDomain(
          FindPositionFromHeightDepthAndAddressParams params) =>
      FindPositionFromHeightDepthAndAddressLocallyParams(
        height: params.height,
        depth: params.depth,
        addressId: params.addressId,
      );
}
