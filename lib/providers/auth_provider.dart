import 'package:flutter/material.dart';
import '../services/api_service.dart';

class AuthProvider with ChangeNotifier {
  String token = "";

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  signup() async {
    final res = await ApiService.signup(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
      phone: phoneController.text.trim(),
    );
    return res['message'];
  }


  Future<String> login() async {
    final res = await ApiService.login(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );

    if (res.containsKey("token")) {
      token = res["token"];
      notifyListeners();
    }
    return res['message'];
  }

  void logout() {
    token = "";
    notifyListeners();
  }

  void clearFields() {
    emailController.clear();
    passwordController.clear();
    phoneController.clear();
    notifyListeners();
  }
}
