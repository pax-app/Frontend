import 'package:Pax/models/GeneralCategory.dart';
import 'package:Pax/models/category.dart';
import 'package:Pax/screens/category_screen/expansion_category_tab.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: ExpansionCategory(p(2)),
      ),
    );
  }

  

  List<Category> populaLista(int n) {
    List<Category> lista;
    for (var i = 0; i < n; i++) {
      Category c = new Category(id: i, name: "nome");
      lista.add(c);
    }
    debugPrint(lista.toString());
    return lista;
  }


  List<GeneralCategory> p(int n) {
    List<GeneralCategory> l;
    for (var i = 0; i < n; i++) {
      l.add(GeneralCategory(
          id: i, name: "nome", categories: populaLista(5), expanded: false));
    }
    debugPrint(l.toString());

    return l;
  }
}
