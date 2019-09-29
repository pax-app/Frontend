import 'package:Pax/models/GeneralCategory.dart';
import 'package:Pax/models/category.dart';
import 'package:Pax/screens/category_screen/expansion_category_tab.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  List<GeneralCategory> g;
  List<Category> c;
  CategoryScreen() {
    c = populaLista(10);
    g = p(5, c);
  }
  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 30, right: 20, left: 20),
            child: TextFormField(
              controller: searchController,
              autofocus: true,
              style: TextStyle(color: Theme.of(context).primaryColor),
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: "Buscar categoria"),
            ),
        
          ),
          ExpansionCategory(g[0]),
          ExpansionCategory(g[0]),
          ExpansionCategory(g[0]),
          ExpansionCategory(g[0]),
        ],
      ),
    );
  }

  List<Category> populaLista(int n) {
    List<Category> lista = [];
    for (var i = 1; i < n; i++) {
      Category c = new Category(id: i, name: "Category");
      lista.add(c);
    }
    //debugPrint(lista.toString());
    return lista;
  }

  List<GeneralCategory> p(int n, List<Category> w) {
    List<GeneralCategory> l = [];
    for (var i = 0; i < n; i++) {
      l.add(GeneralCategory(id: i, name: "GeneralCategory", categories: w));
    }

    return l;
  }
}
