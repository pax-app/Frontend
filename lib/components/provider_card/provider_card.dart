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
            margin: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
            child: Card(
              elevation: CardTheme.of(context).elevation,
              color: CardTheme.of(context).color,
              child: InkWell(
                borderRadius: BorderRadius.circular(7.6),
                onTap: this.onTap,
                child: Row(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topCenter,
                      padding: EdgeInsets.only(left: 16, top: 20, right: 10),
                      child: Container(
                        width: 73,
                        height: 73,
                        decoration: new BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(this.avatarUrl),
                            fit: BoxFit.fill,
                          ),
                          shape: BoxShape.circle,
                          border: Border.all(color: secondaryColor, width: 3),
                        ),
                      ),
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
                                  style: Theme.of(context)
                                      .textTheme
                                      .title
                                      .copyWith(
                                        fontSize: 17,
                                      ),
                                ),
                                SmoothStarRating(
                                  allowHalfRating: false,
                                  rating: this.rating,
                                  size: 25,
                                  color: secondaryColor,
                                  borderColor: secondaryColor,
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: Text(
                                this.wrapText(this.description),
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            Text(
                              "R\$ " +
                                  this.minPrice.toString() +
                                  " à R\$ " +
                                  this.maxPrice.toString(),
                              style: Theme.of(context).textTheme.subtitle,
                            ),
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
