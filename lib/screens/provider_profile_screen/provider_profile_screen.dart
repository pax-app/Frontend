import 'package:Pax/components/app_bar/white_appbar.dart';
import 'package:Pax/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ProviderProfileScreen extends StatefulWidget {
  final String photoUrl;
  final String name;
  final double reviewService;
  final double charismaRate;
  final String bio;
  final double minPrice;
  final double maxPrice;

  final Function createChat;

  ProviderProfileScreen({
    @required this.photoUrl,
    @required this.name,
    @required this.reviewService,
    @required this.bio,
    @required this.minPrice,
    @required this.maxPrice,
    @required this.charismaRate,
    @required this.createChat,
  });

  @override
  _ProviderProfileScreenState createState() => _ProviderProfileScreenState();
}

class _ProviderProfileScreenState extends State<ProviderProfileScreen> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WhiteAppBar(
        "",
        context,
        actions: <Widget>[
          isLoading
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: CircularProgressIndicator(),
                  ),
                )
              : FlatButton(
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });
                    await widget.createChat();
                    setState(() {
                      isLoading = false;
                    });
                  },
                  textColor: secondaryColor,
                  child: Text(
                    "CHAT",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  shape: CircleBorder(
                    side: BorderSide(color: Colors.transparent),
                  ),
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
                                  image: NetworkImage(widget.photoUrl),
                                  fit: BoxFit.cover),
                              border:
                                  Border.all(color: secondaryColor, width: 3),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.name,
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
                                rating: widget.reviewService,
                                size: 20,
                                color: secondaryColor,
                                borderColor: secondaryColor,
                              ),
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
                                rating: widget.charismaRate,
                                size: 20,
                                color: secondaryColor,
                                borderColor: secondaryColor,
                              ),
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
                            widget.bio,
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
                          "R\$" +
                              widget.minPrice.toString() +
                              " a " +
                              "R\$" +
                              widget.maxPrice.toString(),
                          style: TextStyle(color: secondaryColor, fontSize: 16),
                        ),
                      ),
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
