import 'package:flutter/material.dart';
import '../routes/routes.dart';

final Map<String, Widget Function(BuildContext)> pages = {
  Routes.ROOT: makeRootPage,
  Routes.NEW_OPERATION: makeNewOperationPage,
};
