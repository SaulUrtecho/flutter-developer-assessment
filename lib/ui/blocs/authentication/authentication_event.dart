part of 'authentication_bloc.dart';

class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class OnStarted extends AuthenticationEvent {
  const OnStarted();

  @override
  String toString() => 'OnStarted';
}

class Login extends AuthenticationEvent {
  const Login();

  @override
  String toString() => 'Login';
}

class Logout extends AuthenticationEvent {
  const Logout();

  @override
  String toString() => 'Logout';
}
