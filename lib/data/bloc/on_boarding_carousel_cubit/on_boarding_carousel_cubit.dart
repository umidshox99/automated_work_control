import 'package:automated_work_control/data/localization/locale_keys.dart';
import 'package:automated_work_control/data/model/on_boarding_model.dart';
import 'package:automated_work_control/data/utils/app_image_utils.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'ob_boarding_carousel_state.dart';

class OnBoardingCarouselCubit extends Cubit<OnBoardingCarouselState> {
  PageController pageController;

  OnBoardingCarouselCubit()
      : pageController = PageController(),
        super(OnBoardingCarouselState(
          index: 0,
          items: [
            OnBoardingModel(
                image: AppImageUtils.IC_INTO_1,
                title: LocaleKeys.str_intro_title_1,
                body: LocaleKeys.str_intro_body_1),
            OnBoardingModel(
                image: AppImageUtils.IC_INTO_2,
                title: LocaleKeys.str_intro_title_2,
                body: LocaleKeys.str_intro_body_2),
            OnBoardingModel(
                image: AppImageUtils.IC_INTO_3,
                title: LocaleKeys.str_intro_title_3,
                body: LocaleKeys.str_intro_body_3),
          ],
        ));

  void changed(int value) {
    // pageController = PageController(initialPage: value);
    emit(state.copyWith(index: value));
  }
}
