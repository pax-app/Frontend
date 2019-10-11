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
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        children: <Widget>[
                          Row(children: <Widget>[
                            Text(
                              this.title,
                              style: TextStyle(
                                fontFamily: Theme.of(context)
                                    .textTheme
                                    .title
                                    .fontFamily,
                                fontSize:
                                    Theme.of(context).textTheme.title.fontSize,
                                fontWeight: Theme.of(context)
                                    .textTheme
                                    .title
                                    .fontWeight,
                                color: Theme.of(context).textTheme.title.color,
                              ),
                            )
                          ]),
                          SizedBox(
                            height: 5,
                          ),
                          Row(children: <Widget>[
                            SizedBox(
                              width: 10,
                            ),
                            GeneralCategoriesPanelImg(this.img),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                                padding: const EdgeInsets.all(16.0),
                                width: 190,
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      this.description,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontFamily: Theme.of(context)
                                            .textTheme
                                            .body1
                                            .fontFamily,
                                        fontSize: Theme.of(context)
                                            .textTheme
                                            .body1
                                            .fontSize,
                                        fontWeight: Theme.of(context)
                                            .textTheme
                                            .body2
                                            .fontWeight,
                                        color: Theme.of(context)
                                            .textTheme
                                            .title
                                            .color,
                                      ),
                                    ),
                                  ],
                                ))
                          ]),
                        ],
                      ),
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
