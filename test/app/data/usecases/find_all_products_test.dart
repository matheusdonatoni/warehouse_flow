import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:warehouse_flow/app/data/usecases/find_all_products_locally.dart';

import '../../infra/database_factory.dart';
import '../mocks/local_storage_spy.dart';

void main() {
  late FindAllProductsLocally sut;
  late LocalStorageSpy localStorage;
  late List<Map<String, dynamic>> databaseResult;

  setUp(() {
    databaseResult =
        DatabaseFactory.makeAllProductsListResultJson();
    localStorage = LocalStorageSpy();
    localStorage.mockFind(databaseResult);
    sut = FindAllProductsLocally(localStorage: localStorage);
  });

  
}
