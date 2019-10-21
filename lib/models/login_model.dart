class LoginModel {
  final String userName;
  final String token;
  final String email;
  final int id;

  LoginModel(this.userName, this.token, this.email, this.id);

  LoginModel.fromJson(Map<String, dynamic> json)
      : userName = json['name'],
        token = json['auth_token'],
        email = json['email'],
        id = json['id'];

  Map<String, dynamic> toJson() =>
      {'name': userName, 'token': token, 'email': email, 'id': id};
}
