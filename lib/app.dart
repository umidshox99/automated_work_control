import 'package:automated_work_control/data/bloc/language_cubit/language_cubit.dart';
import 'package:automated_work_control/data/bloc/theme_cubit/theme_cubit.dart';
import 'package:automated_work_control/data/services/navigator_service.dart';
import 'package:automated_work_control/data/styles/app_themes.dart';
import 'package:automated_work_control/data/utils/app_route_utils.dart';
import 'package:automated_work_control/ui/pages/onboarding_page/onboarding_page.dart';
// import 'package:automated_work_control/ui/pages/splash_page/splash_page.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (_,__) => BlocListener<LanguageCubit, LanguageState>(
        bloc: LanguageCubit.to,
        listener: (context, state) {
          context.setLocale(state.locale);
        },
        child: MaterialApp(
          navigatorKey: NavigatorService.to.key,
          title: "ASAKABANK BUSINESS",
          debugShowCheckedModeBanner: false,
          // initialRoute: "/",
          initialRoute: OnBoardingPage.routeName,
          onGenerateRoute: AppRouteUtils.onGenerateRoute,
          supportedLocales: context.supportedLocales,
          themeMode: ThemeCubit.to.state.themeMode,
          theme: AppThemes.lightTheme(),
          darkTheme: AppThemes.darkTheme(),
          localizationsDelegates: context.localizationDelegates,
          builder: BotToastInit(),
          // home: CounterPage(),
          navigatorObservers: [
            BotToastNavigatorObserver(),
          ],
          locale: context.locale,
        ),
      ),
    );
  }
}
