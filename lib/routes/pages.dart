import 'package:get/get.dart';

import 'routes.dart';

import '../views/root/root.dart';

final pages = <GetPage>[
  GetPage(
    name: Routes.ROOT,
    page: () => RootPage(),
  ),
];
