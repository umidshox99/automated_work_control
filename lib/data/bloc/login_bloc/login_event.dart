part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginChanged extends LoginEvent {
  final String login;

  const LoginChanged(this.login);

  @override
  List<Object?> get props => [login];
}

class LoginPasswordChanged extends LoginEvent {
  final String password;

  LoginPasswordChanged(this.password);

  @override
  List<Object?> get props => [password];
}

class LoginSignedIn extends LoginEvent {
  @override
  List<Object?> get props => [];
}
