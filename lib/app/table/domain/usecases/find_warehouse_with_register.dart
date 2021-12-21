import 'package:dartz/dartz.dart';
import '../repositories/warehouse_repository.dart';
import '../entities/warehouse.dart';
import '../errors/table_exception.dart';

abstract class FindWarehouseWithRegister {
  Future<Either<TableException, Warehouse>> call(int id);
}

class FindWarehouseWithRegisterImpl implements FindWarehouseWithRegister {
  final WarehouseRepository repository;

  FindWarehouseWithRegisterImpl(this.repository);

  @override
  Future<Either<TableException, Warehouse>> call(int id) async {
    print('rodo!');

    var option = optionOf(id);

    return option.fold(
      () => Left(EmptyValueException()),
      (id) async {
        return await repository.findWithRegisterById(id);
      },
    );
  }
}
