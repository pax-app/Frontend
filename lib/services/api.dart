import 'dart:async';
import 'package:http/http.dart' as http;

class Routes {
  static const String LOGIN_ROUTE = "/auth/login";
  static const String LOGOUT_ROUTE = "/auth/logout";
  static const String REGISTER_ROUTE = "/auth/registration";
  static const String PROVIDER_REGISTRATION = "/provider_registration";
  static const String AUTH_STATUS = "/auth/status";
}

class Api {
  Api._privateConstructor();

  static final Api _instance = Api._privateConstructor();

  factory Api() {
    return _instance;
  }

  final String url = "http://172.18.0.1:5001";

  Future<dynamic> get(String route, {Map headers}) {
    return http
        .get(url + route, headers: headers)
        .then((http.Response response) {
      return response;
    });
  }

  Future<dynamic> post(String path, {Map headers, body, encoding}) {
    return http
        .post(url + path, body: body, headers: headers, encoding: encoding)
        .then((http.Response response) {
      return response;
    });
  }
}
