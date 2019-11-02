import 'package:Pax/components/app_bar/white_appbar.dart';
import 'package:Pax/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:Pax/components/base_screen/base_screen.dart';
import 'package:Pax/models/Provider.dart';


Future<Provider> fetchPost() async {
  final response = await http.get('http://pax-user.herokuapp.com/provider_info_by_category?providerId=&categoryId=',
  //If here we receive category name instead of id then just change the name of the query parameter to 'name' 
      headers: {HttpHeaders.contentTypeHeader: 'application/json'});
  var responseJson = json.decode(response.body);

  final Provider infoProvider = Provider.fromJson(responseJson);

  return infoProvider;
}


class ProviderProfileScreen extends StatelessWidget {

  ProviderProfileScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Provider>(
      future: fetchPost(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Provider providerInfo = snapshot.data;
              return Scaffold(
      appBar: WhiteAppBar(
        "",
        context,
        actions: <Widget>[
          FlatButton(
            onPressed: () {},
            textColor: secondaryColor,
            child: Text(
              "CHAT",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(0),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            child: Container(
              padding:
                  EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            width: 120,
                            height: 120,
                            margin: EdgeInsets.only(right: 30),
                            decoration: new BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                image: DecorationImage(
                                    image: NetworkImage(providerInfo.providerPhoto),
                                    fit: BoxFit.cover),
                                border: Border.all(
                                    color: secondaryColor, width: 3)),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            providerInfo.providerName,
                            style: Theme.of(context).textTheme.title,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Serviço",
                              ),
                              SmoothStarRating(
                                  allowHalfRating: false,
                                  rating: providerInfo.reviewService,
                                  size: 20,
                                  color: secondaryColor,
                                  borderColor: secondaryColor),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Carisma",
                              ),
                              SmoothStarRating(
                                  allowHalfRating: false,
                                  rating: providerInfo.charismaRate,
                                  size: 20,
                                  color: secondaryColor,
                                  borderColor: secondaryColor),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Text(
                            providerInfo.bio,
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.only(top: 15),
                          child: Text(
                            "R\$"+providerInfo.minPrice.toString()+" a "+"R\$"+providerInfo.maxPrice.toString(),
                            style:
                                TextStyle(color: secondaryColor, fontSize: 16),
                          )),
                    ],
                  )
                ],
                
                

              ),
            ),
          ),
        ],
      ),
    );
       
        } else if (snapshot.hasError) {
          return BaseScreen("","Erro:",Text("${snapshot.error}"),null);
        }

        // By default, show a loading spinner.
        return BaseScreen("","Carregando",CircularProgressIndicator(),null);
      },
    );
  }
}
