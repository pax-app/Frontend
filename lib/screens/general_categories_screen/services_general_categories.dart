import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:Pax/components/general_categories_panel/general_categories_panel_card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Category>> fetchPost() async {
  final response = await http.get('http://10.0.2.2:5002/category/general',
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
      id: json['general_category.id'],
      name: json['general_category.name'],
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
    return FutureBuilder<List<Category>>(
      future: fetchPost(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Category> categories = snapshot.data;
          return Column(
            children: categories
                .map(
                  (item) => Container(
                    child: GeneralCategoriesPanelCard(item.name,
                        item.id.toString(), imagesPaths['${item.name}']),
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

// import 'dart:convert';
// import 'package:Pax/components/general_categories_panel/general_categories_panel_card.dart';
// import 'package:flutter/material.dart';
// import 'package:Pax/models/GeneralCategory.dart';
// import 'package:flutter/widgets.dart';
// import 'package:http/http.dart' as http;

// class ServiceGeneralCategory extends StatefulWidget {
//   ServiceGeneralCategory({Key key}) : super(key: key);
//   _ServiceGeneralCategoryState createState() => _ServiceGeneralCategoryState();
// }

// class _ServiceGeneralCategoryState extends State<ServiceGeneralCategory> {
//   _fetchData() async {
//     final response = await http.get("http://10.0.2.2:5002/category/general");
//     if (response.statusCode == 200) {
//       return GeneralCategory.fromJson(json.decode(response.body));
//     } else {
//       throw Exception('Failed to load general category');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<GeneralCategory>(
//       future: _fetchData(),
//       builder: (context, snapshot) {
//         print(snapshot);
//         if (snapshot.hasData) {
//           return Text(snapshot.data.name);
//         } else if (snapshot.hasError) {
//           return Text("${snapshot.error}");
//         }

//         // By default, show a loading spinner.
//         return CircularProgressIndicator();
//       },
//     );
//   }

//   // @override
//   // Widget build(BuildContext context) {
//   //   const Map<String, String> imagesPaths = {
//   //     'Domesticos': 'assets/categories-img/clean.png',
//   //     'Tecnologia': 'assets/categories-img/code.png',
//   //     'Assistencia': 'assets/categories-img/gear.png',
//   //     'Reformas': 'assets/categories-img/paint.png',
//   //   };
//   //   return SingleChildScrollView(
//   //     child: Column(
//   //       children: <Widget>[
//   //         Padding(
//   //           padding: EdgeInsets.only(bottom: 30, right: 10, left: 10, top: 20),
//   //           child: ListView(
//   //             physics: NeverScrollableScrollPhysics(),
//   //             scrollDirection: Axis.vertical,
//   //             shrinkWrap: true,
//   //             children: <Widget>[
//   //               GeneralCategoriesPanelCard(
//   //                   'Asistência Técnica',
//   //                   'Encontre a pessoa certa para consertar seus aparelhos eletrônicos',
//   //                   imagesPaths['Assistencia']),
//   //               GeneralCategoriesPanelCard(
//   //                   'Reformas',
//   //                   'Encontre a pessoa certa para consertar seus aparelhos eletrônicos',
//   //                   imagesPaths['Reformas']),
//   //               GeneralCategoriesPanelCard(
//   //                   'Serviços Domésticos',
//   //                   'Encontre a pessoa certa para consertar seus aparelhos eletrônicos',
//   //                   imagesPaths['Domesticos']),
//   //               GeneralCategoriesPanelCard(
//   //                   'Design e Tecnologia',
//   //                   'Encontre a pessoa certa para consertar seus aparelhos eletrônicos',
//   //                   imagesPaths['Tecnologia']),
//   //             ],
//   //           ),
//   //         )
//   //       ],
//   //     ),
//   //   );
//   // }
// }
