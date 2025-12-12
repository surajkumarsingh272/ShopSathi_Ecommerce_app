import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../models/auth_modal/forget_password_modal.dart';
import '../models/auth_modal/login_modal.dart';
import '../models/auth_modal/otp_modal.dart';
import '../models/auth_modal/register_modal.dart';
import '../models/auth_modal/reset_password_modal.dart';


class AuthApi {
  // static const String baseUrl = "https://shop-sathi-api.onrender.com";
  static const String baseUrl = "https://shop-sathi-api.onrender.com";
  // static Future<RegisterModel?> register(Map<String, dynamic> userData) async {
  //   final response = await http.post( Uri.parse('$baseUrl/register'),body: jsonEncode(userData), headers:{"Content-Type": "application/json"},);
  //   var responseBody = response.body;
  //   if (response.statusCode == 200) {
  //     return RegisterModel.fromJson(jsonDecode(responseBody));
  //   } else {
  //     throw Exception("Failed to register:$responseBody");
  //   }
  // }

  static Future<RegisterModel?> register( Map<String, dynamic> userData, File? imageFile) async {
    var uri = Uri.parse("$baseUrl/register");
    var request = http.MultipartRequest("POST", uri);
    request.fields['name'] = userData['name'];
    request.fields['email'] = userData['email'];
    request.fields['phone'] = userData['phone'];
    request.fields['password'] = userData['password'];
    if (imageFile != null) {
      request.files.add(await http.MultipartFile.fromPath("profile_image",imageFile.path,));
    }
    var response = await request.send();
    var responseBody = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      return RegisterModel.fromJson(jsonDecode(responseBody));
    } else {
      throw Exception("Registration failed: $responseBody");
    }
  }


  static Future<OtpModel> verifyOtp(Map<String, dynamic> otpData) async {
    var response = await http.post(Uri.parse('$baseUrl/verify-otp'), body: jsonEncode(otpData),headers: {"Content-Type": "application/json"},);
    var responseBody = response.body;
    if (response.statusCode == 200) {
      return OtpModel.fromJson(jsonDecode(responseBody));
    } else {
      throw Exception("OTP verification failed:  $responseBody");
    }
  }

  static Future<LoginModel> login(Map<String, dynamic> loginData) async {
    final response = await http.post( Uri.parse('$baseUrl/login'),body: jsonEncode(loginData),headers: {"Content-Type": "application/json"},);
    var responseBody = response.body;
    if (response.statusCode == 200) {
      return LoginModel.fromJson(jsonDecode(responseBody));
    } else {
      throw Exception("Login failed:  $responseBody");
    }
  }

  static Future<ForgotPasswordModel> forgotPassword(Map<String,dynamic> forgotData) async {
    final response = await http.post(Uri.parse('$baseUrl/forgot-password'),body: jsonEncode(forgotData), headers: {"Content-Type": "application/json"},);
    var responseBody = response.body;
    if (response.statusCode == 200) {
      return ForgotPasswordModel.fromJson(jsonDecode(responseBody));
    } else {
      throw Exception("Forgot password failed: $responseBody");
    }
  }

  static Future<ResetPasswordModel> resetPassword(Map<String, dynamic> resetData) async {
    final response = await http.post(Uri.parse('$baseUrl/reset-password'),body: jsonEncode(resetData),  headers: {"Content-Type": "application/json"},);
    final responseBody = response.body;
    if (response.statusCode == 200) {
      return ResetPasswordModel.fromJson(jsonDecode(responseBody));
    } else {
      throw Exception("Reset password failed: ${response.statusCode} $responseBody");
    }
  }

  static Future<Map<String,dynamic>> refreshToken(String refreshToken) async {
    final response = await http.post( Uri.parse('$baseUrl/refresh-token'), headers: {"Content-Type": "application/json"},
      body: jsonEncode({"refreshToken": refreshToken}),
    );
    final data = jsonDecode(response.body);
    if(response.statusCode == 200){
      return data;
    }
    else{
      throw Exception("Failed to refresh token: $data");
    }
  }

  // static Future<Map<String, dynamic>> getProfile(String accessToken) async {
  //   final response = await http.get(Uri.parse('$baseUrl/profile'), headers: {"Content-Type": "application/json",
  //     "Authorization": "Bearer $accessToken", },);
  //   final body = response.body;
  //   if (response.statusCode == 200) {
  //     final data = jsonDecode(body);
  //     if(data['success'] == true) {
  //       return data['user'];
  //     } else {
  //       throw Exception("Failed to fetch profile: ${data['message']}");
  //     }
  //   } else {
  //     throw Exception("Failed to fetch profile: $body");
  //   }
  // }

  static Future<Map<String, dynamic>> getProfile(String accessToken) async {
    final response = await http.get(Uri.parse('$baseUrl/api/profile'), headers: {"Content-Type": "application/json",
      "Authorization": "Bearer $accessToken", },);
    final body = response.body;
    if (response.statusCode == 200) {
      final data = jsonDecode(body);
      if(data['success'] == true) {
        return data['data'];
      } else {
        throw Exception("Failed to fetch profile: ${data['message']}");
      }
    } else {
      throw Exception("Failed to fetch profile: $body");
    }
  }

  static Future<Map<String,dynamic>> logout(String refreshToken) async {
    final response = await http.post(
      Uri.parse('$baseUrl/logout'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"refreshToken": refreshToken}),
    );
    final data = jsonDecode(response.body);
    if(response.statusCode == 200){
      return data;
    }
    else{
      throw Exception("Logout failed: $data");
    }
  }
}