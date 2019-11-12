import 'dart:async';
import 'dart:convert';

import 'package:Pax/components/general_categories_panel/general_categories_panel_card.dart';
import 'package:Pax/models/GeneralCategory.dart';
import 'package:Pax/services/api.dart';
import 'package:flutter/material.dart';

Future<List<GeneralCategory>> fetchPost() async {
  Map<String, String> header = {'content-type': 'application/json'};
  final _api = Api();
  final response = await _api.get(Services.CATEGORY, Routes.GENERAL_CATEGORY,
      headers: header);
  var responseJson = json.decode(response.body);
  responseJson = responseJson["data"];
  responseJson = responseJson["categories"];
  final List<GeneralCategory> listaFinal = [];

  for (var item in responseJson) {
    listaFinal.add(GeneralCategory.fromJson(item));
  }
  return listaFinal;
}

class ServiceGeneralCategory extends StatelessWidget {
  final Future<GeneralCategory> category;

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
      child: FutureBuilder<List<GeneralCategory>>(
        future: fetchPost(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<GeneralCategory> categories = snapshot.data;
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
