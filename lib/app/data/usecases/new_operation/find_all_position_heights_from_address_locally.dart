import 'package:warehouse_flow/app/data/local_storage/local_storage.dart';
import 'package:warehouse_flow/app/data/local_storage/local_storage_errors.dart';
import 'package:warehouse_flow/app/data/local_storage/query_helper/query_helper.dart';
import 'package:warehouse_flow/app/domain/helpers/errors/domain_errors.dart';
import 'package:warehouse_flow/app/domain/usecases/new_operation/find_all_position_heights_from_address.dart';

class FindAllPositionHeightsFromAddressLocally
    implements FindAllPositionHeightsFromAddress {
  final LocalStorage localStorage;

  FindAllPositionHeightsFromAddressLocally({required this.localStorage});

  @override
  Future<List<int>> call(FindAllPositionHeightsFromAddressParams params) async {
    final localParams =
        FindAllPositionHeightsFromAddressLocallyParams.fromDomain(
      params,
    );

    try {
      return await localStorage.find(
        query: QueryHelper.findPositionHeightsFromAddress,
        arguments: [localParams.addressId],
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

class FindAllPositionHeightsFromAddressLocallyParams {
  final int addressId;

  FindAllPositionHeightsFromAddressLocallyParams({
    required this.addressId,
  });

  factory FindAllPositionHeightsFromAddressLocallyParams.fromDomain(
          FindAllPositionHeightsFromAddressParams params) =>
      FindAllPositionHeightsFromAddressLocallyParams(
        addressId: params.addressId,
      );
}
