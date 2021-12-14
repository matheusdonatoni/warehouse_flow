import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bloc.dart';

class ExportFileButton extends GetView<ExportFileButtonBloc> {
  final String json;
  final String fileName;

  @override
  String get tag => fileName;

  const ExportFileButton({
    Key? key,
    required this.json,
    required this.fileName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(
      () => ExportFileButtonBloc(),
      tag: fileName,
    );

    return IconButton(
      onPressed: () => controller.saveJson(json, fileName),
      tooltip: 'Exportar esta planilha',
      icon: Icon(
        Icons.save_alt,
      ),
    );
  }
}
