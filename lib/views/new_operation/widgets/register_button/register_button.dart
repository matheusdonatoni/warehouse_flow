import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bloc.dart';

class RegisterButton extends GetView<RegisterButtonBloc> {
  const RegisterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => RegisterButtonBloc());

    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(64, 48),
            ),
            onPressed: controller.addOperation,
            child: Text('Registrar'),
          ),
        ),
      ],
    );
  }
}
