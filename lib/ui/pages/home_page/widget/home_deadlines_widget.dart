import 'package:automated_work_control/data/extensions/widget_padding_extension.dart';
import 'package:automated_work_control/data/localization/locale_keys.dart';
import 'package:automated_work_control/data/styles/app_colors.dart';
import 'package:automated_work_control/data/utils/app_image_utils.dart';
import 'package:automated_work_control/ui/widgets/app_widgets.dart';
import 'package:charts_painter/chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeDeadlinesWidget extends StatelessWidget {
  const HomeDeadlinesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 124,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        color: AppColors.WHITE,
      ),
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppWidgets.textLocale(
                  text: LocaleKeys.str_unread_messages,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
                Container(
                  width: 100,
                  height: 24,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    color: AppColors.GREY_INDICATOR.withOpacity(0.12),
                  ),
                  child: TabBar(
                    padding: EdgeInsets.all(2),
                    indicator: BoxDecoration(
                      color: AppColors.WHITE,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    tabs: [
                      Tab(
                        child: AppWidgets.imageSvg(
                          path: AppImageUtils.IC_READ,
                        ),
                      ),
                      Tab(
                        child: AppWidgets.imageSvg(
                          path: AppImageUtils.IC_UNREAD,
                        ),
                      )
                    ],
                  ),
                ).paddingOnly(
                  bottom: 20,
                  left: 16,
                  right: 16,
                ),
              ],
            ),
            Container(
              width: 1.sw,
              height: 60,
              child: TabBarView(
                physics: BouncingScrollPhysics(),
                children: [
                  tabItem(context),
                  tabItem(context),
                  // BarChartSam??ple1(),
                  // BarChartSample1(),
                ],
              ),
            ),
          ],
        ).paddingAll(8),
      ),
    );
  }

  Widget tabItem(BuildContext context) {
    return Chart<void>(
      height: 600.0,
      state: ChartState(

        ChartData.fromList(
          [1, 3, 4, 2, 7, 6, 2, 5, 4].map((e) => BarValue<void>(e.toDouble())).toList(),
          axisMax: 8.0,
        ),
        itemOptions: BarItemOptions(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          radius: BorderRadius.vertical(top: Radius.circular(42.0)),
        ),
        backgroundDecorations: [

          GridDecoration(
            verticalAxisStep: 1,
            horizontalAxisStep: 1,
          ),
        ],
        foregroundDecorations: [
          BorderDecoration(borderWidth: 5.0),
        ],
      ),
    );
  }
}
