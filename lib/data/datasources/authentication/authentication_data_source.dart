import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthenticationDataSource {
  bool isLoggedIn();
  void login();
  void logout();
}

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
