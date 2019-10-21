import 'dart:async';
import 'dart:convert';
import 'package:Pax/services/api.dart';
import 'package:Pax/services/loggedUser.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class BecameProviderBloc implements BlocBase {
  static final validateNotEmpty =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (value.isNotEmpty)
      sink.add(value);
    else
      sink.addError("Não pode estar vazio.");
  });

  final _nameController = BehaviorSubject<String>();
  final _bioController = BehaviorSubject<String>();
  final _rgController = BehaviorSubject<String>();
  String _id;
  String _token;
  final Api _api = Api();
  final LoggedUser loggedUser = LoggedUser();

  Stream<String> get bio => _bioController.stream.transform(validateNotEmpty);
  Stream<String> get name => _nameController.stream;
  Stream<String> get rg => _rgController.stream.transform(validateNotEmpty);

  Function(String) get changeBio => _bioController.sink.add;
  Function(String) get changeRg => _rgController.sink.add;

  void getUserData() async {
    var loggedUser = LoggedUser();
    var name = loggedUser.name;
    _nameController.sink.add(name);
    _id = loggedUser.userId;
    _token = loggedUser.token;
  }

  BecameProviderBloc() {
    getUserData();
  }

  Future<int> turnIntoProvider(double minPrice, double maxPrice) async {
    final bio = _bioController.value;
    final id = _id;
    final url_rg_photo = "";
    final number = _rgController.value;
    Map<String, String> body = {
      'minimum_price': minPrice.toStringAsFixed(2),
      'maximum_price': maxPrice.toStringAsFixed(2),
      'bio': bio,
      'url_rg_photo': url_rg_photo,
      'number': number,
      'user_id': id,
      'categories': ""
    };

    Map<String, String> header = {
      'content-type': 'application/json',
      'Authorization': 'Token $_token'
    };
    var jsonBody = json.encode(body);
    /*final response = await _api.post(
      Routes.PROVIDER_REGISTRATION,
      headers: header,
      body: jsonBody,
    );
    return response.statusCode;
    */
    return 0;
  }

  @override
  void dispose() {
    _nameController.close();
    _bioController.close();
    _rgController.close();
  }
}
