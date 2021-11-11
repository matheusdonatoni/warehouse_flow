import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_flow/controllers/home_controllers/home_controller.dart';

import 'widgets/chamber_drop_down_button.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            SizedBox(
              height: 24.0,
            ),
            ChamberDropDownButton()
          ],
        ),
      ),
    );
  }
}
