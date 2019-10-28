import 'package:flutter/material.dart';

class ChatAppBar extends StatelessWidget with PreferredSizeWidget {
  final String provider_name;
  final String provider_qualification;

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  ChatAppBar({
    @required this.provider_name,
    @required this.provider_qualification,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
        color: Theme.of(context).primaryColor,
      ),
      backgroundColor: Colors.white,
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
                provider_name,
                style: Theme.of(context).textTheme.title,
              ),
              SizedBox(height: 2),
              Text(
                provider_qualification,
                style: Theme.of(context).textTheme.body1,
              )
            ],
          )
        ],
      ),
    );
  }
}
