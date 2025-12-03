class LoginModel {
  final bool success;
  final String message;
  final String? accessToken;
  final String? refreshToken;

  LoginModel({
    required this.success,
    required this.message,
    this.accessToken,
    this.refreshToken,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
    );
  }
}
