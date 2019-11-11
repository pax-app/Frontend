import 'dart:async';
import 'dart:io';
import 'dart:convert';

import 'package:Pax/components/general_categories_panel/general_categories_panel_card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Category>> fetchPost() async {
  final response = await http.get(
      'https://pax-category.herokuapp.com/category/general',
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
          'Fale os melhores na área de TI e Design e tire sua idea do papel',
      'Assistência Técnica':
          'Encontre o melhor em consertar aparelhos eletrônicos',
      'Reformas': 'Precisa de reformas? Fale com nossos profissionais',
    };

    return Container(
      height: MediaQuery.of(context).size.height - 82,
      child: FutureBuilder<List<Category>>(
        future: fetchPost(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Category> categories = snapshot.data;
            return ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                var item = categories[index];
                return Padding(
                  padding: index == 0
                      ? const EdgeInsets.only(top: 16)
                      : const EdgeInsets.only(top: 0),
                  child: GeneralCategoriesPanelCard(
                    item.name,
                    descriptionPaths['${item.name}'],
                    imagesPaths['${item.name}'],
                    item.id,
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          // By default, show a loading spinner.
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
