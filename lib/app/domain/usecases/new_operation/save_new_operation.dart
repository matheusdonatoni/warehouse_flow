import '../../entities/entities.dart';

abstract class SaveNewOperation {
  Future<OperationEntity> call(SaveNewOperationParms params);
}

class SaveNewOperationParms {
  final int registerId;
  final int spotId;
  final int addressId;
  final int positionId;
  final int productId;
  final String type;
  final double amount;

  SaveNewOperationParms({
    required this.registerId,
    required this.spotId,
    required this.addressId,
    required this.positionId,
    required this.productId,
    required this.type,
    required this.amount,
  });
}
