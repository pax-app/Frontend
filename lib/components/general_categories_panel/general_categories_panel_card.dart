import 'package:flutter/material.dart';
import 'package:Pax/components/general_categories_panel/general_category_panel_img.dart';
import 'package:Pax/components/general_categories_panel/general_category_panel_description.dart';

class GeneralCategoriesPanelCard extends StatelessWidget {
  final String title;
  final String description;
  final String img;
  GeneralCategoriesPanelCard(this.title, this.description, this.img);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 10, right: 0, left: 0, top: 10),
            child: ListView(
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: <Widget>[
                Card(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        Text(this.title),
                        GeneralCategoriesPanelImg(this.img),
                        GeneralCategoriesPanelDescription(this.description),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
