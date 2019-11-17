import 'dart:async';
import 'dart:convert';
import 'package:Pax/components/provider_card/provider_card.dart';
import 'package:Pax/components/base_screen/base_screen.dart';
import 'package:Pax/screens/provider_profile_screen/provider_profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:Pax/models/Provider.dart';

class ProviderListScreen extends StatelessWidget {
  final providerCategoryId;

  ProviderListScreen({this.providerCategoryId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Provider>>(
      future: fetchPost(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<dynamic> providers = snapshot.data;
          return BaseScreen(
              "",
              "Categoria teste",
              new Column(
                children: providers
                    .map(
                      (item) => Container(
                        child: ProviderCard(
                          providerId: item['provider_id'],
                          name: item['name'],
                          rating: item.reviewService,
                          description: item.bio,
                          minPrice: item.minPrice,
                          maxPrice: item.maxPrice,
                          avatarUrl: item.providerPhoto,
                          onTap: () => (loadProvider(item.providerId, context)),
                        ),
                      ),
                    )
                    .toList(),
              ),
              null);
        } else if (snapshot.hasError) {
          return BaseScreen("", "Erro:", Text("${snapshot.error}"), null);
        }

        return BaseScreen("", "Carregando", CircularProgressIndicator(), null);
      },
    );
  }

  loadProvider(int id, ctx) {
    Navigator.push(
      ctx,
      CupertinoPageRoute(builder: (ctx) => ProviderProfileScreen()),
    );
  }

  Future<List<Provider>> fetchPost() async {
    final response = await http.get(
        'http://pax-user.herokuapp.com/provider_by_category/min_price/$providerCategoryId');

    var responseJson = json.decode(response.body);
    final List<dynamic> listaFinal = [];

    print(responseJson);

    for (var item in responseJson) {
      listaFinal.add(json.decode(item));
    }
    print(listaFinal);
    return listaFinal;
  }
}
