import 'dart:async';
import 'dart:convert';

import 'package:Pax/blocs/signup_bloc.dart';
import 'package:Pax/services/api.dart';
import 'package:Pax/services/loggedUser.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

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
  var loggedUser = LoggedUser();

  getToken() async {
    String token = loggedUser.token;
    return token;
  }

  Future<bool> checkIfUserIsLogged() async {
    var token = await getToken();
    Map<String, String> header = {
      'content-type': 'application/json',
      'Authorization': 'Token $token'
    };

    final response =
        await _api.get(Services.USER, Routes.AUTH_STATUS, headers: header);
    if (response.statusCode == 200)
      return true;
    else {
      await loggedUser.clearAuthData();
      return false;
    }
  }

  Future<dynamic> logIn() async {
    final email = _emailController.value;
    final password = _passwordController.value;
    Map<String, String> body = {'email': email, 'password': password};
    Map<String, String> header = {'content-type': 'application/json'};

    var jsonBody = json.encode(body);
    final response = await _api.post(
      Services.USER,
      Routes.LOGIN_ROUTE,
      headers: header,
      body: jsonBody,
    );
    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      SignUpBloc.saveCurrentLogin(responseJson);
    }
    return response;
  }

  Future<bool> logOut() async {
    final token = await getToken();
    Map<String, String> header = {
      'content-type': 'application/json',
      'Authorization': 'Token $token'
    };

    final response =
        await _api.get(Services.USER, Routes.LOGOUT_ROUTE, headers: header);
    if (response.statusCode == 200 ||
        response.statusCode == 401 ||
        response.statusCode == 404) {
      var loggedUser = LoggedUser();
      await loggedUser.clearAuthData();
    }
    return true;
  }

  @override
  void dispose() {
    _emailController.close();
    _passwordController.close();
  }
}
