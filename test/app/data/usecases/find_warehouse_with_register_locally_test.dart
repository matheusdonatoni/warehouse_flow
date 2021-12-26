import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:warehouse_flow/app/data/local_storage/query_helper/query_helper.dart';
import 'package:warehouse_flow/app/data/usecases/find_warehouse_with_register_locally.dart';
import 'package:warehouse_flow/app/domain/usecases/find_warehouse_with_register.dart';

import '../../domain/params_factory.dart';
import '../mocks/sqlite_cursor_spy.dart';

void main() {
  late FindWarehouseWithRegisterLocally sut;
  late SQLiteCursorSpy sqLiteCursor;
  late FindWarehouseWithRegisterParams params;

  setUp(() {
    params = ParamsFactory.makeFindWarehouseWithRegister();

    sqLiteCursor = SQLiteCursorSpy();
    sqLiteCursor.mockExecute([
      {
        'warehouse_name': 'a',
        'spot_name': 'a',
        'address_name': 'a',
        'address_indicator': 'a',
        'position_height': 1,
        'position_depth': 1,
        'position_type': 'a',
        'product_code': 1,
        'product_description': 'a',
        'product_unit': 'a',
        'product_type': 'a',
        'operation_amount': 5.0,
        'operation_type': 'insert',
      }
    ]);
    sqLiteCursor.mockUpdate(1);
    sqLiteCursor.mockInsert(1);
    sqLiteCursor.mockDelete(1);
    sut = FindWarehouseWithRegisterLocally(
      localStorage: sqLiteCursor,
    );
  });

  test('Should make a successful execute query', () async {
    await sut(params);

    verify(
      () => sqLiteCursor.find(
        query: QueryHelper.findWarehouseWithResiter(
          params.id,
        ),
      ),
    );
  });
}
