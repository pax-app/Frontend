class User {
  String name, email, cpf;

  User({this.name, this.email, this.cpf});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(name: json['name'], email: json['email'], cpf: json['cpf']);
  }
}
