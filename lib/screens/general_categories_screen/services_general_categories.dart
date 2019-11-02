import 'dart:async';
import 'dart:io';
import 'dart:convert';

import 'package:Pax/components/general_categories_panel/general_categories_panel_card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Category>> fetchPost() async {
  final response = await http.get('http://192.168.0.84:5002/category/general',
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
  final String name;

  Category({this.id, this.name});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
    );
  }
}

class ServiceGeneralCategory extends StatelessWidget {
  final Future<Category> category;

  ServiceGeneralCategory({Key key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Map<String, String> imagesPaths = {
      'Serviços Domésticos': 'assets/categories-img/clean.png',
      'Design e Tecnologia': 'assets/categories-img/code.png',
      'Assistência Técnica': 'assets/categories-img/gear.png',
      'Reformas': 'assets/categories-img/paint.png',
    };
    const Map<String, String> descriptionPaths = {
      'Serviços Domésticos': 'Encontre a pessoa certa para cuidar do seu lar',
      'Design e Tecnologia':
          'Encontre um especialista para seu projetos de design e tecnologia',
      'Assistência Técnica':
          'Encontre a pessoa certa para consertar seus aparelhos eletrônicos',
      'Reformas': 'Encontre a pessoa certa para realizar suas reformas',
    };
    return FutureBuilder<List<Category>>(
      future: fetchPost(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Category> categories = snapshot.data;
          return Column(
            children: categories
                .map(
                  (item) => Container(
                    child: GeneralCategoriesPanelCard(
                        item.name,
                        descriptionPaths['${item.name}'],
                        imagesPaths['${item.name}'],
                        item.id),
                  ),
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