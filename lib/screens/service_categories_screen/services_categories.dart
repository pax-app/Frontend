import 'package:flutter/material.dart';
import 'package:Pax/models/GeneralCategory.dart';
import 'package:Pax/models/category.dart';
import 'package:Pax/components/simple_tile/simple_tile.dart';
import 'package:Pax/components/app_bar/white_appbar.dart';
import 'package:flutter/semantics.dart';
import 'package:Pax/blocs/general_category_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:Pax/components/provider_panel_card/provider_panel_card.dart';
import 'package:flutter/widgets.dart';

class ServiceCategory extends StatefulWidget {
  ServiceCategory({Key key}) : super(key: key);
  _ServiceCategoryState createState() => _ServiceCategoryState();
}

class _ServiceCategoryState extends State<ServiceCategory> {
  final List<GeneralCategory> serviceCategory;
  _ServiceCategoryState({this.serviceCategory});

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
            padding: EdgeInsets.only(bottom: 30, right: 10, left: 10, top: 20),
            child: ListView(
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: <Widget>[
                StreamBuilder(
                    initialData: List<GeneralCategory>(),
                    stream: BlocProvider.of<GeneralCategoryBloc>(context)
                        .outGeneralCategories,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: snapshot.data.length,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: (context, idx) {
                          var generalCategory = snapshot.data[idx];
                          return Card(
                              child: Center(
                                child: ProviderPanelCard(
                                  removeMargin: false,
                                  cardName: '',
                                  img: imagesPaths['Domesticos'],
                                ),
                              ),
                            );
                          },
                        );
                              } else
                                return Container(
                                  child: Text(
                                    "Categoria nao existe, sinto muito!",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                );
                            },
                          ),
                          SizedBox(height: 20),
                        ]))));
                      }
              ],
            ),
          )
        ],
      ),
    );
  }
}
