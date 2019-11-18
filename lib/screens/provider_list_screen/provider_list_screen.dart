import 'package:Pax/screens/provider_profile_screen/provider_profile_screen.dart';
import 'package:Pax/components/provider_card/provider_card.dart';
import 'package:Pax/components/base_screen/base_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';

class ProviderListScreen extends StatelessWidget {
  final int providerCategoryId;
  final String title;

  ProviderListScreen({
    this.providerCategoryId,
    @required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'provider_profile',
      child: FutureBuilder(
        future: _fetchPost(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var providers = snapshot.data;
            return BaseScreen(
              "Escolha um profissional",
              "Prestadores de ${title}",
              Container(
                height: MediaQuery.of(context).size.height * .77,
                child: ListView.builder(
                  itemCount: providers.length,
                  itemBuilder: (context, index) {
                    return ProviderCard(
                      providerId: providers[index]['provider_id'],
                      name: providers[index]['name'],
                      rating: double.parse(
                        providers[index]['reviews_average'].toString(),
                      ),
                      description: providers[index]['bio'],
                      minPrice: providers[index]['minimum_price'],
                      maxPrice: providers[index]['maximum_price'],
                      avatarUrl: providers[index]['url_avatar'],
                      onTap: () => loadProvider(
                        providers[index],
                        context,
                      ),
                    );
                  },
                ),
              ),
              null,
            );
          } else if (snapshot.hasError) {
            return BaseScreen("", "Erro:", Text("${snapshot.error}"), null);
          }

          return BaseScreen(
              "", "Carregando", CircularProgressIndicator(), null);
        },
      ),
    );
  }

  loadProvider(var provider, ctx) async {
    var reviewService =
        await _getServiceRate(provider['provider_id'].toString());

    Navigator.push(
      ctx,
      CupertinoPageRoute(
        builder: (ctx) => ProviderProfileScreen(
          bio: provider['bio'],
          charismaRate: double.parse(provider['reviews_average'].toString()),
          maxPrice: provider['maximum_price'],
          minPrice: provider['minimum_price'],
          name: provider['name'],
          photoUrl: provider['url_avatar'],
          reviewService: double.parse(reviewService.toString()),
        ),
      ),
    );
  }

  Future<dynamic> _fetchPost() async {
    final response = await http.get(
        'https://pax-user.herokuapp.com/provider_by_category/review/$providerCategoryId');
    var responseJson = json.decode(response.body);

    var listaFinal = [];

    for (var item in responseJson) {
      listaFinal.add(item);
    }

    return listaFinal;
  }

  Future<dynamic> _getServiceRate(String providerId) async {
    final response = await http.get(
        'https://pax-review.herokuapp.com/service_reviews/average/$providerId');
    var responseJson = json.decode(response.body);

    return responseJson['provider_service_review_average'];
  }
}
