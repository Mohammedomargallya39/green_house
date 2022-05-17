class LogOutModel
{
  final String message;

  LogOutModel({
    required this.message,
  });

  factory LogOutModel.fromJson(Map<String, dynamic> json)
  {
    return LogOutModel(
      message: json['message'] ?? '',
    );
  }
}

