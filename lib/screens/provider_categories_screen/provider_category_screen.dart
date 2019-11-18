import 'dart:async';
import 'dart:convert';

import 'package:Pax/components/simple_tile/simple_tile.dart';
import 'package:Pax/components/try_again_error/try_again_error.dart';
import 'package:Pax/screens/provider_list_screen/provider_list_screen.dart';
import 'package:Pax/services/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                  (item) => SimpleTile(item.name, () {
                    _pushProviders(context, item.id, item.name);
                  }),
                )
                .toList(),
          );
        } else if (snapshot.hasError) {
          return TryAgainError();
        }

        return SizedBox(
          height: MediaQuery.of(context).size.height - 220,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  Future<List<Category>> fetchPost(id) async {
    final api = Api();
    Map<String, String> header = {'content-type': 'application/json'};
    final response = await api
        .get(Services.CATEGORY, Routes.CATEGORY_PROVIDERS(id), headers: header);
    var responseJson = json.decode(response.body);
    responseJson = responseJson["data"];
    responseJson = responseJson["categories"];

    final List<Category> listaFinal = [];

    for (var item in responseJson) {
      listaFinal.add(Category.fromJson(item));
    }
    return listaFinal;
  }

  void _pushProviders(BuildContext context, int id, String name) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => ProviderListScreen(
          providerCategoryId: id,
          title: name,
        ),
      ),
    );
  }
}
