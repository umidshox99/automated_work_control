import 'dart:async';

import 'package:automated_work_control/data/model/user_model.dart';
import 'package:automated_work_control/data/services/db_service.dart';
import 'package:automated_work_control/data/services/http/login_register_service.dart';
import 'package:automated_work_control/data/services/http/user_service.dart';
import 'package:automated_work_control/data/services/storage_service.dart';
import 'package:automated_work_control/data/utils/app_logger_utils.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc()
      : super(
          LoginState(),
        ) {
    on<LoginChanged>(_onLoginChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginSignedIn>(_onSignedIn);
  }

  Future _onSignedIn(LoginSignedIn event, Emitter<LoginState> emit) async {
    emit(state.copyWith(isLoading: true));
    bool? loginResponse = await LoginRegisterService.to.signIn(
      login: state.login,
      password: state.password,
    );
    if (loginResponse != null) {
      AppLoggerUtils.e(loginResponse.toString());
      await StorageService.to.setAccessToken(
        "loginResponse.token!",
      );
      UserModel? user = await UserService.to.getUser();
      if (user != null) {
        DBService.to.saveUser(user);
        emit(state.copyWith(loginSuccess: true));
      } else {
        // TODO: Why null?
      }
    }
    emit(state.copyWith(isLoading: false));
  }

  void _onPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(
      password: event.password,
      isLoginBtnActive: isLoginBtnActive,
    ));
  }

  void _onLoginChanged(LoginChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(
      login: event.login,
      isLoginBtnActive: isLoginBtnActive,
    ));
  }

  bool get isLoginBtnActive =>
      state.login.isNotEmpty && state.password.length > 4;
}
