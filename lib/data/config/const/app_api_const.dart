import 'package:automated_work_control/data/services/storage_service.dart';
import 'package:flutter/foundation.dart';

class AppAPIUtils {
  static String SERVER_DEVELOPMENT = StorageService.to.getURL();

  static String API_PRIVATE_CHAT = _get("/chats/private/");
  static String API_GROUP_CHAT = _get("/chats/group/");
  static String API_LOGIN = _get("/login/");
  static String API_MY_PROFILE = _get("/user/my/profile/");
  static String API_WEATHER = _get("/dashboard/get-weather/");
  static String API_BIRTHDAYS = _get("/dashboard/born-in-today/");
  static String API_EXCHANGE = _get("/dashboard/document-exchange/");
  static String API_SKIPPED_DEADLINE = _get("/dashboard/skipped-deadlines/");
  static String API_UPCOMING_DEADLINE = _get("/dashboard/upcoming-deadlines/");

  static String _get(String endPoint) {
    return kReleaseMode
        ? "https://$SERVER_DEVELOPMENT$endPoint"
        : "https://$SERVER_DEVELOPMENT$endPoint";
  }
}
