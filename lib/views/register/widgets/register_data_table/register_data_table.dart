import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/data/models/operation.dart';
import '../../../../data/helpers/table_source.dart';
import '/controllers/home_controllers/home_controller.dart';

class RegisterDataTable extends GetView<HomeController> {
  const RegisterDataTable({Key? key}) : super(key: key);

  List<Operation> get operations => controller.warehouse.register.operations;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Obx(
        () => PaginatedDataTable(
          header: Text('Operações'),
          columns: [
            DataColumn(label: Text('Produto'), numeric: true),
            DataColumn(label: Text('Quantidade'), numeric: true),
            DataColumn(label: Text('Câmara')),
            DataColumn(label: Text('Rua')),
            DataColumn(label: Text('Número'), numeric: true),
            DataColumn(label: Text('Altura'), numeric: true),
            DataColumn(label: Text('Profundidade'), numeric: true),
            DataColumn(label: Text('Operação')),
            DataColumn(label: Text('Data')),
          ],
          source: TableSource<Operation>(
            data: operations,
            rowBuilder: (int index) => [
              DataCell(Text('${operations[index].product.code}')),
              DataCell(Text(operations[index].formatedAmount)),
              DataCell(Text('${operations[index].chamber.name}')),
              DataCell(Text('${operations[index].street.name}')),
              DataCell(Text('${operations[index].street.number}')),
              DataCell(Text('${operations[index].position.height}')),
              DataCell(Text('${operations[index].position.depth}')),
              DataCell(Text(operations[index].type.valueToStringInPortuguese)),
              DataCell(Text(operations[index].formatedDate)),
            ],
          ),
        ),
      ),
    );
  }
}
