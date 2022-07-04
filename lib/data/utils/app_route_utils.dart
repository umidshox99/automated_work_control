import 'package:automated_work_control/ui/pages/loading_page/loading_page.dart';
import 'package:flutter/material.dart';

class AppRouteUtils {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LoadingPage.routeName:
        return MaterialPageRoute(
          builder: (context) => LoadingPage(),
        );
    }
  }
}
