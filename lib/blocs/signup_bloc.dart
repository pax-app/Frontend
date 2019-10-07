import 'dart:async';
import 'dart:convert';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:Pax/models/login_model.dart';
import 'package:Pax/blocs/singup_validators.dart';

class SignUpBloc extends BlocBase {
  final _nameController = BehaviorSubject<String>();
  final _cpfController = BehaviorSubject<String>();
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _passwordConfirmationController = BehaviorSubject<String>();
  final _useTermsController = BehaviorSubject<bool>();

  // Add data to stream
  Stream<String> get email =>
      _emailController.stream.transform(SignUpValidators.validateEmail);
  Stream<String> get password =>
      _passwordController.stream.transform(SignUpValidators.validatePassword);
  Stream<String> get cpf =>
      _cpfController.stream.transform(SignUpValidators.validateCPF);
  Stream<bool> get useTerms =>
      _useTermsController.stream.transform(SignUpValidators.validateUseTerms);
  Stream<String> get name =>
      _nameController.stream.transform(SignUpValidators.validateName);
  Stream<String> get confirmPassword => _passwordConfirmationController.stream
          .transform(SignUpValidators.validatePassword)
          .doOnData((String c) {
        // If the password is accepted (after validation of the rules)
        // we need to ensure both password and retyped password match
        if (0 != _passwordController.value.compareTo(c)) {
          // If they do not match, add an error
          _passwordConfirmationController.addError("As senhas não conferem.");
        }
      });

  Stream<bool> get validInputsStream => Observable.combineLatest6(
      name,
      cpf,
      email,
      password,
      confirmPassword,
      useTerms,
      (name, cpf, email, password, passwordConfirmation, useTerms) =>
          0 == password.compareTo(passwordConfirmation));

  Function(String) get changeName => _nameController.sink.add;
  Function(String) get changeCPF => _cpfController.sink.add;
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;
  Function(String) get changePasswordConfirmation =>
      _passwordConfirmationController.sink.add;
  Function(bool) get changeUseTerms => _useTermsController.sink.add;

  void saveCurrentLogin(Map responseJson) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    var user = (responseJson != null && responseJson.isNotEmpty)
        ? LoginModel.fromJson(responseJson).userName
        : "";

    var token = (responseJson != null && responseJson.isNotEmpty)
        ? LoginModel.fromJson(responseJson).token
        : "";
    var email = (responseJson != null && responseJson.isNotEmpty)
        ? LoginModel.fromJson(responseJson).email
        : "";

    await preferences.setString(
        'LastUser', (user != null && user.length > 0) ? user : "");
    await preferences.setString(
        'LastToken', (token != null && token.length > 0) ? token : "");
    await preferences.setString(
        'LastEmail', (email != null && email.length > 0) ? email : "");
  }

  Future<int> signUp() async {
    final url = "http://172.18.0.1:5001/auth/registration";
    final email = _emailController.value;
    final password = _passwordController.value;
    final name = _nameController.value;
    final cpf = _cpfController.value;
    Map<String, String> body = {
      'email': email,
      'password': password,
      'name': name,
      'cpf': cpf,
      'url_avatar': ""
    };
    Map<String, String> header = {'content-type': 'application/json'};

    var jsonBody = json.encode(body);
    final response = await http.post(
      url,
      headers: header,
      body: jsonBody,
    );
    debugPrint(response.statusCode.toString());
    if (response.statusCode == 201) {
      final responseJson = json.decode(response.body);
      saveCurrentLogin(responseJson);
    }
    return response.statusCode;
  }

  @override
  void dispose() {
    _nameController.close();
    _cpfController.close();
    _emailController.close();
    _passwordController.close();
    _passwordConfirmationController.close();
    _useTermsController.close();
  }
}
