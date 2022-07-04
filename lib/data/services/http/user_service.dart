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
          "Authorization": "Bearer ${StorageService.to.getAccessToken()}",
        },
      );

  Future<UserModel?> getUser() async {
    try {
      Response response = await dio.get(
        AppAPIUtils.API_PROFILE_GET,
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
  //
  // Future<User?> updateMe(Map<String, dynamic> data ) async {
  //   try {
  //     Response response = await dio.put(
  //       AppAPIUtils.API_MY_INFOS,
  //       data: data,
  //       options: options,
  //     );
  //     if (response.statusCode == HttpStatus.ok) {
  //       return User.fromJson(response.data);
  //     }
  //     return null;
  //   } catch (e, stacktrace) {
  //     AppLoggerUtils.e(e.toString());
  //     data['reason'] = "Update Me";
  //     data['url'] = AppAPIUtils.API_MY_INFOS;
  //     await FirebaseCrashlytics.instance.recordError(
  //       e,
  //       stacktrace,
  //       reason: data.toString(),
  //     );
  //     return null;
  //   }
  // }
  //
  // Future<String?> uploadAvatar(File avatar) async {
  //   try {
  //     var formData = FormData.fromMap({
  //       "file": await MultipartFile.fromFile(
  //         avatar.path,
  //         filename: 'file',
  //       )
  //     });
  //
  //     var response = await dio.post(
  //       AppAPIUtils.API_UPDATE_USER_AVATAR,
  //       data: formData,
  //       options: options,
  //     );
  //
  //     if (response.statusCode == HttpStatus.ok) {
  //       return response.data.toString();
  //     }
  //     return null;
  //   } catch (e, stacktrace) {
  //     AppLoggerUtils.e(e.toString());
  //     await FirebaseCrashlytics.instance.recordError(
  //       e,
  //       stacktrace,
  //       reason: {
  //         "reason": "Upload Avatar",
  //         "url": AppAPIUtils.API_UPDATE_USER_AVATAR,
  //       }.toString(),
  //     );
  //     return null;
  //   }
  // }

}
