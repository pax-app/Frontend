import 'dart:async';
import 'dart:convert';

import 'package:Pax/services/api.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Pax/models/login_model.dart';

class LoginBloc extends BlocBase {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final Api _api = Api();

  Stream<bool> get validInputsStream => Observable.combineLatest2(
      _emailController.stream,
      _passwordController.stream,
      (email, password) => true);

  Function(String) get emailSink => _emailController.sink.add;
  Function(String) get passwordSink => _passwordController.sink.add;

  void saveCurrentLogin(Map responseJson) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var loginModel = (responseJson != null && responseJson.isNotEmpty)
        ? LoginModel.fromJson(responseJson)
        : null;

    var user = loginModel != null ? loginModel.userName : "";
    var token = loginModel != null ? loginModel.token : "";
    var email = loginModel != null ? loginModel.email : "";

    await preferences.setString(
        'LastUser', (user != null && user.length > 0) ? user : "");
    await preferences.setString(
        'LastToken', (token != null && token.length > 0) ? token : "");
    await preferences.setString(
        'LastEmail', (email != null && email.length > 0) ? email : "");
  }

  getToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    String token = preferences.getString("LastToken");
    return token;
  }

  Future<bool> checkIfUserIsLogged() async {
    var token = await getToken();
    return (token != null && token != "") ? true : false;
  }

  Future<int> logIn() async {
    final email = _emailController.value;
    final password = _passwordController.value;
    Map<String, String> body = {'email': email, 'password': password};
    Map<String, String> header = {'content-type': 'application/json'};

    var jsonBody = json.encode(body);
    final response = await _api.post(
      Routes.LOGIN_ROUTE,
      headers: header,
      body: jsonBody,
    );
    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);

      saveCurrentLogin(responseJson);
    }
    return response.statusCode;
  }

  Future<bool> logOut() async {
    final token = await getToken();
    Map<String, String> header = {
      'content-type': 'application/json',
      'Authorization': 'Token $token'
    };

    final response = await _api.get(Routes.LOGOUT_ROUTE, headers: header);
    if (response.statusCode == 200 ||
        response.statusCode == 401 ||
        response.statusCode == 404) {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      await preferences.setString('LastUser', "");
      await preferences.setString('LastToken', "");
      await preferences.setString('LastEmail', "");
    }
    return true;
  }

  @override
  void dispose() {
    _emailController.close();
    _passwordController.close();
  }
}
