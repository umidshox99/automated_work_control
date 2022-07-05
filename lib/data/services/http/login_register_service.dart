import 'dart:io';

import 'package:automated_work_control/data/config/const/app_api_const.dart';
import 'package:automated_work_control/data/services/storage_service.dart';
import 'package:automated_work_control/data/utils/app_logger_utils.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class LoginRegisterService {
  static LoginRegisterService get to => GetIt.I<LoginRegisterService>();

  static Future init() async {
    GetIt.instance
      ..registerSingleton<LoginRegisterService>(LoginRegisterService());
    await GetIt.I<LoginRegisterService>().create();
  }

  Future create() async {
    dio = Dio();
  }

  late final Dio dio;

  Options get options => Options(
        headers: {
          "Authorization": "Bearer ${StorageService.to.getAccessToken()}",
        },
      );

  /// Sign In and return [Login] or null
  Future<bool?> signIn({
    required String login,
    required String password,
  }) async {
    try {
      Response response = await dio.post(
        AppAPIUtils.API_LOGIN,
        data: {
          "userName": login,
          "password": password,
        },
      );
      if (response.statusCode == HttpStatus.ok) {
        AppLoggerUtils.e(response.toString());
        return true;
      }
      return false;
    } catch (e) {
      AppLoggerUtils.e(e.toString());
      return null;
    }
  }
}
