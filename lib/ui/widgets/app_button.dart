import 'package:automated_work_control/data/extensions/widget_padding_extension.dart';
import 'package:automated_work_control/data/styles/app_colors.dart';
import 'package:automated_work_control/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final double? width;
  final double? padding;
  final Color? textColor;
  final Color? primaryColor;
  final Widget? child;

  const AppButton({
    required this.onPressed,
    required this.text,
    this.width,
    this.textColor,
    this.padding,
    this.primaryColor,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shadowColor: Colors.transparent,
        primary:primaryColor?? AppColors.WHITE.withOpacity(0.15),
        padding: EdgeInsets.all(12.w),
        fixedSize: width == null ? Size.fromWidth(1.sw) : Size.fromWidth(width!),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            12.w,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          child??SizedBox(),
          AppWidgets.textLocale(
            text: text,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color:textColor??AppColors.WHITE,
          ),
        ],
      ),
    ).paddingAll(padding ?? 20);
  }
}
