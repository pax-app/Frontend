import 'package:flutter/material.dart';

class BaseTitleDescription extends StatelessWidget {
  final String title;
  final String description;

  const BaseTitleDescription({
    this.title,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: Theme.of(context).textTheme.title,
          textAlign: TextAlign.justify,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        Text(
          description,
          textAlign: TextAlign.justify,
          style: TextStyle(height: 1.5),
        ),
      ],
    );
  }
}
