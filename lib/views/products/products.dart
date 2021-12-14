import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../views/widgets/custom_paginated_data_table/custom_paginated_data_table.dart';
import '../../controllers/products_controller/products_controller.dart';

class ProductsPage extends GetView<ProductsController> {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        heroTag: controller.toString(),
        onPressed: () {},
        icon: Icon(Icons.add),
        label: Text('Produto'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            SizedBox(height: 24.0),
            CustomPaginatedDataTable(
              title: 'Produtos',
              data: controller.products,
            ),
            SizedBox(height: 76.0),
          ],
        ),
      ),
    );
  }
}
