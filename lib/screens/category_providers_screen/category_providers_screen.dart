import 'package:Pax/components/base_screen/base_screen.dart';
import 'package:Pax/components/simple_tile/simple_tile.dart';
import 'package:flutter/material.dart';

class CategoryProvidersScreen extends StatefulWidget {
  CategoryProvidersScreen({Key key}) : super(key: key);

  _CategoryProvidersScreenState createState() =>
      _CategoryProvidersScreenState();
}

class _CategoryProvidersScreenState extends State<CategoryProvidersScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen("72870-010", "Categoria teste", SimpleTile('asdf'), null);
  }
}
