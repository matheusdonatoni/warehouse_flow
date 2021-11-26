import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '/controllers/home_controllers/home_controller.dart';
import '/data/models/operation.dart';

class OperationTable extends GetView<HomeController> {
  const OperationTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Obx(
        () => DataTable(
          showBottomBorder: true,
          sortAscending: true,
          sortColumnIndex: 3,
          columns: [
            DataColumn(label: Text('Produto'), numeric: true),
            DataColumn(label: Text('Quantidade'), numeric: true),
            DataColumn(label: Text('Rua')),
            DataColumn(label: Text('Número')),
            DataColumn(label: Text('Altura')),
            DataColumn(label: Text('Profundidade')),
            DataColumn(label: Text('Operação')),
            DataColumn(label: Text('Data')),
          ],
          rows: controller.warehouse.register.operations
              .map(
                (e) => DataRow(
                  cells: [
                    DataCell(
                      Text('${e.product.code}'),
                    ),
                    DataCell(
                      Text(e.formatedAmount),
                    ),
                    DataCell(
                      Text('${e.street.name}'),
                    ),
                    DataCell(
                      Text('${e.street.number}'),
                    ),
                    DataCell(
                      Text('${e.position.height}'),
                    ),
                    DataCell(
                      Text('${e.position.depth}'),
                    ),
                    DataCell(
                      Text(e.type.valueToStringInPortuguese),
                    ),
                    DataCell(
                      Text(e.formatedDate),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
