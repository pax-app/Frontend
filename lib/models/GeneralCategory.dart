import 'package:Pax/models/category.dart';

class GeneralCategory {
  final int id;
  final String name;
  final List<Category> categories;
  bool expanded;

  GeneralCategory({this.id, this.name, this.categories});

  factory GeneralCategory.fromJson(Map<String, dynamic> json) {
    return GeneralCategory(
      id: json['id'],
      name: json['name'],
      categories: json['categories'].map((c) => Category.fromJson(c)).toList(),
    );
  }
}
