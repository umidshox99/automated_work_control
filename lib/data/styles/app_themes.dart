import 'package:automated_work_control/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData darkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      fontFamily: getFont(TextFont.MEDIUM),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }

  static ThemeData lightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      fontFamily: getFont(TextFont.MEDIUM),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
