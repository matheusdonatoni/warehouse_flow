import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/home_controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.add),
        label: Text("Operação"),
        onPressed: () => controller.pushNewOperationPage(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
