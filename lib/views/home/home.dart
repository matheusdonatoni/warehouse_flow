import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/controllers/_impl/base_getx_controller_impl.dart';
import '/controllers/home_controllers/home_controller.dart';
import 'widgets/operation_table/operation_table.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: controller.simpleObx(
        () => FloatingActionButton.extended(
          icon: Icon(Icons.add),
          label: Text("Operação"),
          onPressed: () => controller.pushNewOperationPage(),
        ),
      ),
      body: controller.obx(
        () => SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              OperationTable(),
            ],
          ),
        ),
      ),
    );
  }
}
