import 'dart:async';
import 'dart:convert';
import 'package:Pax/models/ProviderCategory.dart';
import 'package:Pax/services/api.dart';
import 'package:Pax/services/loggedUser.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';
import 'package:path/path.dart' as Path;

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

  Future<int> turnIntoProvider(double minPrice, double maxPrice,
      List<ProviderCategory> list, var image, var rgImage) async {
    final bio = _bioController.value;
    final id = _id;
    var urlRgPhoto = "";
    var urlAvatar = "";
    final number = _rgController.value;
    final categories = jsonEncode(list);
    if (image != null) {
      StorageReference storageReference = FirebaseStorage.instance
          .ref()
          .child('users/$_id/${Path.basename(image.path)}');
      StorageUploadTask uploadTask = storageReference.putFile(image);
      await uploadTask.onComplete;

      storageReference.getDownloadURL().then((fileURL) {
        urlAvatar = fileURL;
      });
    }
    if (rgImage != null) {
      StorageReference storageReference = FirebaseStorage.instance
          .ref()
          .child('providers/$_id/${Path.basename(image.path)}');
      StorageUploadTask uploadTask = storageReference.putFile(image);
      await uploadTask.onComplete;

      storageReference.getDownloadURL().then((fileURL) {
        urlRgPhoto = fileURL;
      });
    }

    Map<String, String> body = {
      'minimum_price': minPrice.toStringAsFixed(2),
      'maximum_price': maxPrice.toStringAsFixed(2),
      'bio': bio,
      'url_rg_photo': urlRgPhoto,
      'url_avatar': urlAvatar,
      'number': number,
      'user_id': id,
      'categories': categories
    };

    Map<String, String> header = {
      'content-type': 'application/json',
      'Authorization': 'Token $_token'
    };
    var jsonBody = json.encode(body);
    final response = await _api.post(
      Services.USER,
      Routes.PROVIDER_REGISTRATION,
      headers: header,
      body: jsonBody,
    );
    if (response.statusCode == 200) {
      await loggedUser.setIsProvider(true);
      await loggedUser.setPhoto(urlAvatar);
    }
    return response.statusCode;
  }

  @override
  void dispose() {
    _nameController.close();
    _bioController.close();
    _rgController.close();
  }
}
