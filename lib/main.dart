import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:automated_work_control/app.dart';
import 'package:automated_work_control/data/bloc/app_bloc_observer.dart';
import 'package:automated_work_control/data/services/root_service.dart';
import 'package:path_provider/path_provider.dart';

Future main() async {
  runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      final storage = await HydratedStorage.build(
        storageDirectory: await getTemporaryDirectory(),
      );

      HydratedBlocOverrides.runZoned(
        () => runMainApp(),
        storage: storage,
        blocObserver: AppBlocObserver(),
      );
    },
    (error, stack) {},
  );
}

Future runMainApp() async {
  await EasyLocalization.ensureInitialized();

  await Hive.initFlutter();

  await RootService.init();

  runApp(
    EasyLocalization(
      path: 'assets/langs',
      supportedLocales: [
        Locale("uk", "UA"),
        Locale("uz", "Cyrl"),
        Locale("en", "EN"),
        Locale("uz", "UZ"),
        Locale("ru", "RU"),
      ],
      fallbackLocale: Locale('uz', 'UZ'),
      child: App(),
    ),
  );
}
