part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  final AuthStatus authStatus;

  const AuthenticationState(this.authStatus);

  @override
  List<Object> get props => [authStatus];
}

enum AuthStatus {
  authenticated,
  unauthenticated,
}
