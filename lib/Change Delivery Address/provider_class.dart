import 'package:flutter/material.dart';
import 'db_helper.dart';

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
  TextEditingController cityController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController houseController = TextEditingController();
  TextEditingController apartmentController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();

  List<Map<String, dynamic>> list = [];
  int? editIndex;

  Future<void> fetchData() async {
    try {
      final data = await DBHelper.getData();
      list = data;
      notifyListeners();
    } catch (e) {
      debugPrint("fetchData error: $e");
    }
  }

  Future<bool> addAndUpdateData(BuildContext context) async {
    if (!formKey.currentState!.validate()) return false;

    try {
      if (editIndex != null) {
        await DBHelper.updateData(
          editIndex!,
          nameController.text,
          lastNameController.text,
          cityController.text,
          phoneController.text,
          houseController.text,
          apartmentController.text,
          pinCodeController.text,
        );
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Updated successfully")));
      } else {
        await DBHelper.insertData(
          nameController.text,
          lastNameController.text,
          cityController.text,
          phoneController.text,
          houseController.text,
          apartmentController.text,
          pinCodeController.text,
        );
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Added successfully")));
      }

      await fetchData(); // refresh list
      clearField();
      return true;
    } catch (e) {
      debugPrint("addAndUpdateData error: $e");
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Operation failed")));
      return false;
    }
  }

  void initialData(int index) {
    editIndex = list[index]['id'] as int?;
    nameController.text = list[index]['name'] ?? '';
    lastNameController.text = list[index]['lastName'] ?? '';
    cityController.text = list[index]['city'] ?? '';
    phoneController.text = list[index]['phone'] ?? '';
    houseController.text = list[index]['house'] ?? '';
    apartmentController.text = list[index]['apartment'] ?? '';
    pinCodeController.text = list[index]['pinCode'] ?? '';
    notifyListeners();
  }

  void clearField() {
    editIndex = null;
    nameController.clear();
    lastNameController.clear();
    cityController.clear();
    phoneController.clear();
    houseController.clear();
    apartmentController.clear();
    pinCodeController.clear();
  }

  Future<void> deleteData(int id, BuildContext context) async {
    await DBHelper.deleteData(id);
    await fetchData();
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Deleted")));
  }
}
