import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

class StorageService {
  late final Box _box;

  static StorageService get to => GetIt.I<StorageService>();

  static Future<void> init() async {
    GetIt.instance.registerSingleton<StorageService>(StorageService());
    await GetIt.I<StorageService>().create();
  }

  Future<void> create() async {
    _box = await Hive.openBox('app');
  }

  Locale getLocale() {
    List<String> value =
        (_box.get(_StorageKeys.LOCALE, defaultValue: 'uz_UZ') as String)
            .split("_");

    return Locale(value.first, value.last);
  }

  Future<void> setLocale(Locale locale) async {
    await _box.put(_StorageKeys.LOCALE, locale.toString());
  }

  Future<void> setThemeMode(ThemeMode value) async {
    await _box.put(_StorageKeys.THEME_MODE, value);
  }

  ThemeMode getThemeMode() {
    return _box.get(_StorageKeys.THEME_MODE, defaultValue: ThemeMode.light);
  }

  Future<void> setAccessToken(String value) async {
    await _box.put(_StorageKeys.ACCESS_TOKEN, value);
  }

  String getAccessToken() {
    return _box.get(_StorageKeys.ACCESS_TOKEN, defaultValue: "");
  }

  Future<void> setURL(String url) async {
    return _box.put(_StorageKeys.URL, url);
  }

  String getURL() {
    return _box.get(_StorageKeys.URL, defaultValue: "");
  }

  Future clearAll() async {
    await _box.clear();
  }

  void setFCMToken(String token) {
    _box.put(_StorageKeys.FCM_TOKEN, token);
  }

  String getFCMToken() {
    return _box.get(_StorageKeys.FCM_TOKEN, defaultValue: "");
  }
}

class _StorageKeys {
  static const LOCALE = 'locale';
  static const THEME_MODE = 'theme_mode';
  static const ACCESS_TOKEN = 'access_token';
  static const URL = 'url';
  static const FCM_TOKEN = 'fcm_token';
}
