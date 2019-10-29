import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:Pax/components/provider_card/provider_card.dart';
import 'package:Pax/components/base_screen/base_screen.dart';
import 'package:Pax/screens/provider_profile_screen/provider_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


loadProvider(int id, ctx) {
  //function to go from the provier's card to the profile's profile

  Navigator.push(
      ctx, MaterialPageRoute(builder: (ctx) => ProviderProfileScreen()));
}

Future<List<Provider>> fetchPost() async {
  //Fetching data from API

  final response = await http.get('http://pax-user.herokuapp.com/provider_by_category?id=',
  //If here we receive category name instead of id then just change the name of the query parameter to 'name' 
      headers: {HttpHeaders.contentTypeHeader: 'application/json'});
  var responseJson = json.decode(response.body);

  final List<Provider> listaFinal = [];

  for (var item in responseJson) {
    listaFinal.add(Provider.fromJson(item));
  }
  return listaFinal;
}

class Provider {
  final String name;
  final String description;
  final String urlPhoto;
  final double review;
  final int id;
  final int minPrice;
  final int maxPrice;

  Provider({this.name, this.description, this.urlPhoto, this.review, this.id, this.maxPrice, this.minPrice});

  factory Provider.fromJson(Map<String, dynamic> json) {
    return Provider(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      urlPhoto: json['urlPhoto'],
      review: json['review'].toDouble(),
      minPrice: json['minPrice'],
      maxPrice: json['maxPrice']
    );
  }
}

class CategoryProvidersScreen extends StatelessWidget {
  final Future<Provider> category;

  CategoryProvidersScreen({Key key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<Provider>>(
      future: fetchPost(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Provider> categories = snapshot.data;
          return BaseScreen(
             "72870-010",
            "Categoria teste",
                new Column(
                children: categories
                .map(
                  (item) => Container(
                    child: ProviderCard(
                      providerId: item.id,
                      name: item.name,
                      rating: item.review,
                      description: item.description,
                      minPrice: item.minPrice,
                      maxPrice: item.maxPrice,
                      avatarUrl: null,
                      onTap: () => (loadProvider(item.id, context)),
                    )                ,
                  )
                  ,
                )
                .toList(),
                ),
             null
          );
        } else if (snapshot.hasError) {
          //Display error if can't get data from API
          return BaseScreen("72870-010","Erro:",Text("${snapshot.error}"),null);
        }

        // By default, show a loading spinner.
        return BaseScreen("72870-010","Carregando",CircularProgressIndicator(),null);

      },
    );
  }
}
