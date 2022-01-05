import '../../entities/entities.dart';

abstract class SaveNewOperation {
  Future<OperationEntity> call(
    SaveNewOperationParms params,
  );
}

class SaveNewOperationParms {
  final int positionId;
  final int productId;
  final String type;
  final double amount;

  SaveNewOperationParms({
    required this.positionId,
    required this.productId,
    required this.type,
    required this.amount,
  });
}
