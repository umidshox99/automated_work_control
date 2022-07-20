import 'package:automated_work_control/data/extensions/widget_padding_extension.dart';
import 'package:automated_work_control/data/localization/locale_keys.dart';
import 'package:automated_work_control/data/model/birthday_data.dart';
import 'package:automated_work_control/data/model/response_data.dart';
import 'package:automated_work_control/data/styles/app_colors.dart';
import 'package:automated_work_control/data/utils/app_image_utils.dart';
import 'package:automated_work_control/ui/widgets/app_widgets.dart';
import 'package:charts_painter/chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBirthdaysWidget extends StatelessWidget {
  HomeBirthdaysWidget({Key? key, required this.data}) : super(key: key);
  final ResponseData<BirthdayData>? data;

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
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppWidgets.textLocale(
                text: LocaleKeys.str_birthdays_today,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
              AppWidgets.textLocale(
                text: LocaleKeys.str_see_all,
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: AppColors.MAIN,
              ),
            ],
          ),
          Expanded(
            child: ListView.separated(
              // shrinkWrap: true,
              itemBuilder: (context, index) => Row(
                children: [
                  AppWidgets.imageAsset(
                    height: 40,
                    width: 40,
                    path: AppImageUtils.PROFILE_IMG,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppWidgets.text(
                                text:
                                    "${data!.results![index].lastName} ${data!.results![index].firstName} ${data!.results![index].fatherName}",
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.DARK_GREY)
                            .paddingOnly(bottom: 4),
                        AppWidgets.text(
                          maxLines: 1,
                          text: "${data!.results![index].topLevelDeptName}",
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.DARK_GREY,
                        ),
                      ],
                    ).paddingOnly(left: 8),
                  )
                ],
              ).paddingSymmetric(
                vertical: 2,
                horizontal: 8,
              ),
              separatorBuilder: (context, index) => Divider(),
              itemCount: data?.results?.length ?? 0,
            ),
          )
        ],
      ).paddingAll(8),
    );
  }
}
