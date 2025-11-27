
import '../models/mobile_model.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MobileProvider extends ChangeNotifier {
  MobileMainModel? mobileData;
  bool isLoading = false;

  Future<void> getData(String id) async {
    isLoading = true;
    notifyListeners();

    final url = Uri.parse("http://10.193.225.183:4000/mobilescreen?id=$id");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      mobileData = MobileMainModel.fromJson(data);
    } else {
      mobileData = null;
    }

    isLoading = false;
    notifyListeners();
  }
}
