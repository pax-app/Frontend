import 'package:Pax/models/category.dart';
import 'package:Pax/models/user.dart';

class Provider extends User{
  String bio;
  double minPrice, maxPrice;
  List<Category> categories;

  Provider({this.bio, this.minPrice, this.maxPrice, this.categories});

  factory Provider.fromJson(Map<String, dynamic> json) {
    return Provider(
      bio: json['bio'],
      maxPrice: json['maxPrice'],
      minPrice: json['minPrice'],
      categories: json['categories'].map((c)=>Category.fromJson(c)).toList(),
    );
  }
}