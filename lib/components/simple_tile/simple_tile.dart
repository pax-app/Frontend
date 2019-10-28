import 'package:flutter/material.dart';

class SimpleTile extends StatelessWidget {
  final String description;
  final Function onTapHandle;
  SimpleTile(this.description, this.onTapHandle);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: CardTheme.of(context).elevation,
      color: CardTheme.of(context).color,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 2),
      child: InkWell(
        borderRadius: BorderRadius.circular(7.6),
        onTap: onTapHandle,
        child: ListTile(
          title: Text(
            description,
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: Theme.of(context).textTheme.body1.fontSize,
                fontFamily: Theme.of(context).textTheme.body1.fontFamily),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Theme.of(context).primaryColorLight,
          ),
        ),
      ),
    );
  }
}
