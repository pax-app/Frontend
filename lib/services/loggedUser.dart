import 'package:Pax/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoggedUser extends User {
  String token, userId;
  SharedPreferences _preferences;
  void _loadStateFromPreferences() async {
    _preferences = await SharedPreferences.getInstance();
    this.name = _preferences.getString("LastUser");
    this.token = _preferences.getString("LastToken");
    this.email = _preferences.getString("LastEmail");
    this.userId = _preferences.getString("LastUserID");
  }

  void setName(name) {
    this.name = name;
    _preferences.setString("LastUser", name);
  }

  void setToken(token) {
    this.token = token;
    _preferences.setString("LastUser", token);
  }

  void setEmail(email) {
    this.email = email;
    _preferences.setString("LastEmail", email);
  }

  void setUserId(userId) {
    this.userId = userId;
    _preferences.setString("LastUserID", userId);
  }

  LoggedUser._privateConstructor() {
    _loadStateFromPreferences();
  }

  static final LoggedUser _instance = LoggedUser._privateConstructor();

  factory LoggedUser() {
    return _instance;
  }

  void clearAuthData() {
    _preferences.setString("LastUser", "");
    _preferences.setString("LastUser", "");
    _preferences.setString("LastEmail", "");
    _preferences.setString("LastUserID", "");
  }
}
