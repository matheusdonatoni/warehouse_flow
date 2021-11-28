import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/data/models/product.dart';
import '/data/utils/table_source.dart';
import '../../../../controllers/products_controller/products_controller.dart';

class ProductDataTable extends GetView<ProductsController> {
  const ProductDataTable({Key? key}) : super(key: key);

  List<Product> get products => controller.products;

  int get rowsPerPage {
    var _rowsPerPage =
        (Get.height - 56.0 * 2) ~/ (kMinInteractiveDimension) - 2;

    if (products.length < _rowsPerPage) return products.length;

    return _rowsPerPage;
  }

  @override
  Widget build(BuildContext context) {
    return PaginatedDataTable(
      showCheckboxColumn: false,
      rowsPerPage: rowsPerPage,
      columns: [
        DataColumn(label: Text('Código')),
        DataColumn(label: Text('Descrição')),
        DataColumn(label: Text('Unidade')),
        DataColumn(label: Text('Tipo')),
      ],
      source: TableSource(
        rowCount: products.length,
        rowBuilder: (int index) => DataRow(
          cells: [
            DataCell(Text('${products[index].code}')),
            DataCell(Text('${products[index].description}')),
            DataCell(Text('${products[index].unit}')),
            DataCell(Text('${products[index].type}')),
          ],
        ),
      ),
    );
  }
}
