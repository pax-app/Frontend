import 'dart:async';
import 'dart:convert';

import 'package:Pax/services/api.dart';
import 'package:Pax/services/loggedUser.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';
import 'package:Pax/models/login_model.dart';
import 'package:Pax/blocs/singup_validators.dart';

class SignUpBloc extends BlocBase {
  final _nameController = BehaviorSubject<String>();
  final _cpfController = BehaviorSubject<String>();
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _passwordConfirmationController = BehaviorSubject<String>();
  final _useTermsController = BehaviorSubject<bool>();
  final Api _api = Api();

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
        if (0 != _passwordController.value.compareTo(c)) {
          _passwordConfirmationController.addError("Senhas diferentes");
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

  static void saveCurrentLogin(Map responseJson) async {
    var user = "";
    var token = "";
    var email = "";
    var userId = "";
    bool isProvider = false;
    var loggedUser = LoggedUser();
    var providerId = "";
    if (responseJson != null && responseJson.isNotEmpty) {
      var userModel = LoginModel.fromJson(responseJson);
      user = userModel.userName;
      token = userModel.token;
      email = userModel.email;
      userId = userModel.id.toString();
      isProvider = userModel.isProvider;
      providerId = userModel.providerId.toString();
    }
    await loggedUser.setName(user);
    await loggedUser.setEmail(email);
    await loggedUser.setUserId(userId);
    await loggedUser.setIsProvider(isProvider);
    await loggedUser.setToken(token);
    await loggedUser.setProviderId(providerId);
  }

  Future<int> signUp() async {
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
    final response = await _api.post(
      Services.USER,
      Routes.REGISTER_ROUTE,
      headers: header,
      body: jsonBody,
    );
    if (response.statusCode == 200) {
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
