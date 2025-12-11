import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/profile_modal/user_modal.dart';
import '../../services/users_profile/profile_service.dart';

class ProfileProvider with ChangeNotifier {
  UserModel? user;

  // Future<void> fetchProfile() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final token = prefs.getString("accessToken");
  //   print("TOKEN FROM PREFS => $token");
  //
  //   if (token == null) return;
  //
  //   if (token == null) {
  //     print("⚠ Profile data null aa rha hai.");
  //     return;
  //   }
  //   user = await ProfileApi.getProfile(token);
  //   notifyListeners();
  // }

  Future<void> fetchProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("accessToken");
    print("TOKEN FROM PREFS => $token");

    if (token == null) {
      print("⚠ Token null hai, profile fetch nahi hoga!");
      return;
    }

    try {
      user = await ProfileApi.getProfile(token);
      print("PROFILE FETCH SUCCESS: ${user?.name}");
    } catch (e) {
      print("❌ Profile fetch error: $e");
    }

    notifyListeners();
  }


  Future<bool> updateProfile({
    required String name,
    required String email,
    required String phone,
    File? imageFile,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("accessToken");
    if (token == null) return false;

    bool success = await ProfileApi.updateProfile(
      token,
      name,
      email,
      phone,
      imageFile: imageFile,
    );
    if (success) {
      await fetchProfile();
    }

    return success;
  }
  void setUser(UserModel newUser) {
    user = newUser;
    notifyListeners();
  }
}

