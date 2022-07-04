import 'package:flutter/material.dart';

import '../bloc/theme_cubit/theme_cubit.dart';
import 'app_theme_color.dart';

class AppColors {
  // Color Names: Color names must be private
  static AppThemeColor _MAIN = AppThemeColor(
    lightColor: Colors.black,
  );

  static AppThemeColor _MAIN_DARK = AppThemeColor(
    lightColor: Color(0xff292E37),
  );

  static AppThemeColor _WHITE = AppThemeColor(
    lightColor: Colors.white,
    darkColor: Colors.white,
  );

  static AppThemeColor _BLACK = AppThemeColor(
    lightColor: Colors.black,
    darkColor: Colors.black,
  );

  static AppThemeColor _PURPLE_LIGHT = AppThemeColor(
    lightColor: Color(0xffF61E2E),
  );
  static AppThemeColor _TEXT_HINT = AppThemeColor(
    lightColor: Color(0xffE38EA2),
  );
  static AppThemeColor _PURPLE_MAP = AppThemeColor(
    lightColor: Color(0xffB81B4B),
  );
  static AppThemeColor _PURPLE_DARK = AppThemeColor(
    lightColor: Color(0xff920448),
  );
  static AppThemeColor _SECONDARY = AppThemeColor(
    lightColor: Color(0xffA8A9BA),
  );
  static AppThemeColor _INDICATOR = AppThemeColor(
    lightColor: Color(0xffED1C31),
  );
  static AppThemeColor _TEXT_PURPLE = AppThemeColor(
    lightColor: Color(0xffC885A1),
  );
  static AppThemeColor _BG_COLOR = AppThemeColor(
    lightColor: Color(0xffF5F5F5),
  );
  static AppThemeColor _RED1 = AppThemeColor(
    lightColor: Color(0xffFF377F),
  );
  static AppThemeColor _RED2 = AppThemeColor(
    lightColor: Color(0xffFFD482),
  );
  static AppThemeColor _QUICK_MENU = AppThemeColor(
    lightColor: Color(0xff26263B),
  );
  static AppThemeColor _GREEN = AppThemeColor(
    lightColor: Color(0xff20BF63),
  );
  static AppThemeColor _DARK_RED1 = AppThemeColor(
    lightColor: Color(0xffAA373A),
  );
  static AppThemeColor _DARK_RED2 = AppThemeColor(
    lightColor: Color(0xff64292D),
  );
  static AppThemeColor _PERCENT_INDICATOR = AppThemeColor(
    lightColor: Color(0xff54D833),
  );
  static AppThemeColor _DISABLE_INDICATOR = AppThemeColor(
    lightColor: Color(0xffDBDBE2),
  );
  static AppThemeColor _BLUE = AppThemeColor(
    lightColor: Color(0xff649BFF),
  );
  static AppThemeColor _RED_TEXT = AppThemeColor(
    lightColor: Color(0xffEE5253),
  );
  static AppThemeColor _RED_LIGHT = AppThemeColor(
    lightColor: Color(0xffFF9790),
  );
  static AppThemeColor _GREY = AppThemeColor(
    lightColor: Color(0xffB3B4C6),
  );
  static AppThemeColor _GREY_BG = AppThemeColor(
    lightColor: Color(0xffF6F7F7),
  );
  static AppThemeColor _GREY_INDICATOR = AppThemeColor(
    lightColor: Color(0xff767680),
  );
  static AppThemeColor _GREY_BUTTON = AppThemeColor(
    lightColor: Color(0xffDFE2E5),
  );
  static AppThemeColor _SHIMMER = AppThemeColor(
    lightColor: Color(0xffE7EBF0),
  );
  static AppThemeColor _RED_BG = AppThemeColor(
    lightColor: Color(0xffFEE9EA),
  );
  static AppThemeColor _GREEN_LIGHT = AppThemeColor(
    lightColor: Color(0xff37DEA5),
  );
  static AppThemeColor _GREEN_DARK = AppThemeColor(
    lightColor: Color(0xff088A84),
  );
  static AppThemeColor _TF_BORDER = AppThemeColor(
    lightColor: Color(0xffDEDEE0),
  );
  static AppThemeColor _TF_FILL = AppThemeColor(
    lightColor: Color(0xffFBFBFB),
  );
  static AppThemeColor _BLACK_BG = AppThemeColor(
    lightColor: Color(0xff2E2E2E),
  );
  static AppThemeColor _BLACK_TEXT = AppThemeColor(
    lightColor: Color(0xff5F6269),
  );
  static AppThemeColor _GREEN_BG = AppThemeColor(
    lightColor: Color(0xffEAF7EE),
  );
  static AppThemeColor _GREEN_BORDER = AppThemeColor(
    lightColor: Color(0xffBEE4C8),
  );
  static AppThemeColor _RED_TOAST_BG = AppThemeColor(
    lightColor: Color(0xffFEE4E6),
  );
  static AppThemeColor _RED_TOAST_BORDER = AppThemeColor(
    lightColor: Color(0xffFAC6C1),
  );
  static AppThemeColor _GREEN_BORDER_2 = AppThemeColor(
    lightColor: Color(0xff2BCBBA),
  );  static AppThemeColor _BLUE_BORDER = AppThemeColor(
    lightColor: Color(0xff45AAF2),
  );

  // Colors for public usage
  static Color MAIN = AppColors._MAIN.get(_themeMode);

  static Color WHITE = AppColors._WHITE.get(_themeMode);

  static Color BLACK = AppColors._BLACK.get(_themeMode);
  static Color PURPLE_DARK = AppColors._PURPLE_DARK.get(_themeMode);
  static Color PURPLE_LIGHT = AppColors._PURPLE_LIGHT.get(_themeMode);
  static Color PURPLE_MAP = AppColors._PURPLE_MAP.get(_themeMode);
  static Color TEXT_HINT = AppColors._TEXT_HINT.get(_themeMode);
  static Color MAIN_DARK = AppColors._MAIN_DARK.get(_themeMode);
  static Color SECONDARY = AppColors._SECONDARY.get(_themeMode);
  static Color INDICATOR = AppColors._INDICATOR.get(_themeMode);
  static Color TEXT_PURPLE = AppColors._TEXT_PURPLE.get(_themeMode);
  static Color BG_COLOR = AppColors._BG_COLOR.get(_themeMode);
  static Color RED1 = AppColors._RED1.get(_themeMode);
  static Color RED2 = AppColors._RED2.get(_themeMode);
  static Color QUICK_MENU = AppColors._QUICK_MENU.get(_themeMode);
  static Color GREEN = AppColors._GREEN.get(_themeMode);
  static Color DARK_RED1 = AppColors._DARK_RED1.get(_themeMode);
  static Color DARK_RED2 = AppColors._DARK_RED2.get(_themeMode);
  static Color PERCENT_INDICATOR = AppColors._PERCENT_INDICATOR.get(_themeMode);
  static Color DISABLE_INDICATOR = AppColors._DISABLE_INDICATOR.get(_themeMode);
  static Color BLUE = AppColors._BLUE.get(_themeMode);
  static Color RED_TEXT = AppColors._RED_TEXT.get(_themeMode);
  static Color RED_LIGHT = AppColors._RED_LIGHT.get(_themeMode);
  static Color GREY = AppColors._GREY.get(_themeMode);
  static Color GREY_INDICATOR = AppColors._GREY_INDICATOR.get(_themeMode);
  static Color GREY_BUTTON = AppColors._GREY_BUTTON.get(_themeMode);
  static Color SHIMMER = AppColors._SHIMMER.get(_themeMode);
  static Color RED_BG = AppColors._RED_BG.get(_themeMode);
  static Color GREEN_LIGHT = AppColors._GREEN_LIGHT.get(_themeMode);
  static Color GREEN_DARK = AppColors._GREEN_DARK.get(_themeMode);
  static Color TF_BORDER = AppColors._TF_BORDER.get(_themeMode);
  static Color TF_FILL = AppColors._TF_FILL.get(_themeMode);
  static Color BLACK_BG = AppColors._BLACK_BG.get(_themeMode);
  static Color BLACK_TEXT = AppColors._BLACK_TEXT.get(_themeMode);
  static Color GREEN_BG = AppColors._GREEN_BG.get(_themeMode);
  static Color GREEN_BORDER = AppColors._GREEN_BORDER.get(_themeMode);
  static Color RED_TOAST_BG = AppColors._RED_TOAST_BG.get(_themeMode);
  static Color RED_TOAST_BORDER = AppColors._RED_TOAST_BORDER.get(_themeMode);
  static Color GREEN_BORDER_2 = AppColors._GREEN_BORDER_2.get(_themeMode);
  static Color BLUE_BORDER = AppColors._BLUE_BORDER.get(_themeMode);
  static Color GREY_BG = AppColors._GREY_BG.get(_themeMode);

  static ThemeMode get _themeMode => ThemeCubit.to.state.themeMode;
}
