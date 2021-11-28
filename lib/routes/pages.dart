import 'package:get/get.dart';

import 'routes.dart';

import '../views/root/root.dart';
import '../views/new_operation/new_operation.dart';

import '../bindings/root_bindings.dart';
import '../bindings/new_operation_bindings.dart';

final pages = <GetPage>[
  GetPage(
    name: Routes.ROOT,
    binding: RootBinding(),
    page: () => RootPage(),
  ),
  GetPage(
    name: Routes.NEW_OPERATION,
    binding: NewOperationBinding(),
    page: () => NewOperationPage(),
  )
];
