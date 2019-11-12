class LoginModel {
  final String userName;
  final String token;
  final String email;
  final int id;
  final bool isProvider;

  LoginModel(this.userName, this.token, this.email, this.id, this.isProvider);

  LoginModel.fromJson(Map<String, dynamic> json)
      : userName = json['name'],
        token = json['auth_token'],
        email = json['email'],
        id = json['id'],
        isProvider = json['is_provider'];

  Map<String, dynamic> toJson() => {
        'name': userName,
        'token': token,
        'email': email,
        'id': id,
        'is_provider': isProvider
      };
}
