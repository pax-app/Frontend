import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:Pax/components/simple_tile/simple_tile.dart';
import 'package:Pax/services/api.dart';
import 'package:flutter/material.dart';

Future<List<Category>> fetchPost(id) async {
  final api = Api();
  final response = await api.get(
      Services.CATEGORY, Routes.CATEGORY_PROVIDERS(id),
      headers: {HttpHeaders.contentTypeHeader: 'application/json'});
  var responseJson = json.decode(response.body);
  responseJson = responseJson["data"];
  responseJson = responseJson["categories"];

  final List<Category> listaFinal = [];

  for (var item in responseJson) {
    listaFinal.add(Category.fromJson(item));
  }
  return listaFinal;
}

class Category {
  final int id;
  final int generalId;
  final String name;

  Category({this.id, this.name, this.generalId});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      generalId: json['generalId'],
      id: json['id'],
      name: json['name'],
    );
  }
}

class ProviderCategoryScreen extends StatelessWidget {
  final int id;

  ProviderCategoryScreen(this.id);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Category>>(
      future: fetchPost(this.id),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Category> categories = snapshot.data;
          return Column(
            children: categories
                .map(
                  (item) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      child: SimpleTile(item.name, null)),
                )
                .toList(),
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        // By default, show a loading spinner.
        return CircularProgressIndicator();
      },
    );
  }
}
