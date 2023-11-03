// Contract for handle the authentication

abstract class AuthenticationRepositoryContract {
  bool isLoggedIn();
  void login();
  void logout();
}
