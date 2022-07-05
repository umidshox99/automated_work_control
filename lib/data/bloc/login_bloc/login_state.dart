part of 'login_bloc.dart';


class LoginState extends Equatable {
  final String login;
  final bool loginSuccess;
  final String password;
  final bool isLoginBtnActive;
  final bool isLoading;

  const LoginState({
    this.login = '',
    this.password = '',
    this.isLoginBtnActive = false,
    this.loginSuccess = false,
    this.isLoading = false,
  });

  @override
  List<Object?> get props => [
        login,
        password,
    loginSuccess,
    isLoginBtnActive,
    isLoading,
      ];

  LoginState copyWith({
    String? login,
    String? password,
    bool? isLoginBtnActive,
    bool? loginSuccess,
    bool? isLoading,
  }) {
    return LoginState(
      login: login ?? this.login,
      password: password ?? this.password,
      loginSuccess: loginSuccess ?? this.loginSuccess,
      isLoginBtnActive: isLoginBtnActive ?? this.isLoginBtnActive,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
