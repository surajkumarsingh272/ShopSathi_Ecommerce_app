// import 'package:flutter/material.dart';
// import '../services/api_service.dart';
//
// class AuthProvider with ChangeNotifier {
//   String token = "";
//
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController phoneController = TextEditingController();
//
//   signup() async {
//     final res = await ApiService.signup(
//       email: emailController.text.trim(),
//       password: passwordController.text.trim(),
//       phone: phoneController.text.trim(),
//     );
//     return res['message'];
//   }
//
//
//   Future<String> login() async {
//     final res = await ApiService.login(
//       email: emailController.text.trim(),
//       password: passwordController.text.trim(),
//     );
//
//     if (res.containsKey("token")) {
//       token = res["token"];
//       notifyListeners();
//     }
//     return res['message'];
//   }
//
//   void logout() {
//     token = "";
//     notifyListeners();
//   }
//
//   void clearFields() {
//     emailController.clear();
//     passwordController.clear();
//     phoneController.clear();
//     notifyListeners();
//   }
// }


import 'package:flutter/material.dart';
import '../models/auth_modal/forget_password_modal.dart';
import '../models/auth_modal/login_modal.dart';
import '../models/auth_modal/otp_modal.dart';
import '../models/auth_modal/register_modal.dart';
import '../models/auth_modal/reset_password_modal.dart';
import '../services/auth_api.dart';


class AuthProvider with ChangeNotifier {

  final nameController = TextEditingController();
  final emailController= TextEditingController();
  final phoneController = TextEditingController();
  final passController = TextEditingController();

  Future<RegisterModel?> register(String name, String email, String phone, String password) {
    final userData = {
      "name": name,
      "email": email,
      "phone": phone,
      "password": password,
    };
    return AuthApi.register(userData);
  }


  Future<OtpModel> verifyOtp(Map<String, dynamic> otpData) async {
    return await AuthApi.verifyOtp(otpData);
  }

  Future<LoginModel> loginUser(String email, String password) async {
    final loginData = {
      "email": email,
      "password": password,
    };

    return await AuthApi.login(loginData);
  }


  Future<ForgotPasswordModel> forgotPassword(String phone) async {
    final phoneData = {"phone": phone};
    return await AuthApi.forgotPassword(phoneData);
  }


  Future<ResetPasswordModel> resetPassword(Map<String, dynamic> resetData) async {
    return await AuthApi.resetPassword(resetData);
  }

  Future<Map<String, dynamic>> refreshToken(String token) async {
    return await AuthApi.refreshToken(token);
  }

  Future<Map<String, dynamic>> getProfile(String accessToken) async {
    return await AuthApi.getProfile(accessToken);
  }

  Future<Map<String, dynamic>> logout(String refreshToken) async {
    return await AuthApi.logout(refreshToken);
  }
}