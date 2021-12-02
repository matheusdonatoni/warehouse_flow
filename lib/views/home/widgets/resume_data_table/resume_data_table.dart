import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/helpers/table_source.dart';
import '/data/models/product_resume.dart';
import '/controllers/home_controllers/home_controller.dart';

class ResumeDataTable extends GetView<HomeController> {
  const ResumeDataTable({Key? key}) : super(key: key);

  List<ProductResume> get resumes => controller.warehouse.register.resumes;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Obx(
        () => PaginatedDataTable(
          header: Text('Resumo'),
          
          columns: [
            DataColumn(
              label: Text('Produto'),
              numeric: true,
              onSort: (index, ascending) {},
            ),
            DataColumn(
              label: Text('Consolidado'),
              numeric: true,
              onSort: (index, ascending) {},
            ),
          ],
          source: TableSource<ProductResume>(
            data: resumes,
            rowBuilder: (int index) => [
              DataCell(Text('${resumes[index].product.code}')),
              DataCell(Text(resumes[index].formatedAmount)),
            ],
          ),
        ),
      ),
    );
  }
}
