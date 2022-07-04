// 🐦 Flutter imports:

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

class DateTimeUtil {
  static String dMEEE(DateTime dateTime, Locale locale) {
    return DateFormat("d MMMM, EEE", locale.toString()).format(dateTime);
  }

  static String dMY(DateTime dateTime, Locale locale) {
    return DateFormat("d MMMM, y", locale.toString()).format(dateTime);
  }

  static String dm(DateTime dateTime, Locale locale) {
    return DateFormat("dd/MM", locale.toString()).format(dateTime);
  }

  static String ddMMYYY(DateTime dateTime) {
    return DateFormat(
      "dd/MM/yyyy",
    ).format(dateTime);
  }

  static String YYYYMMdd(
    DateTime dateTime,
  ) {
    return DateFormat(
      "yyyy-MM-dd",
    ).format(dateTime);
  }

  static String addZero(int data) {
    return data.toString().padLeft(2, '0');
  }

  static String hhmm(
    DateTime dateTime,
  ) {
    return DateFormat(
      "HH:mm",
    ).format(dateTime);
  }
}
