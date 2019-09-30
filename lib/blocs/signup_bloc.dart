import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

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

  // Stream<bool> get validInputsStream => Observable.combineLatest6(
  //     _nameController.stream,
  //     _cpfController.stream,
  //     _emailController.stream,
  //     _passwordController.stream,
  //     _passwordConfirmationController,
  //     _useTermsController,
  //     (name, cpf, email, password, passwordConfirmation, useTerms) => true);

  Function(String) get nameSink => _nameController.sink.add;
  Function(String) get cpfSink => _cpfController.sink.add;
  Function(String) get emailSink => _emailController.sink.add;
  Function(String) get passwordSink => _passwordController.sink.add;
  Function(String) get passwordConfirmationSink =>
      _passwordConfirmationController.sink.add;
  Function(bool) get useTermsSink => _useTermsController.sink.add;

  void signUp() {
    final email = _emailController.value;
    final password = _passwordController.value;
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
