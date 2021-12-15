import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_flow/views/widgets/search_dialog/bloc.dart';

class SearchDialog extends GetView<SearchDialogBloc> {
  final String initialValue;
  const SearchDialog({
    Key? key,
    this.initialValue = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SearchDialogBloc(initialValue));

    return Dialog(
      child: ListView(
        shrinkWrap: true,
        children: [
          const ListTile(
            title: Text(
              'Filtrar na planilha',
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: TextField(
              controller: controller.textController,
              onSubmitted: (value) => Get.back(result: value),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                prefixIcon: const Icon(Icons.search, size: 20),
                prefixIconConstraints: const BoxConstraints(
                  minHeight: 24.0,
                  minWidth: 24.0,
                ),
                suffixIcon: IconButton(
                  onPressed: controller.clear,
                  iconSize: 20,
                  icon: const Icon(Icons.clear),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 8.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: Get.back,
                  child: const Text('Cancelar'),
                ),
                TextButton(
                  onPressed: () => Get.back(result: controller.text),
                  child: const Text('Filtrar'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
