import 'package:flutter/material.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(64, 48),
            ),
            onPressed: () {},
            child: Text('Registrar'),
          ),
        ),
      ],
    );
  }
}
