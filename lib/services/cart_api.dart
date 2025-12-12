import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/cart_model.dart';

class CartApi {
  static const String baseUrl = "http://10.170.190.64:3000";

  static Future<bool> addToCart({
    required int userId,
    required int productId,
    int? colorId,
    required int quantity,
  }) async {
    final url = Uri.parse("$baseUrl/cart/add");

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "user_id": userId,
        "product_id": productId,
        "color_id": colorId,
        "quantity": quantity,
      }),
    );

    return response.statusCode == 200;
  }

  // ➤ Get Cart List
  static Future<List<CartItem>> getCart(int userId) async {
    final url = Uri.parse("$baseUrl/cart/$userId");
    final response = await http.get(url);

    final data = jsonDecode(response.body);

    if (data["success"] == true) {
      return (data["cart"] as List)
          .map((item) => CartItem.fromJson(item))
          .toList();
    }
    return [];
  }

  // ➤ Update Quantity
  static Future<bool> updateQuantity(int cartId, int quantity) async {
    final url = Uri.parse("$baseUrl/cart/update");

    final response = await http.put(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "cart_id": cartId,
        "quantity": quantity,
      }),
    );

    return response.statusCode == 200;
  }

  // ➤ Remove Item
  static Future<bool> removeFromCart(int cartId) async {
    final url = Uri.parse("$baseUrl/cart/remove/$cartId");

    final response = await http.delete(url);

    return response.statusCode == 200;
  }
}
