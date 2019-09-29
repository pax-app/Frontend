import 'dart:async';
import 'package:Pax/models/category.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/subjects.dart';
import 'package:flutter/material.dart';

class CategoryBloc implements BlocBase {
  List<Category> categories = List<Category>();
  List<Category> apiCategories = List<Category>();

  final _searchController = StreamController<String>();
  Sink get inSearch => _searchController.sink;

  final _categoryController = BehaviorSubject<List<Category>>();
  Stream get outCategories => _categoryController.stream;

  CategoryBloc() {
    _searchController.stream.listen(_search);
    apiCategories.add(Category(id: 1, name: "Aparelho de Som"));
    apiCategories.add(Category(id: 2, name: "Cabeamento e Redes"));
    apiCategories.add(Category(id: 3, name: "Celular"));
  }

  void _search(String search) async {
    if (search != null) {
      categories =
          apiCategories.where((category) => category.name.startsWith(search));
    } else {
      categories = List<Category>();
    }
    debugPrint(categories.toString());
    _categoryController.sink.add(categories);
  }

  @override
  void dispose() {
    _categoryController.close();
    _searchController.close();
  }
}
