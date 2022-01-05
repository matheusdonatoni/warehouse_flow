import 'package:warehouse_flow/app/domain/entities/operation_entity.dart';
import 'package:warehouse_flow/app/domain/usecases/new_operation/save_new_operation.dart';

class SaveNewOperationLocally implements SaveNewOperation {
  @override
  Future<OperationEntity> call(SaveNewOperationParms params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}

class SaveNewOperationLocallyParms {
  final int positionId;
  final int productId;
  final String type;
  final double amount;

  SaveNewOperationLocallyParms({
    required this.positionId,
    required this.productId,
    required this.type,
    required this.amount,
  });

  factory SaveNewOperationLocallyParms.fromDomain(
          SaveNewOperationParms params) =>
      SaveNewOperationLocallyParms(
        positionId: params.positionId,
        productId: params.productId,
        type: params.type,
        amount: params.amount,
      );
}
