// 🎯 Dart imports:
import 'dart:ui';

// 📦 Package imports:
import 'package:automated_work_control/data/localization/locale_keys.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

// 🌎 Project imports:

class HiveService {
  late Box _box;

  static Future init() async {
    final getIt = GetIt.instance;

    getIt.registerSingleton<HiveService>(HiveService());
    await getIt<HiveService>().create();
  }

  Future create() async {
    _box = await Hive.openBox(LocaleKeys.str_app_name);
  }

  String getLang() {
    return _box.get(_HiveKeys.LANG, defaultValue: "uz_UZ");
  }

  void setLang(Locale locale) {
    _box.put(_HiveKeys.LANG, locale.toString());
  }
}

class _HiveKeys {
  static const String LANG = "lang";
}
