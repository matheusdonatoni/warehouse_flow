import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/models/product.dart';
import '../../../../data/helpers/table_source.dart';
import '../../../../controllers/products_controller/products_controller.dart';

class ProductDataTable extends GetView<ProductsController> {
  const ProductDataTable({Key? key}) : super(key: key);

  RxList<Product> get products => controller.filteredList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Obx(
        () => PaginatedDataTable(
          header: Text('Produtos'),
          columns: [
            DataColumn(
              label: Text('Código'),
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
    );
  }
}
