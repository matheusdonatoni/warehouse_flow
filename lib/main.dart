import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'data/providers/local_storage.dart';
import 'routes/pages.dart';
import 'bindings/initial_bindings.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  if (!kIsWeb) await Get.putAsync(() => LocalStorage.init(), permanent: true);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBinding(),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('pt', 'BR'),
        Locale('en', 'US'),
      ],
      getPages: pages,
    );
  }
}
