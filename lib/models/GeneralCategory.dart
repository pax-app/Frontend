import 'package:Pax/models/ProviderCategory.dart';

class GeneralCategory {
  final int id;
  final String name;
  final List<ProviderCategory> categories;
  bool expanded;

  GeneralCategory({this.id, this.name, this.categories});

  factory GeneralCategory.fromJson(Map<String, dynamic> json) {
    return GeneralCategory(
        id: json['id'],
        name: json['name'],
        categories: new List<ProviderCategory>());
  }

  addCategory(ProviderCategory c) {
    categories.add(c);
  }
}
