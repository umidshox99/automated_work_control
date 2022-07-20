import 'package:automated_work_control/data/extensions/widget_padding_extension.dart';
import 'package:automated_work_control/data/styles/app_colors.dart';
import 'package:automated_work_control/data/utils/app_image_utils.dart';
import 'package:automated_work_control/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';

class HomeSearchWidget extends StatelessWidget {
  const HomeSearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.WHITE,
        borderRadius: BorderRadius.all(
          Radius.circular(32),
        ),
      ),
      child: Row(
        children: [
          AppWidgets.imageSvg(
            path: AppImageUtils.IC_SEARCH,
          ).paddingOnly(left: 18,right: 10),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search...",
                border: InputBorder.none,
              ),
            ),
          ),
          AppWidgets.imageAsset(
            width: 40,
            height: 40,
            path: AppImageUtils.PROFILE_IMG,
          ).paddingAll(4),
        ],
      ),
    );
  }
}
