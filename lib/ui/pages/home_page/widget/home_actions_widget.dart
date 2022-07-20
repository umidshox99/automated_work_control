import 'package:automated_work_control/data/bloc/actions_cubit/actions_cubit.dart';
import 'package:automated_work_control/data/extensions/widget_padding_extension.dart';
import 'package:automated_work_control/data/localization/locale_keys.dart';
import 'package:automated_work_control/data/styles/app_colors.dart';
import 'package:automated_work_control/ui/pages/home_page/widget/home_birthdays_widget.dart';
import 'package:automated_work_control/ui/pages/home_page/widget/home_deadlines_widget.dart';
import 'package:automated_work_control/ui/pages/home_page/widget/home_messages_widget.dart';
import 'package:automated_work_control/ui/pages/home_page/widget/home_weather_widget.dart';
import 'package:automated_work_control/ui/widgets/app_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeActionsWidget extends StatefulWidget {
  const HomeActionsWidget({Key? key}) : super(key: key);

  @override
  State<HomeActionsWidget> createState() => _HomeActionsWidgetState();
}

class _HomeActionsWidgetState extends State<HomeActionsWidget>
    with TickerProviderStateMixin {
  late TabController tabController;
  double height = 84;

  @override
  void initState() {
    tabController = TabController(
        length: 4, vsync: this, animationDuration: Duration(seconds: 0));
    tabController.addListener(() {
      setState(() {
        switch (tabController.index) {
          case 0:
            height = 80;
            break;
          case 1:
            height = 124;
            break;

          case 2:
            height = 136;
            break;
          case 3:
            height = 152;
            break;
        }
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActionsCubit, ActionsState>(
      builder: (context, state) {
        if (!state.isLoading)
          return Column(
            children: [
              TabBar(
                controller: tabController,
                labelPadding: EdgeInsets.zero,
                automaticIndicatorColorAdjustment: true,
                physics: NeverScrollableScrollPhysics(),
                isScrollable: false,
                indicatorWeight: 0.00001,
                labelStyle: GoogleFonts.poppins(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.MAIN_DARK,
                ),
                unselectedLabelStyle: GoogleFonts.poppins(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.SECONDARY,
                ),
                labelColor: AppColors.MAIN_DARK,
                indicatorColor: AppColors.INDICATOR,
                tabs: [
                  Tab(
                    text: tr(LocaleKeys.str_today),
                  ),
                  Tab(
                    text: tr(LocaleKeys.str_messages),
                  ),
                  Tab(
                    text: tr(LocaleKeys.str_deadlines),
                  ),
                  Tab(
                    text: tr(LocaleKeys.str_birthdays),
                  ),
                ],
              ),
              Container(
                height: 2.0,
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                        height: 2,
                        decoration: BoxDecoration(
                          // border: Border.all(color: Colors.grey, width: 1.0),
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.WHITE,
                        ),
                      ),
                    ),
                    TabBar(
                      controller: tabController,
                      labelColor: Colors.black,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(2),
                          topRight: Radius.circular(2),
                        ),
                        color: AppColors.MAIN,
                      ),
                      unselectedLabelColor: Colors.black,
                      tabs: [
                        Tab(
                          height: 2.h,
                          child: Container(),
                        ),
                        Tab(
                          height: 2.h,
                          child: Container(),
                        ),
                        Tab(
                          height: 2.h,
                          child: Container(),
                        ),
                        Tab(
                          height: 2.h,
                          child: Container(),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: height,
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: tabController,
                  children: [
                    HomeWeatherWidget(
                      weatherData: state.weatherData,
                    ),
                    HomeMessagesWidget(
                      documentExchangeData: state.documentExchangeData,
                    ),
                    HomeDeadlinesWidget(),
                    HomeBirthdaysWidget(
                      data: state.birthdayData,
                    ),
                  ],
                ),
              ).paddingOnly(
                top: 16,
              ),
            ],
          );
        else
          return AppWidgets.progressIndicator();
      },
    );
  }
}
