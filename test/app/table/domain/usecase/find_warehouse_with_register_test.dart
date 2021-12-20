import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../../../lib/app/table/domain/entities/register.dart';
import '../../../../../lib/app/table/domain/entities/warehouse.dart';
import '../../../../../lib/app/table/domain/repositories/warehouse_repository.dart';
import '../../../../../lib/app/table/domain/usecases/find_warehouse_with_register.dart';

class MockWarehouseRepository extends Mock implements WarehouseRepository {}

main() {
  final repository = MockWarehouseRepository();
  final usecase = FindWarehouseWithRegisterImpl(repository);

  test('should return a Warehouse instance', () async {
    when(() => repository.findWithRegisterById(1)).thenAnswer(
      (_) async => right(
        Warehouse(
          name: 'ADP',
          register: Register(operations: []),
        ),
      ),
    );

    var result = await usecase(1);

    expect(result, isA<Warehouse>());
  });
}
