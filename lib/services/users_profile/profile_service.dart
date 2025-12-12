import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../../models/profile_modal/user_modal.dart';

class ProfileApi {
  // static const String baseUrl = "https://shop-sathi-api.onrender.com";
  static const String baseUrl = "https://shop-sathi-api.onrender.com";

  static Future<UserModel?> getProfile(String token) async {
    final response = await http.get(
      Uri.parse("$baseUrl/api/profile"),
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final userData = json['data'];
      return UserModel.fromJson(userData);
    }

    print("Error: ${response.body}");
    return null;
  }

  static Future<bool> updateProfile(
      String token,
      String name,
      String email,
      String phone, {
        File? imageFile,
      }) async {
    try {
      var request = http.MultipartRequest(
        "PUT",
        Uri.parse("$baseUrl/api/profile"),
      );
      request.headers['Authorization'] = "Bearer $token";
      request.fields['name'] = name;
      request.fields['email'] = email;
      request.fields['phone'] = phone;

      if (imageFile != null) {
        request.files.add(await http.MultipartFile.fromPath(
          "profile_image",
          imageFile.path,
        ));
      }

      final response = await request.send();
      final res = await http.Response.fromStream(response);

      if (res.statusCode == 200) {
        return true;
      } else {
        print("Update Error: ${res.body}");
        return false;
      }
    } catch (e) {
      print("Exception: $e");
      return false;
    }
  }
}

