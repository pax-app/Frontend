import 'package:Pax/components/base_screen/base_screen.dart';
import 'package:Pax/components/provider_card/provider_card.dart';
import 'package:flutter/material.dart';

class CategoryProvidersScreen extends StatefulWidget {
  CategoryProvidersScreen({Key key}) : super(key: key);

  _CategoryProvidersScreenState createState() =>
      _CategoryProvidersScreenState();
}

class _CategoryProvidersScreenState extends State<CategoryProvidersScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        "72870-010",
        "Categoria teste",
        ProviderCard(
          name: "Ralph Green",
          rating: 4,
          description: "Lorem ipsum dolor sit amet asdfasd asfsdf",
          minPrice: 50,
          maxPrice: 200,
          avatarUrl:
              'https://upload.wikimedia.org/wikipedia/commons/a/a0/Pierre-Person.jpg',
        ),
        null);
  }
}
