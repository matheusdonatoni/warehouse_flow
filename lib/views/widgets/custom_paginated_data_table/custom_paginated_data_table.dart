import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_flow/data/models/_impl/base_model.dart';
import '../../widgets/export_file_button/export_file_button.dart';
import 'bloc.dart';

class CustomPaginatedDataTable<T extends BaseModel>
    extends GetWidget<CustomDataTableBloc<T>> {
  final String title;
  final RxList<T> data;
  CustomPaginatedDataTable({
    required this.data,
    required this.title,
    Key? key,
  }) : super(key: key) {
    Get.create(() => CustomDataTableBloc<T>(data));
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => SizedBox(
        width: constraints.maxWidth,
        child: Obx(
          () => PaginatedDataTable(
            sortAscending: controller.sortAscending,
            sortColumnIndex: controller.sortColumnIndex,
            header: Text(title),
            actions: [
              IconButton(
                onPressed: () async {
                  await Get.dialog(
                    Dialog(
                      child: TextField(
                        onSubmitted: controller.filter,
                        textInputAction: TextInputAction.search,
                      ),
                    ),
                  );
                },
                tooltip: 'Procurar nesta planilha',
                icon: Icon(Icons.search),
              ),
              ExportFileButton(
                json: controller.dataAsJson,
                fileName: title,
              ),
            ],
            columns: controller.columns,
            source: controller.source,
          ),
        ),
      ),
    );
  }
}
