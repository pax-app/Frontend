class LoginModel {
  final String userName;
  final String token;
  final String email;

  LoginModel(this.userName, this.token, this.email);

  LoginModel.fromJson(Map<String, dynamic> json)
      : userName = json['name'],
        token = json['auth_token'],
        email = json['email'];

  Map<String, dynamic> toJson() =>
      {'name': userName, 'token': token, 'email': email};
}
