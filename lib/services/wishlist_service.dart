import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/wishlist_item.dart';

class WishlistService {
  static const String baseUrl = "http://10.170.190.64:3000";
  static Future<List<WishlistItem>> fetchWishlist(int userId, String token) async {
    try {
      final res = await http.get(
        Uri.parse("$baseUrl/wishlist/$userId"),
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
        },
      );

      if (res.statusCode != 200) return [];

      final json = jsonDecode(res.body);

      // NULL safe parsing
      final List data = json['wishlist'] ?? [];

      return data.map((e) => WishlistItem.fromJson(e)).toList();
    } catch (e) {
      print("WISHLIST FETCH ERROR: $e");
      return [];
    }
  }

  // ------------------------------
  // ADD TO WISHLIST
  // ------------------------------
  static Future<bool> addToWishlist(int userId, int productId, String token) async {
    try {
      final res = await http.post(
        Uri.parse("$baseUrl/wishlist"),
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "user_id": userId,
          "product_id": productId,
        }),
      );
      print("Response status: ${res.statusCode}, body: ${res.body}");
      final data = jsonDecode(res.body);
      return data['success'] == true;
    } catch (e) {
      print("ADD WISHLIST ERROR: $e");
      return false;
    }
  }

  // ------------------------------
  // REMOVE FROM WISHLIST
  // ------------------------------
  // Backend expects: DELETE /wishlist/:wishlistId
  static Future<bool> removeFromWishlist(int wishlistId, String token) async {
    try {
      final res = await http.delete(
        Uri.parse("$baseUrl/wishlist/$wishlistId"),
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
        },
      );

      final data = jsonDecode(res.body);
      return data['success'] == true;
    } catch (e) {
      print("REMOVE WISHLIST ERROR: $e");
      return false;
    }
  }
}
