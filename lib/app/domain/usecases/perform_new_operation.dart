import '../entities/entities.dart';

abstract class PerformNewOperation {
  Future<OperationEntity> call(PerformNewOperationParms params);
}

class PerformNewOperationParms {
  final int registerId;
  final int spotId;
  final int addressId;
  final int positionId;
  final int productId;
  final String type;
  final double amount;

  PerformNewOperationParms({
    required this.registerId,
    required this.spotId,
    required this.addressId,
    required this.positionId,
    required this.productId,
    required this.type,
    required this.amount,
  });
}
