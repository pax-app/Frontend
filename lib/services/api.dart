import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Routes {
  static const String LOGIN_ROUTE = "/auth/login";
  static const String LOGOUT_ROUTE = "/auth/logout";
  static const String REGISTER_ROUTE = "/auth/registration";
  static const String PROVIDER_REGISTRATION = "/provider_registration";
  static const String AUTH_STATUS = "/auth/status";
  static const String GENERAL_CATEGORY = "/general";
  static const String PROVIDER_CATEGORY = "/provider";
  static String CATEGORY_PROVIDERS(id) {
    return "/provider/$id";
  }

  static String SERVICE_REVIEWS(id) {
    return "/service_reviews/average/$id";
  }

  static String CHARISMA_REVIEWS(id) {
    return "/charisma_reviews/average/$id";
  }

  static const String CREATE_ADDRESS = '/add_address';
}

class Services {
  static const String CHAT = "chat";
  static const String USER = "user";
  static const String CATEGORY = "category";
  static const String REVIEW = "review";
  static const String REPORT = "report";
}

class Api {
  Api._privateConstructor();

  static final Api _instance = Api._privateConstructor();

  factory Api() {
    return _instance;
  }

  final String baseUrl = "https://pax-gateway.herokuapp.com/api/v1/";

  Future<dynamic> get(String service, String route, {Map headers}) {
    debugPrint("baseUrl + service + route: " + baseUrl + service + route);
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
