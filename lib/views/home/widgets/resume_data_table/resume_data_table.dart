import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/data/utils/table_source.dart';
import '/data/models/product_resume.dart';
import '/controllers/home_controllers/home_controller.dart';

class ResumeDataTable extends GetView<HomeController> {
  const ResumeDataTable({Key? key}) : super(key: key);

  List<ProductResume> get resumes => controller.warehouse.register.resumes;

  int get rowsPerPage {
    var _rowsPerPage =
        (Get.height - 56.0 * 2) ~/ (kMinInteractiveDimension) - 2;

    if (resumes.length < _rowsPerPage) return resumes.length;

    return _rowsPerPage;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => PaginatedDataTable(
        showCheckboxColumn: false,
        rowsPerPage: rowsPerPage,
        columns: [
          DataColumn(label: Text('Produto'), numeric: true),
          DataColumn(label: Text('Consolidado'), numeric: true),
        ],
        source: TableSource(
          rowCount: resumes.length,
          rowBuilder: (int index) => DataRow(
            cells: [
              DataCell(Text('${resumes[index].product.code}')),
              DataCell(Text(resumes[index].formatedAmount)),
            ],
          ),
        ),
      ),
    );
  }
}
