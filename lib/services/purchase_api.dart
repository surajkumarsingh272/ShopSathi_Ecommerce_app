import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/purchase_history_modal.dart';


class PurchaseApi {
  static const String baseUrl = "http://10.170.190.64:3000";
  static Future<List<PurchaseHistoryModel>> fetchPurchaseHistory(String userId) async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/history/$userId"));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List historyJson = data['history'];
        return historyJson
            .map((json) => PurchaseHistoryModel.fromJson(json))
            .toList();
      } else {
        throw Exception("Failed to load purchase history");
      }
    } catch (e) {
      throw Exception("Error fetching purchase history: $e");
    }
  }
}
