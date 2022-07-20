import 'package:automated_work_control/data/bloc/actions_cubit/actions_cubit.dart';
import 'package:automated_work_control/data/bloc/app_page_cubit/app_page_cubit.dart';
import 'package:automated_work_control/data/localization/locale_keys.dart';
import 'package:automated_work_control/data/model/navigation_bar_item.dart';
import 'package:automated_work_control/data/styles/app_colors.dart';
import 'package:automated_work_control/data/utils/app_image_utils.dart';
import 'package:automated_work_control/ui/pages/home_page/home_page.dart';
import 'package:automated_work_control/ui/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppPage extends StatefulWidget {
  const AppPage({Key? key}) : super(key: key);
  static const String routeName = "/appPage";

  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  final List<TitledNavigationBarItem> items = [
    TitledNavigationBarItem(
      title: LocaleKeys.str_home,
      image: AppImageUtils.IC_HOME,
    ),
    TitledNavigationBarItem(
      title: LocaleKeys.str_calendar,
      image: AppImageUtils.IC_CALENDAR,
    ),
    TitledNavigationBarItem(
      title: LocaleKeys.str_doc_flow,
      image: AppImageUtils.IC_DOC_FLOW,
    ),
    TitledNavigationBarItem(
      title: LocaleKeys.str_chat,
      image: AppImageUtils.IC_CHAT,
    ),
    TitledNavigationBarItem(
      title: LocaleKeys.str_profile,
      image: AppImageUtils.IC_PROFILE,
    ),
  ];

  bool navBarMode = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppPageCubit, AppPageChangePage>(
      bloc: AppPageCubit.to,
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.BACKGROUND,
          body: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: AppPageCubit.to.pageController,
            children: [
              BlocProvider(
                create: (context) => ActionsCubit()..loadDashboardData(),
                child: HomePage(),
              ),
              Container(),
              Container(),
              Container(),
              Container(),
            ],
          ),
          bottomNavigationBar: TitledBottomNavigationBar(
            currentIndex: AppPageCubit.to.state.page,
            onTap: (index) {
              AppPageCubit.to.pageChanged(index);
            },
            curve: Curves.easeInBack,
            items: items,
          ),
        );
      },
    );
  }
}
