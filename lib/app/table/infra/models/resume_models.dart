import '../../domain/entities/resume.dart';
import '../../domain/entities/position.dart';
import '../../domain/entities/product.dart';

class ResumeModel extends Resume {
  ResumeModel({
    required Product product,
    required int amount,
  }) : super(
          product: product,
          amount: amount,
        );
}

class WarehouseResume extends ResumeModel {
  WarehouseResume({
    required Product product,
    required int amount,
  }) : super(
          product: product,
          amount: amount,
        );
}

class PositionResume extends ResumeModel {
  PositionResume({
    required Product product,
    required this.position,
    int amount = 0,
  }) : super(
          product: product,
          amount: amount,
        );

  Position position;
}
