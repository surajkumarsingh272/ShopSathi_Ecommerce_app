import 'package:flutter/material.dart';
import '../models/address_model.dart';
import '../services/address_service.dart';

class AddressProvider with ChangeNotifier {
  List<AddressModel> addresses = [];

  String name = "";
  String lastName = "";
  String city = "";
  String phone = "";
  String houseNo = "";
  String roadName = "";
  String pinCode = "";
  int? editingId;

  Future fetchAddresses(int userId) async {
    addresses = await AddressService.getAddresses(userId);
    notifyListeners();
  }

  void setAddressData(AddressModel? address) {
    if (address != null) {
      editingId = address.id;
      name = address.name;
      lastName = "singh";
      city = address.city;
      phone = address.mobile;
      houseNo = address.houseNo;
      roadName = address.roadName;
      pinCode = address.pincode;
    } else {
      editingId = null;
      name = "";
      lastName = "";
      city = "";
      phone = "";
      houseNo = "";
      roadName = "";
      pinCode = "";
    }
    notifyListeners();
  }

  Future<bool> addOrUpdateAddress() async {
    Map<String, dynamic> data = {
      "user_id": 1,
      "name": name,
      "last_name": lastName,
      "mobile": phone,
      "pincode": pinCode,
      "state": "Bihar",
      "city": city,
      "house_no": houseNo,
      "road_name": roadName,
      "address_type": "Home",
    };

    if (editingId != null) {
      return await updateAddress(editingId!, data);
    } else {
      return await addNewAddress(data);
    }
  }

  Future<bool> addNewAddress(Map<String, dynamic> data) async {
    return await AddressService.addAddress(data);
  }

  Future<bool> updateAddress(int id, Map<String, dynamic> data) async {
    return await AddressService.updateAddress(id, data);
  }

  Future<bool> delete(int id) async {
    return await AddressService.deleteAddress(id);
  }

  Future<bool> setDefault(int id, int userId) async {
    return await AddressService.setDefault(id, userId);
  }
}
