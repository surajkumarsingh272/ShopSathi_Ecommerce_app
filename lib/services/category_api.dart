import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/banner_modal.dart';
import '../models/product_model.dart';

class CategoryApi {
  static const String baseUrl = "http://10.170.190.64:3000";

  // Top products
  static Future<List<ProductModel>> fetchTopProducts() async {
    final response = await http.get(Uri.parse("$baseUrl/top-products"));
    print("BANNERS RESPONSE => ${response.body}");
    if (response.statusCode == 200) {
      List jsonData = jsonDecode(response.body);
      return jsonData.map((item) => ProductModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load top products');
    }
  }

  // New products
  static Future<List<ProductModel>> fetchNewProducts() async {
    final response = await http.get(Uri.parse("$baseUrl/new-products"));
    if (response.statusCode == 200) {
      List jsonData = jsonDecode(response.body);
      return jsonData.map((item) => ProductModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load new products');
    }
  }

  // Categories
  static Future<List<Map<String, dynamic>>> fetchCategories() async {
    final response = await http.get(Uri.parse("$baseUrl/categories"));
    if (response.statusCode == 200) {
      List jsonData = jsonDecode(response.body);
      return List<Map<String, dynamic>>.from(jsonData);
    } else {
      throw Exception('Failed to load categories');
    }
  }

  static Future<List<BannerModel>> fetchBanners() async {
    final response = await http.get(Uri.parse("$baseUrl/banners"));
    if (response.statusCode == 200) {
      List jsonData = jsonDecode(response.body);
      return jsonData.map((item) => BannerModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load banners');
    }
  }
}
