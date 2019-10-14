import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/subjects.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BecameProviderBloc implements BlocBase {
  final _nameController = BehaviorSubject<String>();
  Stream<String> get name => _nameController.stream;

  void displayUserName() async {
    var preferences = await SharedPreferences.getInstance();
    var name = preferences.getString('LastUser');
    _nameController.sink.add(name);
  }

  BecameProviderBloc() {
    displayUserName();
  }

  @override
  void dispose() {
    _nameController.close();
  }
}
