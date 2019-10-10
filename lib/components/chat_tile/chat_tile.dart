import 'package:flutter/material.dart';

class ChatTile extends StatelessWidget {
  final String username;
  final String message;

  ChatTile({@required this.username, @required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 14),
        elevation: Theme.of(context).cardTheme.elevation,
        color: Theme.of(context).cardTheme.color,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 12),
            child: ListTile(
              leading: Icon(
                Icons.account_circle,
                size: 50,
              ),
              title: Text(
                this.username,
                style: Theme.of(context).textTheme.title,
              ),
              subtitle: Text(this.message),
            ),
          ),
        ),
      ),
    );
  }
}
