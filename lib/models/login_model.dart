class LoginModel {
  final String userName;
  final String token;
  final String email;
  final int id;
  final bool isProvider;
  final int providerId;
  final String url_avatar;

  LoginModel(this.userName, this.token, this.email, this.id, this.isProvider,
      this.providerId, this.url_avatar);

  LoginModel.fromJson(Map<String, dynamic> json)
      : userName = json['name'],
        token = json['auth_token'],
        email = json['email'],
        id = json['id'],
        isProvider = json['is_provider'] != null ? json['is_provider'] : false,
        providerId = json['provider_id'],
        url_avatar = json['url_avatar'];

  Map<String, dynamic> toJson() => {
        'name': userName,
        'token': token,
        'email': email,
        'id': id,
        'is_provider': isProvider,
        'provider_id': providerId,
        'url_avatar': url_avatar
      };
}
