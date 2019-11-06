import 'package:Pax/blocs/category_bloc.dart';
import 'package:Pax/blocs/provider_bloc.dart';
import 'package:Pax/components/base_screen/base_screen.dart';
import 'package:Pax/components/button%20/button.dart';
import 'package:Pax/models/GeneralCategory.dart';
import 'package:Pax/models/ProviderCategory.dart';
import 'package:Pax/models/category.dart';
import 'package:Pax/screens/became_provider_screen/became_provider_screen.dart';
import 'package:Pax/screens/category_screen/expansion_category_tab.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Pax/blocs/general_category_bloc.dart';

class CategoryScreen extends StatefulWidget {
  CategoryScreen({Key key}) : super(key: key);

  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<ProviderCategory> c;
  List<int> selectedList = List();
  String _search = "";

  TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 30, right: 10, left: 10, top: 20),
            child: TextField(
              controller: searchController,
              onChanged: (String search) async {
                //BlocProvider.of<CategoryBloc>(context).inSearch.add(search);
                setState(() {
                  this._search = search;
                  BlocProvider.of<CategoryBloc>(context)
                      .inSearch
                      .add(this._search);
                });
              },
              style: TextStyle(color: Theme.of(context).primaryColor),
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).accentColor,
                    width: 2,
                  ),
                ),
                labelText: "Buscar categoria",
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 5.0),
                ),
              ),
            ),
          ),
          _search.isEmpty
              ? ListView(
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
                              var geralCategory = snapshot.data[idx];
                              return ExpansionCategory(geralCategory);
                            },
                          );
                        } else {
                          return Button(
                              buttonText: 'Próximo',
                              tapHandler: () {},
                              type: 'default',
                              isSmall: false);
                        }
                      },
                    ),
                    SizedBox(height: 20),
                    Button(
                        buttonText: 'Próximo',
                        tapHandler: nextPage,
                        type: 'default',
                        isSmall: false),
                    SizedBox(height: 20),
                  ],
                )
              : Container(
                  child: Column(
                    children: <Widget>[
                      StreamBuilder(
                        initialData: List<Category>(),
                        stream: BlocProvider.of<CategoryBloc>(context)
                            .outCategories,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: snapshot.data.length,
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemBuilder: (context, idx) {
                                var category = snapshot.data[idx];
                                return Card(
                                  child: Center(
                                    child: CheckboxListTile(
                                      key: Key(category.id.toString()),
                                      title: Text(
                                        category.name,
                                        style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                      activeColor:
                                          Theme.of(context).accentColor,
                                      value:
                                          BlocProvider.of<ProviderBloc>(context)
                                              .thereCategory(category),
                                      onChanged: (bool value) {
                                        setState(() {
                                          BlocProvider.of<ProviderBloc>(context)
                                              .addCategory(category);
                                        });
                                      },
                                    ),
                                  ),
                                );
                              },
                            );
                          } else
                            return Container(
                              child: Text(
                                "Não tem! Tchau!",
                                style: TextStyle(color: Colors.black),
                              ),
                            );
                        },
                      ),
                      SizedBox(height: 20),
                      Button(
                          buttonText: 'Próximo',
                          tapHandler: nextPage,
                          type: 'default',
                          isSmall: false)
                    ],
                  ),
                )
        ],
      ),
    );
  }

  void nextPage() {
    Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (context) => BaseScreen(
          " ",
          "Preencha seus dados abaixo ",
          BecameProviderScreen(),
          null,
        ),
      ),
    );
  }

  List<Widget> getExpansionCategory() {
    List<GeneralCategory> generalCategories = p(2, populaLista(5));
    List<Widget> list = List<Widget>();
    for (var geralCategory in generalCategories) {
      list.add(ExpansionCategory(geralCategory));
    }

    return list.toList();
  }

  List<ProviderCategory> populaLista(int n) {
    List<ProviderCategory> lista = [];
    for (var i = 1; i < n; i++) {
      ProviderCategory c =
          new ProviderCategory(id: i, name: "Category", generalId: 1);
      lista.add(c);
    }
    return lista;
  }

  List<GeneralCategory> p(int n, List<ProviderCategory> w) {
    List<GeneralCategory> l = [];
    for (var i = 0; i < n; i++) {
      l.add(GeneralCategory(id: i, name: "GeneralCategory", categories: w));
    }
    return l;
  }
}
