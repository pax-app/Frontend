import 'package:flutter/material.dart';

class ChatAppBar extends StatelessWidget with PreferredSizeWidget {
  final String providerName;
  final String avatarUrl;

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  ChatAppBar({
    @required this.providerName,
    @required this.avatarUrl,
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
              borderRadius: BorderRadius.circular(60),
              border: Border.all(width: 2, color: Colors.green),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(avatarUrl),
              ),
            ),
          ),
          SizedBox(width: 8),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                providerName,
                style: Theme.of(context).textTheme.title,
              ),
            ],
          )
        ],
      ),
    );
  }
}
