import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../file_importer/file_importer.dart';
import '../../../../../controllers/_impl/base_getx_controller_impl.dart';
import '../../../../../bindings/file_importer_bindings.dart';
import '../../../../../routes/routes.dart';

import 'bloc.dart';

class FileImporterNavigator extends GetView<FileImporterNavigatorBloc> {
  const FileImporterNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => FileImporterNavigatorBloc());

    return controller.obx(
      () => Navigator(
        key: Get.nestedKey(3),
        initialRoute: Routes.FILE_IMPORTER,
        onGenerateInitialRoutes: (navigator, initialRouteName) => [
          GetPageRoute(
            page: () => FileImporterPage(),
            binding: FileImporterBinding(),
          )
        ],
        onGenerateRoute: (settings) {
          return GetPageRoute(
            page: () => FileImporterPage(),
            binding: FileImporterBinding(),
          );
        },
      ),
    );
  }
}
