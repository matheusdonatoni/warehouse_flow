import 'dart:convert';

import 'package:warehouse_flow/app/domain/entities/entities.dart';

import 'local_address_model.dart';
import 'local_position_models.dart';
import 'local_product_models.dart';
import 'local_spot_models.dart';

class LocalOperationModel {
  LocalOperationModel({
    this.id,
    required this.amount,
    required this.type,
    required this.product,
    required this.spot,
    required this.address,
    required this.position,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  double amount;
  String type;
  ProductEntity product;
  SpotEntity spot;
  AddressEntity address;
  PositionEntity position;

  factory LocalOperationModel.fromJson(String str) =>
      LocalOperationModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LocalOperationModel.fromMap(Map<String, dynamic> json) =>
      LocalOperationModel(
        id: json["operation_id"],
        amount: json["operation_amount"] ?? 0.0,
        product: LocalProductModel.fromMap(json).toEntity(),
        spot: LocalSpotModel.fromMap(json).toEntity(),
        address: LocalAddressModel.fromMap(json).toEntity(),
        position: LocalPositionModel.fromMap(json).toEntity(),
        type: json["operation_type"] ?? '',
        createdAt: DateTime.tryParse(json["operation_createdAt"] ?? ''),
        updatedAt: DateTime.tryParse(json["operation_updatedAt"] ?? ''),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "amount": amount,
        "type": type.toString(),
        "product": LocalProductModel.fromEntity(product).toMap(),
        "spot": LocalSpotModel.fromEntity(spot).toMap(),
        "address": LocalAddressModel.fromEntity(address).toMap(),
        "position": LocalPositionModel.fromEntity(position).toMap(),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };

  factory LocalOperationModel.fromEntity(OperationEntity entity) =>
      LocalOperationModel(
        id: entity.id,
        amount: entity.amount,
        product: entity.product,
        spot: entity.spot,
        address: entity.address,
        position: entity.position,
        type: entity.type,
        createdAt: entity.createdAt,
        updatedAt: entity.updatedAt,
      );

  OperationEntity toEntity() => OperationEntity(
        id: id,
        amount: amount,
        product: product,
        spot: spot,
        address: address,
        position: position,
        type: type,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}
