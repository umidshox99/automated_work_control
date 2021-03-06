
import 'package:automated_work_control/data/bloc/app_page_cubit/app_page_cubit.dart';
import 'package:automated_work_control/data/bloc/language_cubit/language_cubit.dart';
import 'package:automated_work_control/data/bloc/theme_cubit/theme_cubit.dart';
import 'package:automated_work_control/data/services/http/dashboard_service.dart';
import 'package:automated_work_control/data/services/http/login_register_service.dart';
import 'package:automated_work_control/data/services/http/user_service.dart';

import 'db_service.dart';

class DIService {
  static Future<void> init() async {
    // Services
    await DBService.init();
    await LoginRegisterService.init();
    await UserService.init();
    await DashboardService.init();

    // BloCs
    await LanguageCubit.init();
    await AppPageCubit.init();
    await ThemeCubit.init();
  }
}
