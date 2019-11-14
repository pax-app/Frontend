import 'package:Pax/components/base_screen/base_screen.dart';
import 'package:Pax/screens/provider_categories_screen/provider_category_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Pax/components/general_categories_panel/general_category_panel_img.dart';

class GeneralCategoriesPanelCard extends StatelessWidget {
  final String title;
  final String description;
  final String img;
  final int id;
  GeneralCategoriesPanelCard(this.title, this.description, this.img, this.id);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 3),
      child: InkWell(
        borderRadius: BorderRadius.circular(7),
        onTap: () => _pushToProviderCategory(context),
        child: Container(
          height: 150,
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                this.title,
                style: Theme.of(context).textTheme.title,
              ),
              SizedBox(height: 8),
              Row(
                children: <Widget>[
                  GeneralCategoriesPanelImg(this.img),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    width: 180,
                    child: Column(
                      children: <Widget>[
                        Text(
                          this.description,
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.body1,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _pushToProviderCategory(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => BaseScreen(
          "",
          this.title,
          ProviderCategoryScreen(this.id),
          null,
        ),
      ),
    );
  }
}
