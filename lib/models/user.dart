class User {
  String name, email, rg, photo;

  User({this.name, this.email, this.rg, this.photo});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
      rg: json['rg'],
      photo: json['photo'],
    );
  }
}
