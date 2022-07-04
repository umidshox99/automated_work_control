import 'package:automated_work_control/data/bloc/app_page_cubit/app_page_cubit.dart';
import 'package:automated_work_control/data/localization/locale_keys.dart';
import 'package:automated_work_control/data/model/navigation_bar_item.dart';
import 'package:automated_work_control/data/utils/app_image_utils.dart';
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
      title: LocaleKeys.str_main,
      selectedImage: AppImageUtils.HOME_ENABLE,
      unselectedImage: AppImageUtils.HOME_DISABLE,
    ),
    TitledNavigationBarItem(
        title: LocaleKeys.str_operations,
        selectedImage: AppImageUtils.OPERATIONS_ENABLE,
        unselectedImage: AppImageUtils.OPERATIONS_DISABLE),
    TitledNavigationBarItem(
      title: LocaleKeys.str_services,
      selectedImage: AppImageUtils.SERVICE_ENABLE,
      unselectedImage: AppImageUtils.SERVICE_DISABLE,
    ),
    TitledNavigationBarItem(
      title: LocaleKeys.str_documents,
      selectedImage: AppImageUtils.DOCUMENT_ENABLE,
      unselectedImage: AppImageUtils.DOCUMENT_DISABLE,
    ),
    TitledNavigationBarItem(
      title: LocaleKeys.str_menu,
      selectedImage: AppImageUtils.MENU_ENABLE,
      unselectedImage: AppImageUtils.MENU_DISABLE,
    ),
  ];

  bool navBarMode = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppPageCubit, AppPageChangePage>(
      bloc: AppPageCubit.to,
      builder: (context, state) {
        return Scaffold(
          body: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: AppPageCubit.to.pageController,
            children: [
              Container(),
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
