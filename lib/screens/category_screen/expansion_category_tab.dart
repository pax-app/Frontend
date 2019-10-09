import 'package:Pax/models/GeneralCategory.dart';
import 'package:flutter/material.dart';
import 'package:Pax/blocs/provider_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

class ExpansionCategory extends StatefulWidget {
  final GeneralCategory generalCategory;
  ExpansionCategory(this.generalCategory);
  _ExpansionCategoryState createState() =>
      _ExpansionCategoryState(generalCategory);
}

class _ExpansionCategoryState extends State<ExpansionCategory> {
  final GeneralCategory generalCategory;
  bool isExpanded = false;
  List<Center> listCotegory = List();
  List<int> selectedList = List();
  bool clicked = false;

  _ExpansionCategoryState(this.generalCategory);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: ExpansionTile(
        onExpansionChanged: (bool expanding) =>
            setState(() => this.isExpanded = expanding),
        title: Text(
          generalCategory.name,
          textAlign: TextAlign.start,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              color: isExpanded
                  ? Theme.of(context).accentColor
                  : Theme.of(context).textTheme.body1.color),
        ),
        children: <Widget>[
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: generalCategory.categories.length,
            itemBuilder: (BuildContext context, int idx) {
              final category = generalCategory.categories[idx];
              return Center(
                child: CheckboxListTile(
                  key: Key(category.id.toString()),
                  title: Text(
                    category.name,
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                  activeColor: Theme.of(context).accentColor,
                  value: BlocProvider.of<ProviderBloc>(context)
                      .thereCategory(category),
                  onChanged: (bool value) {
                    setState(() {
                      BlocProvider.of<ProviderBloc>(context)
                          .addCategory(category);
                      debugPrint(category.toString());
                    });
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
