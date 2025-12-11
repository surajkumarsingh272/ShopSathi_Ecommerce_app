import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../models/order_model.dart';
import '../../models/order_tracking_model.dart';

class OrderApi {
  static const String baseUrl = "http://10.170.190.64:3000";
  static Future<List<OrderModel>> fetchOrders(String token) async {
    final url = Uri.parse("$baseUrl/api/orders");
    final response = await http.get(url, headers: {
      "Authorization": token,
    });

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List list = data["orders"];

      return list.map((e) => OrderModel.fromJson(e)).toList();
    }

    return [];
  }

  static Future<List<OrderTrackingModel>> trackOrder(
      String token, int orderId) async {

    final url = Uri.parse("$baseUrl/api/orders/track/$orderId");

    final response = await http.get(url, headers: {
      "Authorization": token,
    });

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List list = data["tracking"];

      return list.map((e) => OrderTrackingModel.fromJson(e)).toList();
    }

    return [];
  }
}
