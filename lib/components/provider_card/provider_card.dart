import 'package:Pax/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ProviderCard extends StatelessWidget {
  final int providerId;
  final String name;
  final double rating;
  final String description;
  final double minPrice;
  final double maxPrice;
  final String avatarUrl;
  final Function onTap;

  ProviderCard({
    @required this.providerId,
    @required this.name,
    @required this.rating,
    @required this.description,
    @required this.minPrice,
    @required this.maxPrice,
    @required this.avatarUrl,
    this.onTap,
  });

  wrapText(String source) {
    if (source.length > 50) return source.substring(0, 50) + "...";
    return source;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            height: 180,
            margin: EdgeInsets.all(8),
            child: Card(
              elevation: CardTheme.of(context).elevation,
              color: CardTheme.of(context).color,
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 2),
              child: InkWell(
                borderRadius: BorderRadius.circular(7.6),
                onTap: this.onTap,
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
                              border:
                                  Border.all(color: secondaryColor, width: 3),
                            ),
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
                                Text(this.name,
                                    style: Theme.of(context).textTheme.title),
                                SmoothStarRating(
                                    allowHalfRating: false,
                                    rating: this.rating,
                                    size: 20,
                                    color: secondaryColor,
                                    borderColor: secondaryColor),
                              ],
                            ),
                            Text(
                              this.wrapText(this.description),
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
      ],
    );
  }
}
