import 'package:automated_work_control/data/extensions/widget_padding_extension.dart';
import 'package:automated_work_control/data/localization/locale_keys.dart';
import 'package:automated_work_control/data/styles/app_colors.dart';
import 'package:automated_work_control/data/utils/app_image_utils.dart';
import 'package:automated_work_control/ui/widgets/app_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeMyAgendaWidget extends StatelessWidget {
  const HomeMyAgendaWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: 1.sw,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          color: AppColors.WHITE,
        ),
        child: Column(
          children: [
            agendaTitle().paddingAll(8),
            buildDays(),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppWidgets.imageAsset(
                  path: AppImageUtils.EMPTY,
                  height: 80,
                  width: 80,
                ),
                AppWidgets.textLocale(
                  text: LocaleKeys.str_do_not_have_activity,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.DARK_GREY.withOpacity(0.4),
                ),
              ],
            )),
            Container(
              height: 48,
              child: Row(
                children: [
                  FloatingActionButton(
                    onPressed: () {},
                    backgroundColor: AppColors.MAIN,
                    child: AppWidgets.imageSvg(path: AppImageUtils.IC_PLUS),
                  ).paddingAll(2),
                  Expanded(
                    child: AppWidgets.textLocale(
                      text: LocaleKeys.str_add_meeting,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.DARK_GREY.withOpacity(0.4),
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                color: AppColors.BACKGROUND,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    24,
                  ),
                ),
              ),
            ).paddingAll(8)
          ],
        ),
      ).paddingSymmetric(vertical: 8),
    );
  }

  Container buildDays() {
    return Container(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.MAIN,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(6),
            ),
          ),
          height: 80,
          width: 48,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(6),
                    topRight: Radius.circular(6),
                  ),
                  color: AppColors.MAIN,
                ),
                width: 32,
                height: 16,
              ),
              AppWidgets.text(
                text: "Mon",
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              AppWidgets.text(
                text: "12",
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ],
          ).paddingAll(8),
        ).paddingAll(4),
        itemCount: 10,
      ),
    );
  }

  Row agendaTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppWidgets.textLocale(
          text: LocaleKeys.str_my_agenda,
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: AppColors.DARK_GREY.withOpacity(0.8),
        ),
        AppWidgets.imageSvg(
          path: AppImageUtils.IC_CALENDAR2,
        ),
      ],
    );
  }
}
