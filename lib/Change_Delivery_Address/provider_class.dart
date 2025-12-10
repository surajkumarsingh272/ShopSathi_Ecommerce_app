import 'package:flutter/material.dart';

import 'address_api_service.dart';
import 'address_model.dart';

class ProviderClass with ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  int? selectedIndex;

  void toggleIndex(int index) {
    if (selectedIndex == index) {
      selectedIndex = null;
    } else {
      selectedIndex = index;
    }
    notifyListeners();
  }

  int? _selectedMethod;
  int? get selectedMethod => _selectedMethod;

  void selectAddress(int value) {
    _selectedMethod = value;
    notifyListeners();
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController houseController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();

  List<AddressModel> addressList = [];
  getAddressData()async{
    var addressData = await AddressApiService.getAddressApiData();
    if(addressData != null){
      addressList=addressData;
      notifyListeners();
    }
  }

  // Future<bool> addProduct(BuildContext context) async {
  //   var data = {
  //     "user_id": 1,
  //     "name": nameController.text,
  //     "last_name": lastNameController.text,
  //     "address_line": addressController.text,
  //     "city": cityController.text,
  //     "contact": phoneController.text,
  //     "house_no": houseController.text,
  //     "state": stateController.text,
  //     "pincode": pinCodeController.text,
  //   };
  //
  //   var response = await AddressApiService.postAddressApiData(data);
  //
  //   if (response != null) {
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Address Added Successfully", style: TextStyle(color: Colors.white)), backgroundColor: Colors.green,),);
  //     getAddressData();
  //     return true;
  //   }
  //
  //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to Add Address"), backgroundColor: Colors.red,),);
  //   return false;
  // }

  Future<bool> addProduct(BuildContext context) async {
    // 🔍 Form Validation
    if (!formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please fill all required fields")),
      );
      return false;
    }

    var data = {
      "user_id": 1,
      "name": nameController.text.trim(),
      "last_name": lastNameController.text.trim(),
      "address_line": addressController.text.trim(),
      "city": cityController.text.trim(),
      "contact": phoneController.text.trim(),
      "house_no": houseController.text.trim(),
      "state": stateController.text.trim(),
      "pincode": pinCodeController.text.trim(),
    };

    var response = await AddressApiService.postAddressApiData(data);
    if (response != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Address Added Successfully",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.green,
        ),
      );
      await getAddressData();
      notifyListeners();
      nameController.clear();
      lastNameController.clear();
      addressController.clear();
      cityController.clear();
      phoneController.clear();
      houseController.clear();
      stateController.clear();
      pinCodeController.clear();
      return true;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Failed to Add Address"),
        backgroundColor: Colors.red,
      ),
    );

    return false;
  }

}
