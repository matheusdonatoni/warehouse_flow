import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:warehouse_flow/app/data/local_storage/query_helper/query_helper.dart';
import 'package:warehouse_flow/app/data/usecases/new_operation/find_address_from_name_indicator_and_spot_locally.dart';
import 'package:warehouse_flow/app/domain/usecases/new_operation/find_address_from_name_indicator_and_spot.dart';

import '../../mocks/local_storage_factory.dart';
import '../../mocks/local_storage_spy.dart';

void main() {
  late FindAddressFromNameIndicatorAndSpotParams params;
  late FindAddressFromNameIndicatorAndSpotLocally sut;
  late LocalStorageSpy localStorage;
  late Map<String, dynamic> databaseResult;

  setUp(() {
    params = FindAddressFromNameIndicatorAndSpotParams(
      name: 'Rua A',
      indicator: '1',
      spotId: 1,
    );
    databaseResult = LocalStorageFactory.makeAddressResult();
    localStorage = LocalStorageSpy();
    localStorage.mockFind(databaseResult);
    sut = FindAddressFromNameIndicatorAndSpotLocally(
      localStorage: localStorage,
    );
  });

  test('Should make a successful find query', () async {
    await sut(params);

    verify(
      () => localStorage.find(
        query: QueryHelper.findAddressFromNameIndicatorAndSpot,
        arguments: [
          'Rua A',
          '1',
          1,
        ],
      ),
    );
  });
}
