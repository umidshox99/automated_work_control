import 'dart:io';

import 'package:automated_work_control/data/config/const/app_api_const.dart';
import 'package:automated_work_control/data/model/user_model.dart';
import 'package:automated_work_control/data/services/storage_service.dart';
import 'package:automated_work_control/data/utils/app_logger_utils.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class UserService {
  static UserService get to => GetIt.I<UserService>();

  static Future init() async {
    final getIt = GetIt.instance..registerSingleton<UserService>(UserService());
    await getIt<UserService>().create();
  }

  Future create() async {
    dio = Dio();
  }

  late final Dio dio;

  Options get options => Options(
        headers: {
          "Authorization": "Token ${StorageService.to.getAccessToken()}",
        },
      );

  Future<UserModel?> getUser() async {
    try {
      Response response = await dio.get(
        AppAPIUtils.API_MY_PROFILE,
        options: options,
      );
      if (response.statusCode == HttpStatus.ok) {
        UserModel user = UserModel.fromJson(response.data);
        // UserCubit.to.load();
        return user;
      }
      return null;
    } catch (e) {
      AppLoggerUtils.e(e.toString());

      return null;
    }
  }

}
