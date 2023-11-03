part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  final AuthStatus authStatus;

  const AuthenticationState(this.authStatus);

  @override
  List<Object> get props => [authStatus];
}

// enum for validate the user's states
enum AuthStatus {
  authenticated,
  unauthenticated,
}
