import 'package:flutter/material.dart';
import '../../factories/pages/new_operation/new_operation_page_factory.dart';
import '../../factories/pages/root/root_page_factory.dart';
import '../routes/routes.dart';

final Map<String, Widget Function(BuildContext)> pages = {
  Routes.ROOT: makeRootPage,
  Routes.NEW_OPERATION: makeNewOperationPage,
};
