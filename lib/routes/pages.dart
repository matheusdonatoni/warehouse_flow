import 'package:get/get.dart';

import 'routes.dart';

import '../views/root/root.dart';
import '../views/new_operation/new_operation.dart';
import '../bindings/new_operation_bindings.dart';

final pages = <GetPage>[
  GetPage(
    name: Routes.ROOT,
    page: () => RootPage(),
  ),
  GetPage(
    name: Routes.NEW_OPERATION,
    page: () => NewOperationPage(),
    binding: NewOperationBinding(),
  )
];
