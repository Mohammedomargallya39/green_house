class LoginModel
{
  final int id;
  final String email;
  final String name;
  final String token;

  LoginModel(
      {
        required this.id,
        required this.email,
        required this.name,
        required this.token,
      }
      );

  factory LoginModel.fromJson(Map<String, dynamic> json)
  {
    return LoginModel(
     id: json['id'] ?? 0,
     email: json['email'] ?? '',
     name: json['name'] ?? '',
     token: json['token'] ?? '',
    );
  }

}

