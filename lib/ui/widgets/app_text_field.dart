import 'package:automated_work_control/data/extensions/widget_padding_extension.dart';
import 'package:automated_work_control/data/styles/app_colors.dart';
import 'package:automated_work_control/data/utils/app_image_utils.dart';
import 'package:automated_work_control/ui/widgets/app_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextField extends StatefulWidget {
  final String? labelText;
  final String hintText;
  final ValueChanged<String> onChanged;
  final TextInputFormatter? textInputFormatter;
  final TextInputType? textInputType;
  final bool isPassword;
  final bool enabled;
  final String initialText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? titleWidget;
  final Color? borderSide;
  final Color? hintColor;
  final Color? fillColor;
  final Color? textColor;
  final int? maxLines;
  final int? minLines;
  final double fontSize;

  AppTextField({
    required this.onChanged,
    this.textInputFormatter,
    this.labelText,
    this.textInputType,
    this.hintText = "",
    this.isPassword = false,
    this.enabled = true,
    this.initialText = '',
    this.prefixIcon,
    this.suffixIcon,
    this.titleWidget,
    this.borderSide,
    this.hintColor,
    this.fillColor,
    this.textColor,
    this.minLines = 1,
    this.fontSize = 16,
    this.maxLines = 1,
  });

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late TextEditingController _textEditingController;
  late bool obscureText;

  @override
  void initState() {
    _textEditingController = TextEditingController(
      text: widget.initialText,
    );
    obscureText = widget.isPassword;
    _border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(
        color: widget.borderSide ?? AppColors.WHITE.withOpacity(0.14),
        width: 1.0,
      ),
    );
    isInitialText = widget.initialText.isNotEmpty;
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  InputBorder? _border;
  late bool isInitialText;

  @override
  Widget build(BuildContext context) {
    if (isInitialText && widget.initialText != "") {
      _textEditingController.text = widget.initialText;
      isInitialText = false;
    }
    if (!widget.enabled && widget.initialText != "") {
      _textEditingController.text = widget.initialText;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.titleWidget ?? SizedBox(),
        TextField(
          minLines: widget.minLines,
          maxLines: widget.maxLines,
          enabled: widget.enabled,
          controller: _textEditingController,
          decoration: InputDecoration(
            fillColor: widget.fillColor,
            filled: true,
            labelText:
                widget.labelText != null ? tr(widget.labelText ?? "") : null,
            labelStyle: GoogleFonts.poppins(
              fontSize: widget.fontSize.sp,
              color: AppColors.WHITE.withOpacity(0.64),
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
            ),
            hintStyle: GoogleFonts.poppins(
              fontSize: widget.fontSize.sp,
              color: widget.hintColor ?? AppColors.WHITE.withOpacity(0.64),
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
            ),
            hintText: tr(widget.hintText),
            focusedBorder: _border,
            border: _border,
            enabledBorder: _border,
            disabledBorder: _border,
            contentPadding: EdgeInsets.only(
              top: widget.prefixIcon == null ? 10.h : 0,
              bottom: 8.h,
              left: 20.w,
            ),
            prefixIcon: widget.prefixIcon ?? SizedBox(width: 20.w),
            prefixIconConstraints: BoxConstraints(
              maxHeight: 60.h,
            ),
            suffixIcon: widget.isPassword
                ? InkWell(
                    onTap: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    child: AppWidgets.imageSvg(
                      path: !obscureText
                          ? AppImageUtils.IC_NOT_VISIBLE
                          : AppImageUtils.IC_VISIBLE,
                    ).paddingOnly(
                      left: 14.w,
                      bottom: 14.h,
                      top: 14.h,
                      right: 8.h,
                    ),
                  )
                : widget.suffixIcon,
          ),
          obscureText: obscureText,
          inputFormatters: widget.textInputFormatter == null
              ? null
              : [
                  widget.textInputFormatter!,
                ],
          style: GoogleFonts.poppins(
              fontSize: widget.fontSize,
              color: widget.textColor ?? AppColors.WHITE,
              fontWeight: FontWeight.w500),
          keyboardType: widget.textInputType,
          onChanged: (value) => widget.onChanged(value),
        ),
      ],
    );
  }
}
