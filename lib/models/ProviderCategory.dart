class ProviderCategory {
  final int id;
  final String name;
  final int generalId;

  ProviderCategory({this.id, this.name, this.generalId});

  factory ProviderCategory.fromJson(Map<String, dynamic> json) {
    return ProviderCategory(
        id: json['id'], name: json['name'], generalId: json["generalId"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "name": this.name,
      "generalId": this.generalId,
    };
  }
}
