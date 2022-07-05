import 'package:automated_work_control/data/bloc/on_boarding_carousel_cubit/on_boarding_carousel_cubit.dart';
import 'package:automated_work_control/data/extensions/widget_padding_extension.dart';
import 'package:automated_work_control/data/localization/locale_keys.dart';
import 'package:automated_work_control/data/services/navigator_service.dart';
import 'package:automated_work_control/data/styles/app_colors.dart';
import 'package:automated_work_control/data/utils/app_image_utils.dart';
import 'package:automated_work_control/ui/pages/set_url_page/set_url_page.dart';
import 'package:automated_work_control/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingPage extends StatelessWidget {
  OnBoardingPage({Key? key}) : super(key: key);
  static const String routeName = "/onBoardingPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.WHITE,
      body: BlocProvider(
        create: (context) => OnBoardingCarouselCubit(),
        child: BlocBuilder<OnBoardingCarouselCubit, OnBoardingCarouselState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: PageView.builder(
                    controller:
                        context.read<OnBoardingCarouselCubit>().pageController,
                    onPageChanged: (index) {
                      context.read<OnBoardingCarouselCubit>().changed(index);
                    },
                    itemBuilder: (context, index) => AppWidgets.imageSvg(
                      path: state.items[index].image,
                      fit: BoxFit.fill,
                    ),
                    itemCount: state.items.length,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppWidgets.textLocale(
                              text: state.items[state.index].title,
                              color: AppColors.MAIN,
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                            AppWidgets.textLocale(
                              maxLines: 10,
                              fontSize: 14,
                              text: state.items[state.index].body,
                            ).paddingOnly(top: 22, right: 70),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AnimatedSmoothIndicator(
                            activeIndex: state.index,
                            count: state.items.length,
                            effect: ExpandingDotsEffect(
                              dotWidth: 8.0,
                              dotHeight: 8.0,
                            ), // your preferred effect
                            onDotClicked: (index) {},
                          ),
                          state.index == 2
                              ? InkWell(
                                  onTap: () {
                                    NavigatorService.to.pushReplacementNamed(
                                        SetUrlPage.routeName);
                                  },
                                  child: Container(
                                    height: 48,
                                    decoration: BoxDecoration(
                                        color: AppColors.MAIN,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12))),
                                    child: Center(
                                      child: AppWidgets.textLocale(
                                        color: AppColors.WHITE,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        text: LocaleKeys.str_get_started,
                                      ).paddingSymmetric(horizontal: 18),
                                    ),
                                  ),
                                )
                              : InkWell(
                                  onTap: () {
                                    var next = state.index + 1;
                                    context
                                        .read<OnBoardingCarouselCubit>()
                                        .pageController
                                        .jumpToPage(next);
                                    context
                                        .read<OnBoardingCarouselCubit>()
                                        .changed(next);
                                  },
                                  child: Container(
                                    height: 48,
                                    width: 48,
                                    decoration: BoxDecoration(
                                        color: AppColors.MAIN,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12))),
                                    child: AppWidgets.imageSvg(
                                        path: AppImageUtils.IC_ARROW_RIGHT),
                                  ),
                                ),
                        ],
                      ),
                    ],
                  ).paddingAll(16),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
