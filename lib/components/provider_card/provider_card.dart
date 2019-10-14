import 'package:Pax/screens/provider_profile_screen/provider_profile_screen.dart';
import 'package:Pax/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ProviderCard extends StatelessWidget {
  final int providerId;
  final String name;
  final double rating;
  final String description;
  final int minPrice;
  final int maxPrice;
  final String avatarUrl;

  ProviderCard(
      {@required this.providerId,
      @required this.name,
      @required this.rating,
      @required this.description,
      @required this.minPrice,
      @required this.maxPrice,
      @required this.avatarUrl});

  wrapText(String source) {
    if (source.length > 50) return source.substring(0, 50) + "...";
    return source;
  }

  loadProvider(context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ProviderProfileScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: InkWell(
            onTap: loadProvider(context),
            child: Container(
              height: 180,
              margin: EdgeInsets.all(8),
              child: Card(
                elevation: CardTheme.of(context).elevation,
                color: CardTheme.of(context).color,
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 2),
                child: InkWell(
                  borderRadius: BorderRadius.circular(7.6),
                  onTap: () {
                    debugPrint('Foiiii!!');
                  },
                  child: Row(
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(20),
                            child: Container(
                              width: 90,
                              height: 90,
                              decoration: new BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(this.avatarUrl),
                                      fit: BoxFit.fill),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: secondaryColor, width: 3)),
                            ),
                          )
                        ],
                      ),
                      Flexible(
                        child: Container(
                          padding: EdgeInsets.only(top: 25, bottom: 25),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    this.name,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SmoothStarRating(
                                      allowHalfRating: false,
                                      rating: this.rating,
                                      size: 20,
                                      color: secondaryColor,
                                      borderColor: secondaryColor),
                                ],
                              ),
                              Text(
                                wrapText(this.description),
                                style: TextStyle(fontSize: 16),
                              ),
                              Text("R\$" +
                                  this.minPrice.toString() +
                                  " a R\$" +
                                  this.maxPrice.toString()),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
