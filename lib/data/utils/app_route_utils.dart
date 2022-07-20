import 'package:automated_work_control/ui/pages/app_page/app_page.dart';
import 'package:automated_work_control/ui/pages/loading_page/loading_page.dart';
import 'package:automated_work_control/ui/pages/login_page/login_page.dart';
import 'package:automated_work_control/ui/pages/onboarding_page/onboarding_page.dart';
import 'package:automated_work_control/ui/pages/set_url_page/set_url_page.dart';
import 'package:flutter/material.dart';

class AppRouteUtils {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LoadingPage.routeName:
        return MaterialPageRoute(
          builder: (context) => LoadingPage(),
        );
      case OnBoardingPage.routeName:
        return MaterialPageRoute(
          builder: (context) => OnBoardingPage(),
        );
      case SetUrlPage.routeName:
        return MaterialPageRoute(
          builder: (context) => SetUrlPage(),
        );
      case LoginPage.routeName:
        return MaterialPageRoute(
          builder: (context) => LoginPage(),
        );
      case LoginPage.routeName:
        return MaterialPageRoute(
          builder: (context) => LoginPage(),
        );
      case AppPage.routeName:
        return MaterialPageRoute(
          builder: (context) => AppPage(),
        );
    }
  }
}
