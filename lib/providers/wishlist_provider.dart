import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/wishlist_item.dart';
import '../services/wishlist_service.dart';
import 'auth_provider.dart';

class WishlistProvider with ChangeNotifier {
  List<WishlistItem> wishlist = [];

  // ----------------
  // LOAD WISHLIST
  // ----------------
  Future<void> loadWishlist(int userId, String token) async {
    wishlist = await WishlistService.fetchWishlist(userId, token);
    notifyListeners();
  }

  // ----------------
  // ADD ITEM
  // ----------------
  Future<bool> addWishlistItem(int userId, int productId, String token) async {
    bool success = await WishlistService.addToWishlist(userId, productId, token);
    if (success) {
      await loadWishlist(userId, token);
    }
    return success;
  }


  // ----------------
  // REMOVE ITEM
  // ----------------
  Future<bool> removeWishlistItem(int wishlistId, String token) async {
    bool success = await WishlistService.removeFromWishlist(wishlistId, token);
    if (success) {
      wishlist.removeWhere((item) => item.wishlistId == wishlistId);
      notifyListeners();
    }
    return success;
  }

  // ----------------
  // CHECK ITEM
  // ----------------
  bool isInWishlist(int productId) {
    return wishlist.any((item) => item.productId == productId);
  }


  Future<void> toggleWishlist(int userId, int productId, AuthProvider authProvider) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("accessToken");
    String? refreshToken = prefs.getString("refreshToken");

    if (token == null && refreshToken != null) {
      final newTokens = await authProvider.refreshToken(refreshToken);
      token = newTokens["accessToken"];
      await prefs.setString("accessToken", token!);
    }

    if (token == null) {
      print("No valid token available, cannot toggle wishlist.");
      return;
    }

    final WishlistItem? existingItem =
    wishlist.firstWhereOrNull((item) => item.productId == productId);

    bool success;
    if (existingItem != null) {
      success = await removeWishlistItem(existingItem.wishlistId, token);
    } else {
      success = await addWishlistItem(userId, productId, token);
    }

    if (!success && refreshToken != null) {
      final newTokens = await authProvider.refreshToken(refreshToken);
      token = newTokens["accessToken"];
      await prefs.setString("accessToken", token!);

      if (existingItem != null) {
        await removeWishlistItem(existingItem.wishlistId, token);
      } else {
        await addWishlistItem(userId, productId, token);
      }
    }
  }
}

