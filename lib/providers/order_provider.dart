import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/order_model.dart';
import '../models/order_tracking_model.dart';
import '../services/order_api.dart';

class OrderProvider with ChangeNotifier {
  List<OrderModel> orders = [];
  List<OrderTrackingModel> tracking = [];

  bool isLoading = false;

  Future<void> loadOrders() async {
    isLoading = true;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("accessToken");

    if (token == null) return;

    orders = await OrderApi.fetchOrders(token);

    isLoading = false;
    notifyListeners();
  }

  Future<void> loadTracking(int orderId) async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("accessToken");

    if (token == null) return;

    tracking = await OrderApi.trackOrder(token, orderId);

    notifyListeners();
  }
}
