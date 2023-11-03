import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thrones_app/domain/repositories/authentication/authentication_repository_contract.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepositoryContract _authenticationRepository;

  AuthenticationBloc(this._authenticationRepository) : super(const AuthenticationState(AuthStatus.unauthenticated)) {
    on<OnStarted>(_onStarted);
    on<Login>(_login);
    on<Logout>(_logout);
  }

  void _onStarted(OnStarted event, Emitter<AuthenticationState> emit) {
    final isLoggedIn = _authenticationRepository.isLoggedIn();
    emit(AuthenticationState(isLoggedIn ? AuthStatus.authenticated : AuthStatus.unauthenticated));
  }

  void _login(Login event, Emitter<AuthenticationState> emit) {
    _authenticationRepository.login();
    emit(const AuthenticationState(AuthStatus.authenticated));
  }

  void _logout(Logout event, Emitter<AuthenticationState> emit) {
    _authenticationRepository.logout();
    emit(const AuthenticationState(AuthStatus.unauthenticated));
  }
}
