import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:intl/intl.dart';

import '_impl/base_model.dart';
import 'spot.dart';
import 'position.dart';
import 'product.dart';
import 'address.dart';

class RxOperation {
  final id = Rxn<int>();
  final amount = Rx<double>(0.0);
  final type = Rx<OperationType>(OperationType.insert);
  final product = Rx<Product>(Product());
  final spot = Rx<Spot>(Spot());
  final address = Rx<Address>(Address());
  final position = Rx<Position>(Position());
  final createdAt = Rxn<DateTime>();
  final updatedAt = Rxn<DateTime>();
}

class Operation extends BaseModel {
  Operation({
    int? id,
    double? amount,
    OperationType? type,
    Product? product,
    Spot? spot,
    Address? address,
    Position? position,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    this.id = id;

    this.amount = amount ?? 0;
    assert(this.amount >= 0);

    this.type = type ?? OperationType.insert;
    this.product = product ?? Product();
    this.spot = spot ?? Spot();
    this.address = address ?? Address();
    this.position = position ?? Position();
    this.createdAt = createdAt;
    this.updatedAt = updatedAt;
  }

  final rx = RxOperation();

  int? get id => rx.id.value;
  set id(int? value) => rx.id.value = value;

  double get amount => rx.amount.value;
  set amount(double value) => rx.amount.value = value;

  OperationType get type => rx.type.value;
  set type(OperationType value) => rx.type.value = value;

  Product get product => rx.product.value;
  set product(Product value) => rx.product.value = value;

  Spot get spot => rx.spot.value;
  set spot(Spot value) => rx.spot.value = value;

  Address get address => rx.address.value;
  set address(Address value) => rx.address.value = value;

  Position get position => rx.position.value;
  set position(Position value) => rx.position.value = value;

  DateTime? get createdAt => rx.createdAt.value;
  set createdAt(DateTime? value) => rx.createdAt.value = value;

  DateTime? get updatedAt => rx.updatedAt.value;
  set updatedAt(DateTime? value) => rx.updatedAt.value = value;

  bool get isEmpty => amount == 0;
  bool get isNotEmpty => amount > 0;

  bool get isInsertion => type == OperationType.insert;
  bool get isRemoval => !isInsertion;

  String get formatedAmount => NumberFormat("#,##0.##", 'pt-br').format(
        amount,
      );

  String get formatedDate {
    if (createdAt == null) return 'Sem registro';

    return DateFormat('dd/MM/yy - H:mm').format(createdAt!);
  }

  Operation copyWith({
    int? id,
    double? amount,
    OperationType? type,
    Product? product,
    Spot? spot,
    Address? address,
    Position? position,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Operation(
        id: id ?? this.id,
        amount: amount ?? this.amount,
        type: type ?? this.type,
        product: product ?? this.product,
        spot: spot ?? this.spot,
        address: address ?? this.address,
        position: position ?? this.position,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Operation.fromJson(String str) => Operation.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Operation.fromMap(Map<String, dynamic> json) => Operation(
        id: json["id"],
        amount: json["amount"],
        product: Product.fromMap(json["product"] ?? {}),
        spot: Spot.fromMap(json["spot"] ?? {}),
        address: Address.fromMap(json["address"] ?? {}),
        position: Position.fromMap(json["position"] ?? {}),
        type: Operation.parseType(json["type"] ?? ''),
        createdAt: DateTime.tryParse(json["createdAt"] ?? ''),
        updatedAt: DateTime.tryParse(json["updatedAt"] ?? ''),
      );

  factory Operation.fromAliasesMap(
    Map<String, dynamic> json, {
    Product? product,
    Spot? spot,
    Address? address,
    Position? position,
  }) =>
      Operation(
        id: json["o_id"],
        amount: json["amount"],
        product: product,
        spot: spot,
        address: address,
        position: position,
        type: Operation.parseType(json["o_type"] ?? ''),
        createdAt: DateTime.tryParse(json["o_createdAt"] ?? ''),
        updatedAt: DateTime.tryParse(json["o_updatedAt"] ?? ''),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "amount": amount,
        "type": type.valueToString(),
        "product": product.toMap(),
        "spot": spot.toMap(),
        "address": address.toMap(),
        "position": position.toMap(),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };

  Map<String, dynamic> toDataTable() => {
        "Produto": product.code,
        "Descrição": product.description,
        "Quantidade": formatedAmount,
        "Local": spot.name,
        "Endereço": address.name,
        "Indicador": address.indicator,
        "Altura": position.height,
        "Profundidade": position.depth,
        "Operação": type.valueToStringInPT,
        "Data": formatedDate,
      };

  @override
  String toString() => toMap().toString();

  static OperationType parseType(String formattedOperation) {
    if (formattedOperation == 'insert') {
      return OperationType.insert;
    } else if (formattedOperation == 'remove') {
      return OperationType.remove;
    }

    return OperationType.insert;
  }
}

enum OperationType { insert, remove }

extension OperationExt on OperationType {
  String valueToString() {
    return this.toString().split('.').last;
  }

  String get valueToStringInPT {
    if (this == OperationType.insert) {
      return 'Inserção';
    } else {
      return 'Remoção';
    }
  }
}
