import 'dart:ui' show lerpDouble;

import 'package:automated_work_control/data/extensions/widget_padding_extension.dart';
import 'package:automated_work_control/data/styles/app_colors.dart';
import 'package:automated_work_control/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/model/navigation_bar_item.dart';

const double DEFAULT_BAR_HEIGHT = 60;

const double DEFAULT_INDICATOR_HEIGHT = 4;

class TitledBottomNavigationBar extends StatefulWidget {
  final Curve curve;
  int currentIndex;

  final ValueChanged<int> onTap;

  final List<TitledNavigationBarItem> items;
  final double indicatorHeight;

  final double height;

  TitledBottomNavigationBar({
    required this.onTap,
    required this.items,
    this.curve = Curves.linear,
    this.currentIndex = 0,
    this.height = DEFAULT_BAR_HEIGHT,
    this.indicatorHeight = DEFAULT_INDICATOR_HEIGHT,
  }) : assert(items.length >= 2 && items.length <= 5);

  @override
  State createState() => _TitledBottomNavigationBarState();
}

class _TitledBottomNavigationBarState extends State<TitledBottomNavigationBar> {
  Curve get curve => widget.curve;

  List<TitledNavigationBarItem> get items => widget.items;

  double width = 0;
  Duration duration = Duration(milliseconds: 270);

  double _getIndicatorPosition(int index) {
    var isLtr = Directionality.of(context) == TextDirection.ltr;
    if (isLtr) {
      return lerpDouble(-1.0, 1.0, index / (items.length - 1))!;
    } else {
      return lerpDouble(1.0, -1.0, index / (items.length - 1))!;
    }
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: items.map((item) {
          var index = items.indexOf(item);
          return Material(
            color: AppColors.WHITE,
            child: InkResponse(
              splashColor: AppColors.MAIN.withOpacity(0.1),
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () => _select(index),
              child: _buildItemWidget(item, index == widget.currentIndex),
            ),
          );
        }).toList(),
      ),
    ).paddingOnly(top: widget.indicatorHeight);
  }

  void _select(int index) {
    widget.currentIndex = index;
    widget.onTap(widget.currentIndex);

    setState(() {});
  }

  Widget _buildIcon(TitledNavigationBarItem item, bool isSelected) {
    return Container(
      child: AppWidgets.imageSvg(
        path: isSelected ? item.image : item.image,
        width: 24,
        height: 24,
        fit: BoxFit.fill,
        color: isSelected ? AppColors.MAIN : AppColors.GREY,
      ).paddingOnly(top: 4.h),
    );
  }

  Widget _buildText(TitledNavigationBarItem item, bool isSelected) {
    return AppWidgets.textLocale(
      textAlign: TextAlign.center,
      text: item.title,
      fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
      color: isSelected ? AppColors.MAIN : AppColors.GREY,
      fontSize: 12,
    ).paddingOnly(top: 4.h, bottom: 8.h);
  }

  Widget _buildItemWidget(TitledNavigationBarItem item, bool isSelected) {
    return Container(
      height: widget.height,
      width: width / items.length,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          AnimatedOpacity(
            opacity: 1.0,
            duration: duration,
            curve: curve,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildIcon(item, isSelected),
                _buildText(item, isSelected),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
