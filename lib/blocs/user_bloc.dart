import 'dart:async';
import 'dart:io';
import 'package:Pax/services/api.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/subjects.dart';

class UserBloc implements BlocBase {
  Api api;
  File _photo;

  final _photoController = BehaviorSubject<File>();
  Sink get setPhoto => _photoController.sink;
  Stream get getPhoto => _photoController.stream;

  UserBloc() {
    api = Api();
    _photoController.stream.listen(_setUserPhoto);
    //_createProvider.stream.listen(newProvider);
  }

  void _setUserPhoto(File file) {
    _photo = file;
    _photoController.sink.add(_photo);
  }

  @override
  void dispose() {
    _photoController.close();
  }
}
