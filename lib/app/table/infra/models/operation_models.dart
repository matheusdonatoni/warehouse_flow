import 'address_models.dart';
import 'position_models.dart';
import 'product_models.dart';
import 'spot_models.dart';

import '../../domain/entities/address.dart';
import '../../domain/entities/position.dart';
import '../../domain/entities/product.dart';
import '../../domain/entities/spot.dart';
import '../../domain/entities/operation.dart';

class OperationModel extends Operation {
  OperationModel({
    int? id,
    double amount = 0,
    required String type,
    required Product product,
    required Spot spot,
    required Address address,
    required Position position,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super(
          id: id,
          amount: amount,
          type: type,
          product: product,
          spot: spot,
          address: address,
          position: position,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  factory OperationModel.fromMap(Map<String, dynamic> json) => OperationModel(
        id: json["id"],
        amount: json["amount"],
        product: ProductModel.fromMap(json["product"] ?? {}),
        spot: SpotModel.fromMap(json["spot"] ?? {}),
        address: AddressModel.fromMap(json["address"] ?? {}),
        position: PositionModel.fromMap(json["position"] ?? {}),
        type: json["type"],
        createdAt: DateTime.tryParse(json["createdAt"] ?? ''),
        updatedAt: DateTime.tryParse(json["updatedAt"] ?? ''),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "amount": amount,
        "type": type.toString(),
        "product": (product as ProductModel).toMap(),
        "spot": (spot as SpotModel).toMap(),
        "address": (address as AddressModel).toMap(),
        "position": (position as PositionModel).toMap(),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

class AliasedOperationModel extends OperationModel {
  AliasedOperationModel({
    int? id,
    double amount = 0,
    required String type,
    required Product product,
    required Spot spot,
    required Address address,
    required Position position,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super(
          id: id,
          amount: amount,
          type: type,
          product: product,
          spot: spot,
          address: address,
          position: position,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  factory AliasedOperationModel.fromMap(
    Map<String, dynamic> json, {
    required Product product,
    required Spot spot,
    required Address address,
    required Position position,
  }) =>
      AliasedOperationModel(
        id: json["operation_id"],
        amount: json["operation_amount"],
        product: product,
        spot: spot,
        address: address,
        position: position,
        type: json["operation_type"],
        createdAt: DateTime.tryParse(json["operation_createdAt"] ?? ''),
        updatedAt: DateTime.tryParse(json["operation_updatedAt"] ?? ''),
      );
}
