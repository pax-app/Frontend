import 'package:flutter/material.dart';

class GeneralCategoriesPanelDescription extends StatelessWidget {
  final String description;
  GeneralCategoriesPanelDescription(this.description);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        children: <Widget>[Text(this.description)],
      ),
    );
  }
}
