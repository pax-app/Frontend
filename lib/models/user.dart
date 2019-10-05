class User {
  String name, email, cpf, photo;

  User({this.name, this.email, this.cpf, this.photo});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
      cpf: json['cpf'],
      photo: json['photo'],
    );
  }
}
