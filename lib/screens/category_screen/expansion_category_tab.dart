import 'package:Pax/models/GeneralCategory.dart';
import 'package:Pax/models/category.dart';
import 'package:flutter/material.dart';

class ExpansionCategory extends StatefulWidget {
  final GeneralCategory generalCategory;
  ExpansionCategory(this.generalCategory);
  _ExpansionCategoryState createState() =>
      _ExpansionCategoryState(generalCategory);
}

class _ExpansionCategoryState extends State<ExpansionCategory> {
  final GeneralCategory generalCategory;
  bool isExpanded = false;
  List<Center> list = [];
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
                  value: selectedList.contains(category.id),
                  onChanged: (bool value) {
                    setState(() {
                      //timeDilation = value ? 2.0 : 1.0;
                      debugPrint("-------------------------------");
                      debugPrint(value.toString());
                      debugPrint(selectedList.contains(category.id).toString());
                      if (!selectedList.contains(category.id)) {
                        selectedList.add(category.id);
                      } else {
                        selectedList.remove(category.id);
                      }
                      debugPrint(selectedList.toString());
                      debugPrint(selectedList.contains(category.id).toString());
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

  List<Widget> gerateCategoryChekbox(List<Category> categories) {
    for (var category in categories) {
      list.add(
        Center(
          child: CheckboxListTile(
            key: Key(category.id.toString()),
            title: Text(
              category.name,
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            activeColor: Theme.of(context).accentColor,
            value: selectedList.contains(category.id),
            onChanged: (bool value) {
              setState(() {
                //timeDilation = value ? 2.0 : 1.0;
                debugPrint("-------------------------------");
                debugPrint(value.toString());
                debugPrint(selectedList.contains(category.id).toString());
                if (!selectedList.contains(category.id)) {
                  selectedList.add(category.id);
                } else {
                  selectedList.remove(category.id);
                }
                debugPrint(selectedList.toString());
                debugPrint(selectedList.contains(category.id).toString());
              });
            },
          ),
        ),
      );
    }
    return list.toList();
  }
}

// // class _ExpansionCategoryState extends State<ExpansionCategory> {
// //   final List<GeneralCategory> generalCategory;
// //   _ExpansionCategoryState(this.generalCategory);
// //   @override
// //   Widget build(BuildContext context) {
// //     return ExpansionPanelList(
// //       expansionCallback: (int index, bool expanded) {
// //         setState(() {
// //           generalCategory[index].expanded = !expanded;
// //         });
// //       },
// //       children: generalCategory.map<ExpansionPanel>((GeneralCategory category) {
// //         return ExpansionPanel(
// //           headerBuilder: (BuildContext context, bool isExpanded) {
// //             return ListTile(
// //               title: Text("item.headerValue"),
// //             );
// //           },
// //           body: ListTile(
// //               title: Text("item.expandedValue"),
// //               subtitle: Text('To delete this panel, tap the trash can icon'),
// //               trailing: Icon(Icons.delete),
// //               onTap: () {
// //                 // setState(() {
// //                 //   generalCategory.removeWhere((currentItem) => item == currentItem);
// //                 // });
// //               }),
// //           isExpanded: category.expanded,
// //         );
// //       }).toList(),
// //     );
// //   }
// // }
