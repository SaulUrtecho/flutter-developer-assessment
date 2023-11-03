import 'package:shared_preferences/shared_preferences.dart';

// Authentication Datasource contract
abstract class AuthenticationDataSource {
  bool isLoggedIn();
  void login();
  void logout();
}

/* The above contract is implemented.
 This class helps to handle the local storage.
 There are 3 methods to simulate if the user is logged already,
 when the user is doing login in the app, and when the user do logout */
class AuthenticationLocalDataSource implements AuthenticationDataSource {
  final SharedPreferences _prefs;
  static const isLoggedInKey = 'isLoggedInKey';

  AuthenticationLocalDataSource(this._prefs);

  @override
  bool isLoggedIn() {
    try {
      return _prefs.getBool(isLoggedInKey) ?? false;
    } catch (e) {
      rethrow;
    }
  }

  @override
  void login() {
    try {
      _prefs.setBool(isLoggedInKey, true);
    } catch (e) {
      rethrow;
    }
  }

  @override
  void logout() {
    try {
      _prefs.setBool(isLoggedInKey, false);
    } catch (e) {
      rethrow;
    }
  }
}
