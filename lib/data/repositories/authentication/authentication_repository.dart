import 'package:thrones_app/data/datasources/authentication/authentication_data_source.dart';
import 'package:thrones_app/domain/repositories/authentication/authentication_repository_contract.dart';

/*  The contract is implemented and the methods for handle
 the authentication are placed */
class AuthenticationRepository implements AuthenticationRepositoryContract {
  final AuthenticationDataSource _authenticationDataSource;

  AuthenticationRepository(this._authenticationDataSource);

  @override
  bool isLoggedIn() => _authenticationDataSource.isLoggedIn();

  @override
  void login() => _authenticationDataSource.login();

  @override
  void logout() => _authenticationDataSource.logout();
}
