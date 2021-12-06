import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../views/widgets/export_file_button/export_file_button.dart';
import '../../../../data/models/operation.dart';
import '../../../../data/utils/table_source.dart';
import '/controllers/home_controllers/home_controller.dart';

class RegisterDataTable extends GetView<HomeController> {
  const RegisterDataTable({Key? key}) : super(key: key);

  List<Operation> get operations => controller.warehouse.register.operations;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => SizedBox(
        width: constraints.maxWidth,
        child: Obx(
          () => PaginatedDataTable(
            header: Text('Operações'),
            actions: [
              ExportFileButton(
                json: controller.warehouse.register.operationsJsonDataTable(),
                fileName: 'Operações',
              ),
            ],
            columns: [
              DataColumn(label: Text('Produto'), numeric: true),
              DataColumn(label: Text('Descrição')),
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
                DataCell(Text('${operations[index].product.parsedCode}')),
                DataCell(Text('${operations[index].product.description}')),
                DataCell(Text(operations[index].formatedAmount)),
                DataCell(Text('${operations[index].chamber.name}')),
                DataCell(Text('${operations[index].street.name}')),
                DataCell(Text('${operations[index].street.number}')),
                DataCell(Text('${operations[index].position.height}')),
                DataCell(Text('${operations[index].position.depth}')),
                DataCell(Text(operations[index].type.valueToStringInPT)),
                DataCell(Text(operations[index].formatedDate)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
