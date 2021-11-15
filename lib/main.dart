import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routes/pages.dart';
import 'bindings/initial_bindings.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBinding(),
      getPages: pages,
    );
  }
}
