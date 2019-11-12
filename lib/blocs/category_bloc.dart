import 'dart:async';
import 'dart:convert';
import 'package:Pax/models/ProviderCategory.dart';
import 'package:Pax/services/api.dart';
import 'package:Pax/services/loggedUser.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/subjects.dart';

class CategoryBloc implements BlocBase {
  List<ProviderCategory> categories = List<ProviderCategory>();
  List<ProviderCategory> apiCategories = List<ProviderCategory>();

  final _searchController = StreamController<String>();
  Sink get inSearch => _searchController.sink;

  final _categoryController = BehaviorSubject<List<ProviderCategory>>();
  Stream get outCategories => _categoryController.stream;

  final _api = Api();
  final _loggedUser = LoggedUser();

  loadCategories() async {
    Map<String, String> header = {
      'content-type': 'application/json',
      'Authorization': 'Token ${_loggedUser.token}'
    };

    var providerCategoryResponse = await _api
        .get(Services.CATEGORY, Routes.PROVIDER_CATEGORY, headers: header);

    var providerCategoryJsonList =
        json.decode(providerCategoryResponse.body)["data"]["categories"];

    for (var item in providerCategoryJsonList) {
      apiCategories.add(ProviderCategory.fromJson(item));
    }
  }

  CategoryBloc() {
    _searchController.stream.listen(_search);
    loadCategories();
  }

  void _search(String search) async {
    if (search != null) {
      categories = apiCategories
          .where((category) =>
              category.name.toUpperCase().startsWith(search.toUpperCase()))
          .toList();
    } else {
      categories = List<ProviderCategory>();
      categories.add(ProviderCategory(id: 85, name: "Foi"));
    }
    _categoryController.sink.add(categories);
  }

  @override
  void dispose() {
    _categoryController.close();
    _searchController.close();
  }
}
