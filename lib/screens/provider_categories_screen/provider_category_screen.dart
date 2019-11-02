import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:convert';

import 'package:Pax/components/simple_tile/simple_tile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Category>> fetchPost(id) async {
  final url = 'http://192.168.0.84:5002/category/${id}/provider';
  print(url);
  final response = await http
      .get(url, headers: {HttpHeaders.contentTypeHeader: 'application/json'});
  print(response.body);
  var responseJson = json.decode(response.body);
  print(response);
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
