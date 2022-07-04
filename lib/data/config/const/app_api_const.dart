import 'package:flutter/foundation.dart';

class AppAPIUtils {
  // static String SERVER_DEVELOPMENT = "http://172.16.50.247:8081";
  static String SERVER_DEVELOPMENT = "http://195.158.4.186:8081";
  static String SERVER_PRODUCTION = "http://192.168.49.64:8081";

  static String API_NEW_PAYMENT = _get("/api/payment/order/add");
  static String API_USER_SIGN_IN = _get("/api/user/signIn");
  static String API_PROFILE_GET = _get("/api/user/profile/get");
  static String API_ORDER_DEFINE_DATA = _get("/api/payment/predefinedData");
  static String API_EXCHANGE_RATE = _get("/api/report/currency/rate/list");
  static String API_SEARCH_RECEIVER_BY_TIN =
      _get("/api/payment/searchByInn?inn=");
  static String API_WARRANTY_LIST = _get("/api/warranty/guarantee/list");
  static String API_ACCOUNT_LIST = _get("/api/currency/account/list");
  static String API_ADD_WARRANTY = _get("/api/warranty/add");
  static String API_ADD_LETTER_OF_CREDIT = _get("/api/letterOfCredit/add");
  static String API_EXCHANGE_REQUEST = _get("/api/currency/exchange");
  static String API_BANK_TRANSFER = _get("/api/bankTransfer/add");
  static String API_DEPOSIT_ADD = _get("/api/deposit/add");
  static String API_TARIFF_LIST = _get("/api/bank/tariff/list");
  static String API_TARIFF_UPDATE = _get("/api/organization/bankTariff/update");
  static String API_DEPOSIT_LIST = _get("/api/deposit/list");
  static String API_ADD_TEMPLATE = _get("/api/formPattern/add");
  static String API_EDIT_TEMPLATE = _get("/api/formPattern/edit");
  static String API_DELETE_TEMPLATE = _get("/api/formPattern/remove");
  static String API_TEMPLATE_LIST = _get("/api/formPattern/list");
  static String API_DEPOSIT_PREDEFINED_DATA = _get("/api/deposit/predefinedData");
  static String API_KARTOTEKA_LIST = _get("/api/bankAccount/file/list");
  static String API_UPDATE_LIST = _get("/api/organization/myUpdate/list");

  static String API_BANK_LIST = _get("/api/bank/list");

  static String _get(String endPoint) {
    return kReleaseMode
        ? "$SERVER_DEVELOPMENT$endPoint"
        : "$SERVER_DEVELOPMENT$endPoint";
  }
}
