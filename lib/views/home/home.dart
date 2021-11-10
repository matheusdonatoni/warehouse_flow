import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_flow/controllers/home_controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Início'),
      ),
    );
  }
}
