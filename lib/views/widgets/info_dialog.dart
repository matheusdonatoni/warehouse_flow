import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class InfoDialog extends StatelessWidget {
  final String title;
  final String message;
  const InfoDialog({
    Key? key,
    required this.title,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text(title),
          ),
          ListTile(
            subtitle: Text(
              message,
              textAlign: TextAlign.justify,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 8.0,
              ),
              child: TextButton(
                onPressed: Get.back,
                child: Text('Confirmar'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
