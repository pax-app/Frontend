import 'package:flutter/material.dart';

class SimpleTile extends StatelessWidget {
  final String description;
  SimpleTile(this.description);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 2),
      color: Colors.white,
      child: InkWell(
        onTap: () {
          debugPrint('Foiiii!!');
        },
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
