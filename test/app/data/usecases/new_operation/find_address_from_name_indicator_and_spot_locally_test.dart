import 'package:flutter_test/flutter_test.dart';
import 'package:warehouse_flow/app/data/usecases/new_operation/find_address_from_name_indicator_and_spot_locally.dart';

import '../../mocks/local_storage_factory.dart';
import '../../mocks/local_storage_spy.dart';

void main() {
  late FindAddressFromNameIndicatorAndSpotLocally sut;
  late LocalStorageSpy localStorage;
  late List<Map<String, dynamic>> databaseResult;

  setUp(() {
    databaseResult = LocalStorageFactory.makeAllProductsListResult();
    localStorage = LocalStorageSpy();
    localStorage.mockFind(databaseResult);
    sut = FindAddressFromNameIndicatorAndSpotLocally(
      localStorage: localStorage,
    );
  });
}
