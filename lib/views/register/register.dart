import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/custom_paginated_data_table/custom_paginated_data_table.dart';
import '../../controllers/_impl/base_getx_controller_impl.dart';
import '../../controllers/register_controllers/register_controller.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: controller.simpleObx(
        () => FloatingActionButton.extended(
          heroTag: controller.toString(),
          icon: Icon(Icons.add),
          label: Text('Operação'),
          onPressed: () => controller.pushNewOperationPage(),
        ),
      ),
      body: controller.obx(
        () => SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              SizedBox(height: 24.0),
              Obx(
                () => CustomPaginatedDataTable(
                  title: 'Operações',
                  data: controller.operations,
                ),
              ),
              SizedBox(height: 76.0),
            ],
          ),
        ),
      ),
    );
  }
}
