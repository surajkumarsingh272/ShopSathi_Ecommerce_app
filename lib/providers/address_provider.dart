import 'package:flutter/material.dart';
import '../models/address_model.dart';
import '../services/address_service.dart';

class AddressProvider with ChangeNotifier {

  List<AddressModel> addresses = [];

  Future fetchAddresses(int userId) async {
    addresses = await AddressService.getAddresses(userId);
    notifyListeners();
  }

  Future addNewAddress(Map<String, dynamic> data) async {
    return await AddressService.addAddress(data);
  }

  Future delete(int id) async {
    return await AddressService.deleteAddress(id);
  }

  Future setDefault(int id, int userId) async {
    return await AddressService.setDefault(id, userId);
  }

  Future updateAddress(int id, Map<String, dynamic> data) async {
    return await AddressService.updateAddress(id, data);
  }
}
