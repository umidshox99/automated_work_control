import 'package:automated_work_control/data/extensions/widget_padding_extension.dart';
import 'package:automated_work_control/data/localization/locale_keys.dart';
import 'package:automated_work_control/data/model/document_exchange_data.dart';
import 'package:automated_work_control/data/styles/app_colors.dart';
import 'package:automated_work_control/data/utils/app_image_utils.dart';
import 'package:automated_work_control/ui/widgets/app_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pie_chart/pie_chart.dart';

class HomeMessagesWidget extends StatelessWidget {
  const HomeMessagesWidget({Key? key, this.documentExchangeData})
      : super(key: key);
  final DocumentExchangeData? documentExchangeData;

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
                ],
              ),
            ),
          ],
        ).paddingAll(8),
      ),
    );
  }

  Column tabItem(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppWidgets.textLocale(
          text: LocaleKeys.str_document_exchange,
          fontWeight: FontWeight.w400,
          color: AppColors.DARK_GREY,
          fontSize: 12,
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppWidgets.textLocale(
                    text: LocaleKeys.str_documents,
                    fontWeight: FontWeight.w400,
                    color: AppColors.DARK_GREY,
                    fontSize: 14,
                    args: [documentExchangeData!.allAssignmentDocuments.toString()],
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 8,
                              width: 8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(2),
                                ),
                                border: Border.all(
                                  color: AppColors.MAIN,
                                  width: 1,
                                ),
                              ),
                            ).paddingOnly(
                              right: 10,
                            ),
                            AppWidgets.textLocale(
                              text: LocaleKeys.str_docs,
                              fontWeight: FontWeight.w400,
                              color: AppColors.DARK_GREY,
                              fontSize: 12,
                              args: [documentExchangeData!.assignmentUnreadDocuments.toString()],
                            ),
                          ],
                        ).paddingOnly(right: 10),
                        Row(
                          children: [
                            Container(
                              height: 8,
                              width: 8,
                              decoration: BoxDecoration(
                                color: AppColors.MAIN,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(2),
                                ),
                                border: Border.all(
                                  color: AppColors.MAIN,
                                  width: 1,
                                ),
                              ),
                            ).paddingOnly(
                              right: 10,
                            ),
                            AppWidgets.textLocale(
                              text: LocaleKeys.str_docs,
                              fontWeight: FontWeight.w400,
                              color: AppColors.DARK_GREY,
                              fontSize: 12,
                              args: [documentExchangeData!.allToViewDocuments.toString()],
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(2),
                              ),
                              border: Border.all(
                                color: AppColors.MAIN,
                                width: 1,
                              ),
                            ),
                          ).paddingOnly(
                            right: 10,
                          ),
                          AppWidgets.textLocale(
                            text: LocaleKeys.str_to_view,
                            fontWeight: FontWeight.w400,
                            color: AppColors.DARK_GREY,
                            fontSize: 12,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                              color: AppColors.MAIN,
                              borderRadius: BorderRadius.all(
                                Radius.circular(2),
                              ),
                              border: Border.all(
                                color: AppColors.MAIN,
                                width: 1,
                              ),
                            ),
                          ).paddingOnly(
                            right: 10,
                          ),
                          AppWidgets.textLocale(
                            text: LocaleKeys.str_to_do,
                            fontWeight: FontWeight.w400,
                            color: AppColors.DARK_GREY,
                            fontSize: 12,
                          ),
                        ],
                      ),
                    ],
                  ),
                  PieChart(
                    dataMap: {
                      "To view": documentExchangeData!.assignmentUnreadDocuments!.toDouble(),
                      "To do": documentExchangeData!.allToViewDocuments!.toDouble(),
                    },
                    animationDuration: Duration(milliseconds: 800),
                    colorList: [
                      AppColors.MAIN,
                      AppColors.WHITE,
                    ],
                    chartRadius: MediaQuery.of(context).size.width / 3.2,
                    initialAngleInDegree: 0,
                    legendOptions: LegendOptions(
                      legendPosition: LegendPosition.right,
                      showLegends: false,
                      legendTextStyle: GoogleFonts.poppins(
                        fontSize: 12,
                      ),
                    ),
                    chartValuesOptions: ChartValuesOptions(
                      showChartValueBackground: true,
                      showChartValues: false,
                      showChartValuesInPercentage: false,
                      showChartValuesOutside: false,
                      decimalPlaces: 1,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
