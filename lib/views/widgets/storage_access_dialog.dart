import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StorageAccessDialog extends StatelessWidget {
  const StorageAccessDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text('Conceder acesso'),
          ),
          ListTile(
            subtitle: Text(
              'Esta ação só pode ser executada se o acesso aos arquivos for concedido. Acesse as configurações e conceda essa permissão.',
              textAlign: TextAlign.justify,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 8.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: Get.back,
                  child: Text('Cancelar'),
                ),
                SizedBox(
                  width: 12.0,
                ),
                TextButton(
                  onPressed: () async => Get.back(
                    result: await openAppSettings(),
                  ),
                  child: Text('Acessar'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
