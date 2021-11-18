import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_flow/data/models/operation.dart';
import 'bloc.dart';

class OperationRadios extends GetResponsiveView<OperationRadiosBloc> {
  OperationRadios({Key? key}) : super(key: key);

  @override
  Widget? desktop() {
    return _build(
      child: Row(
        children: [
          Flexible(
            child: _insertRadio,
          ),
          SizedBox(
            width: 24.0,
          ),
          Flexible(
            child: _removeRadio,
          ),
        ],
      ),
    );
  }

  @override
  Widget? phone() {
    return _build(
      child: Column(
        children: [
          _insertRadio,
          _removeRadio,
        ],
      ),
    );
  }

  Widget _build({required Widget child}) {
    Get.lazyPut(() => OperationRadiosBloc());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text("Operação"),
          contentPadding: EdgeInsets.zero,
        ),
        child,
      ],
    );
  }

  Widget get _insertRadio => Obx(
        () => RadioListTile(
          title: Text('Inserir'),
          value: OperationType.insert,
          groupValue: controller.operation.type,
          onChanged: controller.onChanged,
        ),
      );

  Widget get _removeRadio => Obx(
        () => RadioListTile(
          title: Text('Remover'),
          value: OperationType.remove,
          groupValue: controller.operation.type,
          onChanged: controller.onChanged,
        ),
      );
}
