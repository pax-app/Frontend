import 'package:Pax/components/app_bar/white_appbar.dart';
import 'package:Pax/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ProviderProfileScreen extends StatefulWidget {
  ProviderProfileScreen({Key key}) : super(key: key);

  _ProviderProfileScreenState createState() => _ProviderProfileScreenState();
}

class _ProviderProfileScreenState extends State<ProviderProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WhiteAppBar(
        '234234',
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
                                    image: NetworkImage(
                                        'https://upload.wikimedia.org/wikipedia/commons/a/a0/Pierre-Person.jpg'),
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
                            "Loren Gutierrez",
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
                                  rating: 5,
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
                                  rating: 5,
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
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus tristique nisl ut justo semper maximus. Donec fermentum, nunc non ullamcorper volutpat, arcu lacus fermentum purus, sed tincidunt elit dolor vitae ante. Cras vel fringilla leo, in consectetur sem. Vivamus convallis laoreet augue. Nulla nec rutrum quam",
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
                            "R\$30 a R\$200",
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
  }
}
