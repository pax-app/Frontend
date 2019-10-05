import 'dart:async';
import 'package:Pax/models/Provider.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/subjects.dart';

class ProviderBloc implements BlocBase {
  Provider provider;

  final StreamController _getProvideDataControlle = StreamController();

  Stream<Provider> get outProviderData => _getProvideDataControlle.stream;

  final _createProvider = StreamController<Provider>();
  Sink get createProvider => _createProvider.sink;

  final _confirmProviderCreate = BehaviorSubject<bool>();
  Stream get confirmProviderCreate => _confirmProviderCreate.stream;

  ProviderBloc() {
    _createProvider.stream.listen(newProvider);
  }

  void newProvider(Provider p) async {
    bool out;
    if (p.name == 'true') {
      provider = p;
      out = true;
    } else {
      out = false;
    }
    _confirmProviderCreate.sink.add(out);
  }

  void getProvider() {
    _getProvideDataControlle.sink.add(provider);
  }

  @override
  void dispose() {
    _getProvideDataControlle.close();
    _createProvider.close();
    _confirmProviderCreate.close();
  }
}
