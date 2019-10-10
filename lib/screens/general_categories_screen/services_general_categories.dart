import 'package:Pax/components/general_categories_panel/general_categories_panel_card.dart';
import 'package:flutter/material.dart';
import 'package:Pax/models/GeneralCategory.dart';
import 'package:Pax/blocs/general_category_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:Pax/components/provider_panel_card/provider_panel_card.dart';
import 'package:flutter/widgets.dart';

class ServiceGeneralCategory extends StatefulWidget {
  ServiceGeneralCategory({Key key}) : super(key: key);
  _ServiceGeneralCategoryState createState() => _ServiceGeneralCategoryState();
}

class _ServiceGeneralCategoryState extends State<ServiceGeneralCategory> {
  final List<GeneralCategory> serviceGeneralCategory;
  _ServiceGeneralCategoryState({this.serviceGeneralCategory});

  @override
  Widget build(BuildContext context) {
    const Map<String, String> imagesPaths = {
      'Domesticos': 'assets/categories-img/clean.png',
      'Tecnologia': 'assets/categories-img/code.png',
      'Assistencia': 'assets/categories-img/gear.png',
      'Reformas': 'assets/categories-img/paint.png',
    };
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding:
                EdgeInsets.only(bottom: 30, right: 10, left: 10, top: 20),
            child: ListView(
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: <Widget>[
                GeneralCategoriesPanelCard(
                    'funciona', 'please', imagesPaths['Assistencia']),
                GeneralCategoriesPanelCard(
                    'funciona', 'please', imagesPaths['Reformas']),
                GeneralCategoriesPanelCard(
                    'funciona', 'please', imagesPaths['Domesticos']),
                GeneralCategoriesPanelCard(
                    'funciona', 'please', imagesPaths['Tecnologia']),
              ],
            ),
          )
        ],
      ),
    );
  }
}
