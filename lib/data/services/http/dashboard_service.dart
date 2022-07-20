import 'dart:io';

import 'package:automated_work_control/data/config/const/app_api_const.dart';
import 'package:automated_work_control/data/model/birthday_data.dart';
import 'package:automated_work_control/data/model/deadline_data.dart';
import 'package:automated_work_control/data/model/document_exchange_data.dart';
import 'package:automated_work_control/data/model/response_data.dart';
import 'package:automated_work_control/data/model/weather_data.dart';
import 'package:automated_work_control/data/services/storage_service.dart';
import 'package:automated_work_control/data/utils/app_logger_utils.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class DashboardService {
  static DashboardService get to => GetIt.I<DashboardService>();

  static Future init() async {
    GetIt.instance..registerSingleton<DashboardService>(DashboardService());
    await GetIt.I<DashboardService>().create();
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

  /// GetWeather and return [WeatherData] or null
  Future<WeatherData?> getWeather() async {
    try {
      Response response = await dio.get(
        AppAPIUtils.API_WEATHER,
        options: options,
      );
      if (response.statusCode == HttpStatus.ok) {
        AppLoggerUtils.e(response.toString());
        return WeatherData.fromJson(response.data);
      }
      return null;
    } catch (e) {
      AppLoggerUtils.e(e.toString());
      return null;
    }
  }

  /// GetBirthdays and return [Response] or null
  Future<ResponseData<BirthdayData>?> getBirthdays() async {
    try {
      Response response = await dio.get(
        AppAPIUtils.API_BIRTHDAYS,
        options: options,
      );
      if (response.statusCode == HttpStatus.ok) {
        AppLoggerUtils.e(response.toString());
        return ResponseData.fromJson(response.data, BirthdayData.fromJson);
      }
      return null;
    } catch (e) {
      AppLoggerUtils.e(e.toString());
      return null;
    }
  }

  /// getDocumentExchangeData and return [DocumentExchangeData] or null
  Future<DocumentExchangeData?> getDocumentExchangeData() async {
    try {
      Response response = await dio.get(
        AppAPIUtils.API_EXCHANGE,
        options: options,
      );
      if (response.statusCode == HttpStatus.ok) {
        AppLoggerUtils.e(response.toString());
        return DocumentExchangeData.fromJson(response.data);
      }
      return null;
    } catch (e) {
      AppLoggerUtils.e(e.toString());
      return null;
    }
  }

  Future<ResponseData<DeadlineData>?> getSkippedDeadline() async {
    try {
      Response response = await dio.get(
        AppAPIUtils.API_SKIPPED_DEADLINE,
        options: options,
      );
      if (response.statusCode == HttpStatus.ok) {
        AppLoggerUtils.e(response.toString());
        return ResponseData.fromJson(response.data, DeadlineData.fromJson);
      }
      return null;
    } catch (e) {
      AppLoggerUtils.e(e.toString());
      return null;
    }
  }

  Future<ResponseData<DeadlineData>?> getUpcomingDeadline() async {
    try {
      Response response = await dio.get(
        AppAPIUtils.API_UPCOMING_DEADLINE,
        options: options,
      );
      if (response.statusCode == HttpStatus.ok) {
        AppLoggerUtils.e(response.toString());
        return ResponseData.fromJson(response.data, DeadlineData.fromJson);
      }
      return null;
    } catch (e) {
      AppLoggerUtils.e(e.toString());
      return null;
    }
  }
}
