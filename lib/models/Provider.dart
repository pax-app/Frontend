import 'package:Pax/models/ProviderCategory.dart';
import 'package:Pax/models/user.dart';

class Provider extends User {
  int providerId = 0;
  String bio = "";

  String providerName = "";
  String providerPhoto = "";
  //TODO: Call constructor from super instead of redefining these

  double minPrice = 0, maxPrice = 0, reviewService = 0, charismaRate = 0;
  List<ProviderCategory> categories = List<ProviderCategory>();

  Provider(
      {this.providerPhoto,
      this.providerName,
      this.bio,
      this.minPrice,
      this.maxPrice,
      this.categories,
      this.providerId,
      this.charismaRate,
      this.reviewService});

  factory Provider.fromJson(Map<String, dynamic> json) {
    //Using ternary operator to make all JSON parameters optional
    return Provider(
      providerName: json['name'] != null ? json['name'] : '',
      providerPhoto: json['photo'] != null ? json['photo'] : '',
      bio: json['bio'] != null ? json['bio'] : '',
      maxPrice: json['maxPrice'] != null ? json['maxPrice'].toDouble() : 0,
      minPrice: json['minPrice'] != null ? json['minPrice'].toDouble() : 0,
      categories:
          json['categories'].map((c) => ProviderCategory.fromJson(c)).toList(),
      providerId: json['providerId'],
      charismaRate:
          json['charisma_rate'] != null ? json['charisma_rate'].toDouble() : 0,
      reviewService: json['review_service'] != null
          ? json['review_service'].toDouble()
          : 0,
    );
  }
}
