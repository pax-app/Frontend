import 'dart:async';
import 'dart:convert';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:Pax/models/login_model.dart';

class SignUpBloc extends BlocBase {
  final _nameController = BehaviorSubject<String>();
  final _cpfController = BehaviorSubject<String>();
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _passwordConfirmationController = BehaviorSubject<String>();
  final _useTermsController = BehaviorSubject<bool>();

  Stream<bool> get useTerms => _useTermsController.stream;

  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.contains("@"))
      sink.add(email);
    else
      sink.addError("Digite um e-mail válido");
  });

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length >= 6)
      sink.add(password);
    else
      sink.addError("A senha deve conter no mínimo 6 caracteres");
  });
  Stream<bool> get validInputsStream => Observable.combineLatest6(
      _nameController.stream,
      _cpfController.stream,
      _emailController.stream,
      _passwordController.stream,
      _passwordConfirmationController,
      _useTermsController,
      (name, cpf, email, password, passwordConfirmation, useTerms) => true);

  Function(String) get nameSink => _nameController.sink.add;
  Function(String) get cpfSink => _cpfController.sink.add;
  Function(String) get emailSink => _emailController.sink.add;
  Function(String) get passwordSink => _passwordController.sink.add;
  Function(String) get passwordConfirmationSink =>
      _passwordConfirmationController.sink.add;
  Function(bool) get useTermsSink => _useTermsController.sink.add;

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

  Future<bool> signUp() async {
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
    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);

      saveCurrentLogin(responseJson);
      return true;
    } else if (response.statusCode == 404) {
      /* User does not exists */
    } else if (response.statusCode == 401) {
      /* Wrong Credential */
    } else if (response.statusCode == 500) {
      /* db connection error */
    }
    return false;
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
