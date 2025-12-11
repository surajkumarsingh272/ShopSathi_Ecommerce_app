import 'package:flutter/material.dart';
import '../models/purchase_history_modal.dart';
import '../services/purchase_api.dart';

class PurchaseProvider with ChangeNotifier {
  List<PurchaseHistoryModel> history = [];
  bool isLoading = false;

  Future<void> loadPurchaseHistory(String userId) async {
    isLoading = true;
    notifyListeners();

    try {
      history = await PurchaseApi.fetchPurchaseHistory(userId);
    } catch (e) {
      debugPrint("Provider error: $e");
      history = [];
    }

    isLoading = false;
    notifyListeners();
  }
}
