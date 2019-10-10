import 'package:Pax/components/app_bar/white_appbar.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: true,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        color: Colors.black,
        onPressed: () {},
      ),
      centerTitle: true,
      title: Row(
        children: <Widget>[
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          SizedBox(width: 8),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Rogério Júnior",
                style: Theme.of(context).textTheme.title,
              ),
              SizedBox(height: 2),
              Text(
                "Assistência Técnica: Notebook",
                style: Theme.of(context).textTheme.body1,
              )
            ],
          )
        ],
      ),
    ));
  }
}
