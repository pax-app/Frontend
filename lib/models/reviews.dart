class CharismaReviews {
  double userReviewAverage;

  CharismaReviews({this.userReviewAverage});

  factory CharismaReviews.fromJson(Map<String, dynamic> json) {
    return CharismaReviews(
      userReviewAverage: (json['user_review_average'] as int).toDouble(),
    );
  }
}

class ServiceReviews {
  double providerServiceReviewAverage;

  ServiceReviews({this.providerServiceReviewAverage});

  factory ServiceReviews.fromJson(Map<String, dynamic> json) {
    return ServiceReviews(
      providerServiceReviewAverage:
          (json['provider_service_review_average'] as int).toDouble(),
    );
  }
}
