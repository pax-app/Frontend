import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc extends BlocBase {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  Stream<bool> get validInputsStream => Observable.combineLatest2(
      _emailController.stream,
      _passwordController.stream,
      (email, password) => true);

  Function(String) get emailSink => _emailController.sink.add;
  Function(String) get passwordSink => _passwordController.sink.add;

  void logIn() {
    final email = _emailController.value;
    final password = _passwordController.value;
  }

  @override
  void dispose() {
    _emailController.close();
    _passwordController.close();
  }
}
