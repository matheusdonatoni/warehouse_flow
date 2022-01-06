import '../../local_storage/local_storage.dart';
import '../../local_storage/local_storage_errors.dart';
import '../../local_storage/query_helper/query_helper.dart';
import '../../models/local_operation_model.dart';
import '../../../domain/entities/operation_entity.dart';
import '../../../domain/helpers/errors/domain_errors.dart';
import '../../../domain/usecases/new_operation/save_new_operation.dart';

class SaveNewOperationLocally implements SaveNewOperation {
  final LocalStorage localStorage;

  SaveNewOperationLocally({required this.localStorage});

  @override
  Future<OperationEntity> call(SaveNewOperationParms params) async {
    final localParams = SaveNewOperationLocallyParms.fromDomain(params);

    try {
      var id = await localStorage.insert(
        query: QueryHelper.insertIntoOperations,
        arguments: [
          localParams.amount,
          localParams.type,
          localParams.productId,
          localParams.positionId,
        ],
      );

      var result = await localStorage.find(
        query: QueryHelper.findOperation,
        arguments: [id],
      );

      return LocalOperationModel.fromMap(result).toEntity();
    } on LocalStorageError catch (error) {
      if (error == LocalStorageError.malformedData) {
        throw DomainError.malformedData;
      } else if (error == LocalStorageError.missingEntity) {
        throw DomainError.missingEntity;
      }

      throw DomainError.unexpected;
    }
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
