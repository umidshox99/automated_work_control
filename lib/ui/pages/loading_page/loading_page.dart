import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:automated_work_control/data/extensions/widget_padding_extension.dart';
import 'package:automated_work_control/data/styles/app_colors.dart';
import 'package:automated_work_control/ui/widgets/app_widgets.dart';

class LoadingPage extends StatelessWidget {
  static const String routeName = "/loadingPage";

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.4)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  color: AppColors.MAIN,
                ),
                AppWidgets.textLocale(
                  text: "Iltimos kutib turing",
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.BLACK,
                ).paddingOnly(top: 14.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
