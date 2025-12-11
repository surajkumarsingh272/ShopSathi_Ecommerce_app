import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/address_model.dart';

class AddressService {
  static const String baseUrl = "http://10.170.190.64:3000";
  // Add Address
  static Future<bool> addAddress(Map<String, dynamic> data) async {
    final url = Uri.parse("$baseUrl/address/add");
    final res = await http.post(url, body: data);

    final body = jsonDecode(res.body);
    return body["success"] == true;
  }

  // Get All Addresses
  static Future<List<AddressModel>> getAddresses(int userId) async {
    final url = Uri.parse("$baseUrl/address/all/$userId");
    final res = await http.get(url);

    final body = jsonDecode(res.body);

    if (body["success"] == true) {
      return (body["data"] as List)
          .map((e) => AddressModel.fromJson(e))
          .toList();
    }
    return [];
  }

  // Delete Address
  static Future<bool> deleteAddress(int id) async {
    final url = Uri.parse("$baseUrl/address/delete/$id");
    final res = await http.delete(url);

    final body = jsonDecode(res.body);
    return body["success"] == true;
  }

  // Set Default Address
  static Future<bool> setDefault(int id, int userId) async {
    final url = Uri.parse("$baseUrl/address/set-default");

    final res = await http.post(url, body: {
      "id": id.toString(),
      "user_id": userId.toString(),
    });

    final body = jsonDecode(res.body);
    return body["success"] == true;
  }

  // Update Address
  static Future<bool> updateAddress(int id, Map<String, dynamic> data) async {
    final url = Uri.parse("$baseUrl/address/update/$id");

    final res = await http.put(url, body: data);

    final body = jsonDecode(res.body);
    return body["success"] == true;
  }
}
