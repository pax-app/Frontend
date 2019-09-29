import 'package:Pax/models/GeneralCategory.dart';
import 'package:Pax/models/category.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter/material.dart';

class ExpansionCategory extends StatefulWidget {
  final GeneralCategory generalCategory;
  ExpansionCategory(this.generalCategory);
  _ExpansionCategoryState createState() =>
      _ExpansionCategoryState(generalCategory);
}

class _ExpansionCategoryState extends State<ExpansionCategory> {
  final GeneralCategory generalCategory;
  _ExpansionCategoryState(this.generalCategory);
  bool isExpanded = false;
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
        children: gerateCategoryChekbox(generalCategory.categories),
      ),
    );
  }

  List<Center> gerateCategoryChekbox(List<Category> categories){
    List<Center> list = [];
    for (var cateory in categories) {
      list.add(
        Center(
            child: CheckboxListTile(
              title: const Text('Animate Slowly'),
              value: timeDilation != 1.0,
              onChanged: (bool value) {
                setState(() {
                  timeDilation = value ? 2.0 : 1.0;
                });
              },
            ),
          )
      );
    }
    return list.toList();
  }
}

// class _ExpansionCategoryState extends State<ExpansionCategory> {
//   final List<GeneralCategory> generalCategory;
//   _ExpansionCategoryState(this.generalCategory);
//   @override
//   Widget build(BuildContext context) {
//     return ExpansionPanelList(
//       expansionCallback: (int index, bool expanded) {
//         setState(() {
//           generalCategory[index].expanded = !expanded;
//         });
//       },
//       children: generalCategory.map<ExpansionPanel>((GeneralCategory category) {
//         return ExpansionPanel(
//           headerBuilder: (BuildContext context, bool isExpanded) {
//             return ListTile(
//               title: Text("item.headerValue"),
//             );
//           },
//           body: ListTile(
//               title: Text("item.expandedValue"),
//               subtitle: Text('To delete this panel, tap the trash can icon'),
//               trailing: Icon(Icons.delete),
//               onTap: () {
//                 // setState(() {
//                 //   generalCategory.removeWhere((currentItem) => item == currentItem);
//                 // });
//               }),
//           isExpanded: category.expanded,
//         );
//       }).toList(),
//     );
//   }
// }
