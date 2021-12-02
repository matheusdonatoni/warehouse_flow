import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/products_controller/products_controller.dart';
import 'widgets/product_data_table/product_data_table.dart';

class ProductPage extends GetView<ProductsController> {
  const ProductPage({Key? key}) : super(key: key);

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
            ProductDataTable(),
            SizedBox(height: 76.0),
          ],
        ),
      ),
    );
  }
}
