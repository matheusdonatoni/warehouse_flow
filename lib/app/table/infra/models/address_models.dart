import 'position_models.dart';
import '../../domain/entities/address.dart';
import '../../domain/entities/position.dart';

class AddressModel extends Address {
  AddressModel({
    int? id,
    String name = '',
    String indicator = '',
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super(
          id: id,
          name: name,
          indicator: indicator,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  factory AddressModel.fromMap(Map<String, dynamic> json) => AddressModel(
        id: json["id"],
        name: json["name"],
        indicator: json["indicator"],
        createdAt: DateTime.tryParse(json["createdAt"] ?? ''),
        updatedAt: DateTime.tryParse(json["updatedAt"] ?? ''),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "indicator": indicator,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

class AliasedAddressModel extends AddressModel {
  AliasedAddressModel({
    int? id,
    String name = '',
    String indicator = '',
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super(
          id: id,
          name: name,
          indicator: indicator,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  factory AliasedAddressModel.fromMap(Map<String, dynamic> json) =>
      AliasedAddressModel(
        id: json["address_id"],
        name: json["address_name"],
        indicator: json["address_indicator"],
        createdAt: DateTime.tryParse(json["address_createdAt"] ?? ''),
        updatedAt: DateTime.tryParse(json["address_updatedAt"] ?? ''),
      );
}
