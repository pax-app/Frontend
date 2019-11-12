import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Routes {
  static const String LOGIN_ROUTE = "/auth/login";
  static const String LOGOUT_ROUTE = "/auth/logout";
  static const String REGISTER_ROUTE = "/auth/registration";
  static const String PROVIDER_REGISTRATION = "/provider_registration";
  static const String AUTH_STATUS = "/auth/status";
  static const String GENERAL_CATEGORY = "/category/general";
  static const String PROVIDER_CATEGORY = "/category/provider";
  static String CATEGORY_PROVIDERS(id) {
    return "/category/provider/$id";
  }
}

class Services {
  static const String CHAT = ":3001";
  static const String USER = ":5001";
  static const String CATEGORY = ":5002";
  static const String REVIEW = ":5004";
  static const String REPORT = ":5005";
}

class Api {
  Api._privateConstructor();

  static final Api _instance = Api._privateConstructor();

  factory Api() {
    return _instance;
  }

  final String baseUrl = "http://172.18.0.1";

  Future<dynamic> get(String service, String route, {Map headers}) {
    return http
        .get(baseUrl + service + route, headers: headers)
        .then((http.Response response) {
      return response;
    });
  }

  Future<dynamic> post(String service, String route,
      {Map headers, body, encoding}) {
    return http
        .post(baseUrl + service + route,
            body: body, headers: headers, encoding: encoding)
        .then((http.Response response) {
      return response;
    });
  }
}
