import 'package:automated_work_control/data/localization/locale_keys.dart';
import 'package:automated_work_control/data/model/language_item.dart';
import 'package:automated_work_control/data/services/navigator_service.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'language_state.dart';

class LanguageCubit extends HydratedCubit<LanguageState> {
  static LanguageCubit get to => GetIt.I<LanguageCubit>();

  static Future init() async {
    GetIt.instance
      ..registerSingleton<LanguageCubit>(
        LanguageCubit(),
      );
  }

  LanguageCubit()
      : super(
          LanguageState(
            locale: Locale('uz', 'UZ'),
          ),
        );

  void change(Locale locale) {
    emit(state.copyWith(locale: locale));
  }

  final List<LanguageItem> languages = [
    LanguageItem(
      languageLocaleKey: LocaleKeys.str_uzbek,
      locale: Locale('uz', 'UZ'),
    ),
    // LanguageItem(
    //     languageLocaleKey: LocaleKeys.str_uzbek_cyrl,
    //     locale: Locale('uz', 'Cyrl'),
    //     flag: AppImageUtils.IC_UZ_FLAG,
    //     description: "(Kiril)"),
    LanguageItem(
      languageLocaleKey: LocaleKeys.str_english,
      locale: Locale('en', 'EN'),
    ),
    // LanguageItem(
    //   languageLocaleKey: LocaleKeys.str_karakalpak,
    //   locale: Locale('uk', 'UA'),
    //   flag: AppImageUtils.IC_KAA_FLAG,
    // ),
    LanguageItem(
      languageLocaleKey: LocaleKeys.str_russian,
      locale: Locale('ru', 'RU'),
    ),
  ];

  Future changeLanguage(Locale locale) async {
    // if (!await checkConnection()) {
    //   AppWidgets.showText(text: tr(LocaleKeys.str_app_name));
    //   return;
    // }

    // emit(state.copyWith(isLoading: true));

    late String lang;

    switch (locale.languageCode) {
      case "uz":
        lang = "uz_latn";
        break;
      default:
        lang = "ru";
        break;
    }
    //
    // User? _user = await UserService.to.updateMe(
    //   {"lang": lang},
    // );
    // if (_user != null) {
    //   DBService.to.clearUser();
    //   DBService.to.saveUser(_user);
    //   UserCubit.to.load();
    //   change(locale);
    // } else {
    //   AppWidgets.showText(
    //     text: tr(LocaleKeys.str_smt_went_wrong_try_again),
    //   );
    // }

    emit(state.copyWith(isLoading: false));
    NavigatorService.to.pop();
  }

  String getLanguageLocaleKey(String languageCode) {
    return languages
        .firstWhere(
          (element) => element.locale.languageCode == languageCode,
        )
        .languageLocaleKey;
  }

  int getCurrentIndex(Locale locale) {
    return languages.indexWhere((element) => element.locale == locale);
  }

  LanguageItem getCurrent() {
    return languages.where((element) => element.locale == state.locale).first;
  }

  Future<bool> checkConnection() async {
    var connectivity = Connectivity();
    var result = await connectivity.checkConnectivity();
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  @override
  LanguageState? fromJson(Map<String, dynamic> json) {
    return LanguageState(locale: (json['locale'] as String).toLocale());
  }

  @override
  Map<String, dynamic>? toJson(LanguageState state) {
    if (state is LanguageState) {
      return {
        'locale': "${state.locale.languageCode}_${state.locale.countryCode}",
      };
    }
    return null;
  }
}
