import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:Pax/components/provider_card/provider_card.dart';
import 'package:Pax/components/base_screen/base_screen.dart';
import 'package:Pax/screens/provider_profile_screen/provider_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:Pax/models/Provider.dart';

loadProvider(int id, ctx) {
  //function to go from the provier's card to the profile's profile

  Navigator.push(
      ctx, MaterialPageRoute(builder: (ctx) => ProviderProfileScreen()));
}

Future<List<Provider>> fetchPost() async {
  //Fetching data from API

  final response = await http.get(
      'http://pax-user.herokuapp.com/provider_by_category?id=',
      //If here we receive category name instead of id then just change the name of the query parameter to 'name'
      headers: {HttpHeaders.contentTypeHeader: 'application/json'});
  var responseJson = json.decode(response.body);

  final List<Provider> listaFinal = [];

  for (var item in responseJson) {
    listaFinal.add(Provider.fromJson(item));
  }
  return listaFinal;
}

class CategoryProvidersScreen extends StatelessWidget {
  CategoryProvidersScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Provider>>(
      future: fetchPost(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Provider> providers = snapshot.data;
          return BaseScreen(
              "",
              "Categoria teste",
              new Column(
                children: providers
                    .map(
                      (item) => Container(
                        child: ProviderCard(
                          providerId: item.providerId,
                          name: item.providerName,
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
          //Display error if can't get data from API
          return BaseScreen("", "Erro:", Text("${snapshot.error}"), null);
        }

        // By default, show a loading spinner.
        return BaseScreen("", "Carregando", CircularProgressIndicator(), null);
      },
    );
  }
}
