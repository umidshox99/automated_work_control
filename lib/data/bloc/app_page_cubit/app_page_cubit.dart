import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

part 'app_page_state.dart';

class AppPageCubit extends Cubit<AppPageChangePage> {
  static AppPageCubit get to => GetIt.I<AppPageCubit>();

  AppPageCubit()
      : pageController = PageController(viewportFraction: 1.0),
        super(AppPageChangePage(0));

  final PageController pageController;

  static Future init() async {
    GetIt.instance..registerSingleton<AppPageCubit>(AppPageCubit());
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }

  void pageChanged(int index) {
    pageController.jumpToPage(index);
    emit(AppPageChangePage(index));
  }
}
