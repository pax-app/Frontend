import 'package:Pax/models/reviews.dart';

class User {
  String name, email, rg, photo;
  double userReviewAverage = 0.0, providerServiceReviewAverage = 0.0;

  User({this.name, this.email, this.rg, this.photo});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
      rg: json['rg'],
      photo: json['photo'],
    );
  }

  void addReviews(CharismaReviews charisma, ServiceReviews service) {
    this.userReviewAverage = charisma.userReviewAverage;
    this.providerServiceReviewAverage =
        service != null ? service.providerServiceReviewAverage : 0;
  }
}
