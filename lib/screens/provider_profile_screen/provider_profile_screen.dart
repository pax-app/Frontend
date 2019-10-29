import 'package:Pax/components/app_bar/white_appbar.dart';
import 'package:Pax/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;


Future<Provider> fetchPost() async {
  final response = await http.get('http://pax-user.herokuapp.com/provider_info_by_category?providerId=&categoryId=',
  //If here we receive category name instead of id then just change the name of the query parameter to 'name' 
      headers: {HttpHeaders.contentTypeHeader: 'application/json'});
  var responseJson = json.decode(response.body);

  final Provider infoProvider = Provider.fromJson(responseJson);

  return infoProvider;
}

class Provider {
  final String name;
  final String description;
  final String urlPhoto;
  final int id;
  final int minPrice;
  final int maxPrice;
  final double charismaRate;
  final double reviewService;
  final String number;

  Provider({this.name, this.description, this.urlPhoto, this.number, this.charismaRate, this.reviewService, this.id, this.maxPrice, this.minPrice});

  factory Provider.fromJson(Map<String, dynamic> json) {
    return Provider(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      urlPhoto: json['urlPhoto'],
      charismaRate: json['charisma_rate'].toDouble(),
      reviewService: json['review_service'].toDouble(),
      minPrice: json['minPrice'],
      maxPrice: json['maxPrice'],
      number: json['number']
    );
  }
}


class ProviderProfileScreen extends StatelessWidget {
  final Future<Provider> category;

  ProviderProfileScreen({Key key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Provider>(
      future: fetchPost(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Provider categories = snapshot.data;
              return Scaffold(
      appBar: WhiteAppBar(
        categories.number,
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
                                    image: NetworkImage(categories.urlPhoto),
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
                            categories.name,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
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
                                  rating: categories.reviewService,
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
                                  rating: categories.charismaRate,
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
                            categories.description,
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
                            "R\$"+categories.minPrice.toString()+" a "+"R\$"+categories.maxPrice.toString(),
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
          return Text("${snapshot.error}");
        }

        // By default, show a loading spinner.
        return CircularProgressIndicator();
      },
    );
  }
}
