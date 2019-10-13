import 'dart:async';
import 'package:Pax/models/Provider.dart';
import 'package:Pax/services/api.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/rendering.dart';
import 'package:rxdart/subjects.dart';
import 'package:Pax/models/category.dart';

class ProviderBloc implements BlocBase {
  Provider provider;
  List<Category> categories = List<Category>();
  Api api;

  final StreamController _getProvideDataControlle = BehaviorSubject();
  Stream<Provider> get outProviderData => _getProvideDataControlle.stream;

  final StreamController<bool> _thereCategoryProvider = BehaviorSubject<bool>();
  Stream<bool> get thereCategoryProvider => _thereCategoryProvider.stream;

  final StreamController<List<Category>> _categoriesControlle =
      BehaviorSubject<List<Category>>();
  Stream<List<Category>> get addCategoryToProvider =>
      _categoriesControlle.stream;

  final _createProvider = StreamController<Provider>();
  Sink get createProvider => _createProvider.sink;

  final _confirmProviderCreate = BehaviorSubject<bool>();
  Stream get confirmProviderCreate => _confirmProviderCreate.stream;

  ProviderBloc() {
    api = Api();
    _createProvider.stream.listen(newProvider);
  }

  bool thereCategory(Category category) {
    bool there = categories.contains(category);
    _thereCategoryProvider.add(there);
    return there;
  }

  void addCategory(Category category) {
    if (categories.contains(category)) {
      categories.remove(category);
    } else {
      categories.add(category);
    }
    _categoriesControlle.sink.add(categories);
    debugPrint(categories.toString());
  }

  void newProvider(Provider p) async {
    p.categories = categories;
    await api.registerProvider(p);
  }

  void getProvider() {
    _getProvideDataControlle.sink.add(provider);
  }

  @override
  void dispose() {
    _getProvideDataControlle.close();
    _createProvider.close();
    _confirmProviderCreate.close();
    _categoriesControlle.close();
    _thereCategoryProvider.close();
  }
}