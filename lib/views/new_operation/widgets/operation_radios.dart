import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OperationRadios extends GetResponsiveView {
  OperationRadios({Key? key}) : super(key: key);

  @override
  Widget? desktop() {
    return _build(
      child: Row(
        children: [
          Flexible(
            child: RadioListTile(
              title: Text('Inserir'),
              value: 0,
              groupValue: 0,
              onChanged: (val) {},
            ),
          ),
          SizedBox(
            width: 24.0,
          ),
          Flexible(
            child: RadioListTile(
              title: Text('Remover'),
              value: 1,
              groupValue: 0,
              onChanged: (val) {},
            ),
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
          RadioListTile(
            title: Text('Inserir'),
            value: 0,
            groupValue: 0,
            onChanged: (val) {},
          ),
          RadioListTile(
            title: Text('Remover'),
            value: 1,
            groupValue: 0,
            onChanged: (val) {},
          ),
        ],
      ),
    );
  }

  Widget _build({required Widget child}) {
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
}
