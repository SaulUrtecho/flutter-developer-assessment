abstract class AuthenticationRepositoryContract {
  bool isLoggedIn();
  void login();
  void logout();
}
