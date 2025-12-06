import 'package:flutter/material.dart';

class EditAddressScreen extends StatefulWidget {
  final String type;
  final String name;
  final String phone;
  final String address;

  const EditAddressScreen({
    super.key,
    required this.type,
    required this.name,
    required this.phone,
    required this.address,
  });

  @override
  State<EditAddressScreen> createState() => _EditAddressScreenState();
}

class _EditAddressScreenState extends State<EditAddressScreen> {

  var nameController=TextEditingController();
  var phoneController=TextEditingController();
  var addressController=TextEditingController();
   String? selectedType;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.name);
    phoneController = TextEditingController(text: widget.phone);
    addressController = TextEditingController(text: widget.address);
    selectedType = widget.type;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff3f4f7),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Text(
          "Edit Address",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 120),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Address Type",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: ["Home", "Work", "Other"].map((type) {
                      bool isSelected = selectedType == type;
                      Color color;
                      switch (type) {
                        case "Home":
                          color = Colors.green;
                          break;
                        case "Work":
                          color = Colors.blue;
                          break;
                        default:
                          color = Colors.orange;
                      }
                      return Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedType = type;
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 250),
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            decoration: BoxDecoration(
                              gradient: isSelected
                                  ? LinearGradient(
                                colors: [color.withOpacity(0.8), color],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              )
                                  : null,
                              color: isSelected ? null : Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: isSelected ? color : Colors.grey.shade300,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12.withOpacity(0.03),
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                )
                              ],
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              type,
                              style: TextStyle(
                                color: isSelected ? Colors.white : color,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 25),
                  _buildTextField("Full Name", nameController, Icons.person),
                  const SizedBox(height: 18),
                  _buildTextField("Phone Number", phoneController, Icons.phone,
                      keyboardType: TextInputType.phone),
                  const SizedBox(height: 18),
                  _buildTextField("Address", addressController, Icons.location_on,
                      maxLines: 4),
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12.withOpacity(0.2),
                        blurRadius: 12,
                        offset: const Offset(0, 6))
                  ],
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, {
                      "type": selectedType,
                      "name": nameController.text,
                      "phone": phoneController.text,
                      "address": addressController.text,
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    "Save Address",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller,
      IconData icon,
      {int maxLines = 1, TextInputType keyboardType = TextInputType.text}) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.deepPurple),
        labelText: label,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        filled: true,
        fillColor: Colors.white,
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.deepPurple, width: 1.5),
        ),
      ),
    );
  }
}
