part of 'authentication_bloc.dart';

class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

// Event for handle when the app is open
class OnStarted extends AuthenticationEvent {
  const OnStarted();

  @override
  String toString() => 'OnStarted';
}

// Event when the user is doing login
class Login extends AuthenticationEvent {
  const Login();

  @override
  String toString() => 'Login';
}

// Event when the user do logout
class Logout extends AuthenticationEvent {
  const Logout();

  @override
  String toString() => 'Logout';
}
