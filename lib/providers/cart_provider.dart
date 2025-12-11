import 'package:flutter/material.dart';
import '../models/cart_model.dart';
import '../services/cart_api.dart';

class CartProvider with ChangeNotifier {
  List<CartItem> items = [];

  Future<void> fetchCart(int userId) async {
    print("FETCH CART CALLED");
    items.clear();
    final data = await CartApi.getCart(userId);
    items.addAll(data);
    notifyListeners();
  }

  Future<void> addToCart({
    required int userId,
    required int productId,
    int? colorId,
    required int quantity,
  }) async {
    await CartApi.addToCart(
      userId: userId,
      productId: productId,
      colorId: colorId,
      quantity: quantity,
    );

    await fetchCart(userId);
  }

  Future<void> updateQuantity(int cartId, int qty, int userId) async {
    await CartApi.updateQuantity(cartId, qty);
    await fetchCart(userId);
  }

  Future<void> removeItem(int cartId, int userId) async {
    await CartApi.removeFromCart(cartId);
    await fetchCart(userId);
  }
  double get totalPrice {
    double total = 0;
    for (var item in items) {
      total += item.newPrice * item.quantity;
    }
    return total;
  }

  double get totalDiscount {
    double discount = 0;
    for (var item in items) {
      discount += (item.oldPrice - item.newPrice) * item.quantity;
    }
    return discount;
  }

  double get deliveryCharge => 50;
  double get grandTotal => totalPrice - totalDiscount + deliveryCharge;

}
