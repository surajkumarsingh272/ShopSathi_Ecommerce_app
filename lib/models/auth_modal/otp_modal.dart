class OtpModel {
  final bool success;
  final String message;
  final String accessToken;
  final String refreshToken;

  OtpModel({
    required this.success,
    required this.message,
    required this.accessToken,
    required this.refreshToken,
  });

  factory OtpModel.fromJson(Map<String, dynamic> json) {
    return OtpModel(
      success: json['success'],
      message: json['message'],
      accessToken: json['accessToken'] ?? '',
      refreshToken: json['refreshToken'] ?? '',
    );
  }
}