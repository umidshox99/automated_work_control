import 'package:auto_size_text/auto_size_text.dart';
import 'package:automated_work_control/data/services/navigator_service.dart';
import 'package:automated_work_control/data/styles/app_colors.dart';
import 'package:automated_work_control/data/utils/app_image_utils.dart';
import 'package:automated_work_control/ui/pages/loading_page/loading_page.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:super_rich_text/super_rich_text.dart';

enum TextFont {
  BOLD,
  MEDIUM,
  THIN,
}

/// Please don't change [fontSize] directly.
/// [fontSize] used project wide.
Widget _baseText({
  required String text,
  FontStyle fontStyle = FontStyle.normal,
  double? fontSize,
  Color? color,
  FontWeight fontWeight = FontWeight.normal,
  int maxLines = 1,
  bool autoResize = false,
  TextAlign textAlign = TextAlign.start,
  bool richText = false,
  double height = 1,
  List<MarkerText> othersMarkers = const [],
  TextFont textFont = TextFont.MEDIUM,
}) {
  TextStyle textStyle = GoogleFonts.poppins(
    fontSize: fontSize ?? 16.sp,
    color: color ?? AppColors.MAIN_DARK,
    fontStyle: fontStyle,
    fontWeight: fontWeight,
    height: height,
    // fontFamily: getFont(textFont),
  );
  if (richText) {
    return SuperRichText(
      text: text,
      style: textStyle,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      othersMarkers: othersMarkers,
    );
  }
  if (autoResize) {
    return AutoSizeText(
      text,
      style: textStyle,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }
  return Text(
    text,
    textAlign: textAlign,
    style: textStyle,
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
  );
}

String getFont(TextFont textFont) {
  switch (textFont) {
    case TextFont.BOLD:
      return "TTNormsPro-Bold";
    case TextFont.THIN:
      return "TTNormsPro-Thin";
    default:
      return "TTNormsPro-Medium";
  }
}

class AppWidgets {
  static Widget text({
    required String text,
    double? fontSize,
    Color? color,
    FontWeight fontWeight = FontWeight.normal,
    FontStyle fontStyle = FontStyle.normal,
    int maxLines = 1,
    bool autoResize = false,
    TextAlign textAlign = TextAlign.start,
    bool richText = false,
    List<MarkerText> othersMarkers = const [],
    double height = 1,
    TextFont textFont = TextFont.MEDIUM,
  }) {
    return _baseText(
      textAlign: textAlign,
      text: text,
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      maxLines: maxLines,
      autoResize: autoResize,
      fontStyle: fontStyle,
      richText: richText,
      othersMarkers: othersMarkers,
      height: height,
    );
  }

  static Widget textGradient({
    required String text,
    double? fontSize,
    Color? color,
    FontWeight fontWeight = FontWeight.normal,
    FontStyle fontStyle = FontStyle.normal,
    int maxLines = 1,
    double height = 1,
    List<Color>? colors,
    GradientDirection? gradientDirection,
    TextFont textFont = TextFont.MEDIUM,
  }) {
    TextStyle textStyle = TextStyle(
        fontSize: fontSize ?? 16.sp,
        color: color ?? AppColors.BLACK,
        fontStyle: fontStyle,
        fontWeight: fontWeight,
        height: height,
        fontFamily: getFont(textFont));
    return GradientText(
      text,
      gradientDirection: gradientDirection ?? GradientDirection.btt,
      style: textStyle,
      colors: colors ??
          [
            AppColors.RED2,
            AppColors.RED1,
          ],
    );
  }

  static Widget textLocale({
    required String text,
    double? fontSize,
    Color? color,
    FontWeight fontWeight = FontWeight.normal,
    FontStyle fontStyle = FontStyle.normal,
    int maxLines = 1,
    bool autoResize = false,
    TextAlign textAlign = TextAlign.start,
    List<String> args = const [],
    bool richText = false,
    TextFont textFont = TextFont.MEDIUM,
    double height = 1.4,
    List<MarkerText> othersMarkers = const [],
  }) {
    return _baseText(
      textAlign: textAlign,
      text: tr(text, args: args),
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      maxLines: maxLines,
      autoResize: autoResize,
      fontStyle: fontStyle,
      richText: richText,
      othersMarkers: othersMarkers,
      height: height,
      textFont: textFont,
    );
  }

  static Widget imageAsset({
    required String path,
    double? height,
    double? width,
    Color? color,
    BoxFit fit = BoxFit.cover,
  }) {
    return Image.asset(
      path,
      height: height,
      width: width,
      fit: fit,
      color: color,
    );
  }

  static Widget imageNetwork({
    required String path,
    double? height,
    double? width,
    Color? color,
    BoxFit fit = BoxFit.cover,
  }) {
    return CachedNetworkImage(
      imageUrl: path,
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          CircularProgressIndicator(value: downloadProgress.progress),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }

  static Widget imageSvg({
    required String path,
    double? height,
    double? width,
    BoxFit fit = BoxFit.none,
    Color? color,
  }) {
    return SvgPicture.asset(
      path,
      height: height,
      width: width,
      fit: fit,
      color: color,
    );
  }

  static void showText({
    required String text,
    Duration? duration,
  }) {
    if (duration == null) {
      duration = Duration(seconds: 2);
    }
    BotToast.showText(
      text: text,
      textStyle: TextStyle(
        fontSize: 14.sp,
        color: AppColors.WHITE,
        fontFamily: getFont(TextFont.MEDIUM),
      ),
      align: Alignment.center,
      duration: duration,
    );
  }

  static PreferredSizeWidget appBar({
    required String title,
    bool centerTitle = false,
    bool hasLeading = false,
    Function? onTap,
    double? fontSize,
    List<Widget>? actions,
    TextFont? textFont,
  }) {
    return AppBar(
      backgroundColor: AppColors.WHITE,
      shadowColor: AppColors.MAIN_DARK.withOpacity(0.1),
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.only(
          bottomLeft: Radius.circular(8.0),
          bottomRight: Radius.circular(8.0),
        ),
      ),
      title: AppWidgets.textLocale(
          text: title,
          color: AppColors.MAIN_DARK,
          fontSize: fontSize ?? 20,
          fontWeight: FontWeight.w700,
          textFont: textFont ?? TextFont.MEDIUM),
      leading: hasLeading
          ? InkWell(
              child: AppWidgets.imageSvg(path: AppImageUtils.IC_ARROW_RIGHT),
              onTap: () {
                onTap ?? NavigatorService.to.pop();
              },
            )
          : SizedBox(),
      actions: actions,
      centerTitle: centerTitle,
      automaticallyImplyLeading: false,
    );
  }

  static void isLoading(bool value) {
    if (value) {
      NavigatorService.to.push(
        PageRouteBuilder(
          opaque: false,
          pageBuilder: (context, animation, secondaryAnimation) =>
              LoadingPage(),
        ),
      );
    } else {
      NavigatorService.to.pop();
    }
  }

  static Widget progressIndicator() {
    return Center(
      child: SpinKitCircle(
        color: AppColors.MAIN,
        size: 25.0,
      ),
    );
  }
}
