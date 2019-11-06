import 'dart:async';
import 'dart:convert';
import 'package:Pax/models/GeneralCategory.dart';
import 'package:Pax/models/ProviderCategory.dart';
import 'package:Pax/models/category.dart';
import 'package:Pax/services/api.dart';
import 'package:Pax/services/loggedUser.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/foundation.dart' as prefix0;
import 'package:rxdart/rxdart.dart';

class GeneralCategoryBloc implements BlocBase {
  List<GeneralCategory> generalCategories = List<GeneralCategory>();
  Api api = Api();
  LoggedUser loggedUser = LoggedUser();

  final _outGeneralCategoryController =
      BehaviorSubject<List<GeneralCategory>>();
  Stream get outGeneralCategories => _outGeneralCategoryController.stream;

  loadCategories() async {
    Map<String, String> header = {
      'content-type': 'application/json',
      'Authorization': 'Token ${loggedUser.token}'
    };

    var generalCategoryResponse = await api
        .get(Services.CATEGORY, Routes.GENERAL_CATEGORY, headers: header);
    var providerCategoryResponse = await api
        .get(Services.CATEGORY, Routes.PROVIDER_CATEGORY, headers: header);

    var generalCategoryJsonList =
        json.decode(generalCategoryResponse.body)["data"]["categories"];
    var providerCategoryJsonList =
        json.decode(providerCategoryResponse.body)["data"]["categories"];
    final List<GeneralCategory> generalCategoryList = [];
    final List<ProviderCategory> providerCategoryList = [];

    for (var item in generalCategoryJsonList) {
      generalCategoryList.add(GeneralCategory.fromJson(item));
    }

    for (var item in providerCategoryJsonList) {
      providerCategoryList.add(ProviderCategory.fromJson(item));
    }

    for (var provCategory in providerCategoryList) {
      int index = generalCategoryList
          .indexWhere((cat) => cat.id == provCategory.generalId);
      generalCategoryList[index].addCategory(provCategory);
    }
    _outGeneralCategoryController.sink.add(generalCategoryList);
    return generalCategoryList;
  }

  GeneralCategoryBloc() {
    loadCategories();
  }

  @override
  void dispose() {
    _outGeneralCategoryController.close();
  }
}
