import 'package:Pax/models/GeneralCategory.dart';
import 'package:Pax/models/category.dart';
import 'package:flutter/material.dart';

class ExpansionCategory extends StatefulWidget {
  final List<GeneralCategory> generalCategory;
  ExpansionCategory(this.generalCategory);
  _ExpansionCategoryState createState() =>
      _ExpansionCategoryState(this.generalCategory);
}

class _ExpansionCategoryState extends State<ExpansionCategory> {
  final List<GeneralCategory> generalCategory;
  _ExpansionCategoryState(this.generalCategory);
  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expansionCallback: (int index, bool expanded) {
        setState(() {
          generalCategory[index].expanded = !expanded;
        });
      },
      children: generalCategory.map<ExpansionPanel>((GeneralCategory category) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text("item.headerValue"),
            );
          },
          body: ListTile(
              title: Text("item.expandedValue"),
              subtitle: Text('To delete this panel, tap the trash can icon'),
              trailing: Icon(Icons.delete),
              onTap: () {
                // setState(() {
                //   generalCategory.removeWhere((currentItem) => item == currentItem);
                // });
              }),
          isExpanded: category.expanded,
        );
      }).toList(),
    );
  }
}
