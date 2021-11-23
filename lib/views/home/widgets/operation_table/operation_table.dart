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
            DataColumn(label: Text('Operação')),
            DataColumn(label: Text('Data')),
          ],
          rows: controller.warehouse.operations
              .map(
                (e) => DataRow(
                  cells: [
                    DataCell(
                      Text('${e.product.code}'),
                    ),
                    DataCell(
                      Text(
                        '${NumberFormat("#,##0.##", 'pt-br').format(
                          e.amount,
                        )}',
                      ),
                    ),
                    DataCell(
                      Text(
                        '${e.type.valueToStringInPortuguese()}',
                      ),
                    ),
                    DataCell(
                      Text('${DateFormat('dd/MM/yyyy').format(
                        e.createdAt!,
                      )}'),
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
