import 'package:flutter/material.dart';
import 'package:Pax/components/simple_tile/simple_tile.dart';
import 'package:Pax/models/category.dart';
import 'package:Pax/blocs/category_bloc.dart';

class ProviderCategoryScreen extends StatefulWidget {
  @override
  _ProviderCategoryScreenState createState() => _ProviderCategoryScreenState();
}

List<Category> populaLista(int n) {
  List<Category> lista = [];
  for (var i = 1; i < n; i++) {
    Category c = new Category(id: i, name: "Category $i");
    lista.add(c);
  }
  //debugPrint(lista.toString());
  return lista;
}

class _ProviderCategoryScreenState extends State<ProviderCategoryScreen> {
  final List<Category> categorias = populaLista(5);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ...this.categorias.map((item) => Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: SimpleTile(item.name),
                ),
              ],
            ))
      ],
    );
  }
}
