import 'package:Pax/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:async/async.dart';

class LoggedUser extends User {
  String token, userId;
  bool didLogout = true, isProvider = false, isInProviderDrawer = false;

  static SharedPreferences _preferences;
  final _initPreferences = AsyncMemoizer<SharedPreferences>();

  Future<SharedPreferences> get preferences async {
    if (_preferences != null) return _preferences;
    _preferences = await _initPreferences.runOnce(() async {
      return await SharedPreferences.getInstance();
    });

    return _preferences;
  }

  Future _loadStateFromPreferences() async {
    var preferences = await this.preferences;
    this.name = preferences.getString("LastUser");
    this.token = preferences.getString("LastToken");
    this.email = preferences.getString("LastEmail");
    this.userId = preferences.getString("LastUserID");
    this.isProvider = preferences.getBool("LastUserIsProvider") != null
        ? preferences.getBool("LastUserIsProvider")
        : false;
    this.photo = preferences.getString("LastPhoto");
  }

  Future setName(name) async {
    var preferences = await this.preferences;
    this.name = name;
    preferences.setString("LastUser", name);
  }

  Future setToken(token) async {
    var preferences = await this.preferences;
    this.token = token;
    preferences.setString("LastToken", token);
  }

  Future setEmail(email) async {
    var preferences = await this.preferences;
    this.email = email;
    preferences.setString("LastEmail", email);
  }

  Future setPhoto(photo) async {
    var preferences = await this.preferences;
    this.photo = photo;
    preferences.setString("lastPhoto", photo);
  }

  Future setUserId(userId) async {
    var preferences = await this.preferences;
    this.userId = userId;
    preferences.setString("LastUserID", userId);
  }

  Future setIsProvider(bool isProvider) async {
    var preferences = await this.preferences;
    this.isProvider = isProvider != null ? isProvider : false;
    preferences.setBool(
        "LastUserIsProvider", isProvider != null ? isProvider : false);
  }

  bool isEmpty() {
    return (this.name == "" &&
        this.token == "" &&
        this.email == "" &&
        this.userId == "");
  }

  LoggedUser._privateConstructor() {
    if (this.isEmpty() && this.didLogout) {
      _loadStateFromPreferences();
      this.didLogout = false;
    }
  }

  static final LoggedUser _instance = LoggedUser._privateConstructor();

  factory LoggedUser() {
    return _instance;
  }

  Future clearAuthData() async {
    var preferences = await this.preferences;
    preferences.setString("LastUser", "");
    preferences.setString("LastToken", "");
    preferences.setString("LastEmail", "");
    preferences.setString("LastEmail", "");
    preferences.setString("LastPhoto", "");
    preferences.setString("LastUserID", "");
    preferences.setBool("LastUserIsProvider", false);
    this.name = preferences.getString("LastUser");
    this.token = preferences.getString("LastToken");
    this.email = preferences.getString("LastEmail");
    this.userId = preferences.getString("LastUserID");
    this.photo = preferences.getString("LastPhoto");
    this.isProvider = preferences.getBool("LastUserIsProvider");
    this.didLogout = true;
  }
}
