import 'package:automated_work_control/data/extensions/widget_padding_extension.dart';
import 'package:automated_work_control/data/styles/app_colors.dart';
import 'package:automated_work_control/data/utils/app_image_utils.dart';
import 'package:automated_work_control/ui/pages/home_page/widget/home_actions_widget.dart';
import 'package:automated_work_control/ui/pages/home_page/widget/home_my_agenda_widget.dart';
import 'package:automated_work_control/ui/pages/home_page/widget/home_search_widget.dart';
import 'package:automated_work_control/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: RippleAnimation(
        repeat: true,
        color: AppColors.MAIN,
        minRadius: 40,
        ripplesCount: 3,
        child: FloatingActionButton(
          backgroundColor: AppColors.MAIN,
          onPressed: () {},
          child: AppWidgets.imageSvg(
            path: AppImageUtils.IC_ACTIVITY,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            HomeSearchWidget(),
            HomeActionsWidget(),
            HomeMyAgendaWidget()
          ],
        ).paddingAll(8),
      ),
    );
  }
}
