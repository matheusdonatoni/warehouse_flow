import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../views/widgets/export_file_button/export_file_button.dart';
import '../../../../data/models/product.dart';
import '../../../../data/utils/table_source.dart';
import '../../../../controllers/products_controller/products_controller.dart';

class ProductDataTable extends GetView<ProductsController> {
  const ProductDataTable({Key? key}) : super(key: key);

  RxList<Product> get products => controller.filteredList;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => SizedBox(
        width: constraints.maxWidth,
        child: Obx(
          () => PaginatedDataTable(
            header: Text('Produtos'),
            actions: [
              ExportFileButton(
                json: products.toString(),
                fileName: 'Resumo',
              ),
            ],
            columns: [
              DataColumn(
                label: Text('Código'),
                numeric: true,
                onSort: (index, _) =>
                    controller.showColumnFilterBottomSheet(index),
              ),
              DataColumn(
                label: Text('Descrição'),
                onSort: (index, _) =>
                    controller.showColumnFilterBottomSheet(index),
              ),
              DataColumn(
                label: Text('Unidade'),
                onSort: (index, _) =>
                    controller.showColumnFilterBottomSheet(index),
              ),
              DataColumn(
                label: Text('Tipo'),
                onSort: (index, _) =>
                    controller.showColumnFilterBottomSheet(index),
              ),
            ],
            source: TableSource<Product>(
              data: products,
              rowBuilder: (int index) => [
                DataCell(Text('${products[index].code}')),
                DataCell(Text('${products[index].description}')),
                DataCell(Text('${products[index].unit}')),
                DataCell(Text('${products[index].type}')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
