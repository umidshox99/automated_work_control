
import 'package:automated_work_control/data/bloc/language_cubit/language_cubit.dart';
import 'package:automated_work_control/data/bloc/theme_cubit/theme_cubit.dart';

import 'db_service.dart';

class DIService {
  static Future<void> init() async {
    // Services
    await DBService.init();

    // BloCs
    await LanguageCubit.init();
    await ThemeCubit.init();
  }
}
