import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/address_provider.dart';

class AddDeliveryScreen extends StatelessWidget {
  const AddDeliveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AddressProvider>(context);
    final formKey = GlobalKey<FormState>();
    final isEdit = provider.editingId != null;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                Text(
                  isEdit ? "Edit Your Address" : "Please Enter Your Details",
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),

                // Name
                const Text("Name", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                const SizedBox(height: 10),
                TextFormField(
                  initialValue: provider.name,
                  onChanged: (v) => provider.name = v,
                  decoration: InputDecoration(
                    hintText: "Enter Your Name",
                    prefixIcon: const Icon(Icons.person, color: Colors.blueAccent),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey.shade300, width: 1.4),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey.shade300, width: 1.4),
                    ),
                  ),
                  validator: (v) => (v == null || v.isEmpty) ? "Enter name" : null,
                ),

                const SizedBox(height: 10),
                const Text("Last Name", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                const SizedBox(height: 10),
                TextFormField(
                  initialValue: provider.lastName,
                  onChanged: (v) => provider.lastName = v,
                  decoration: InputDecoration(
                    hintText: "Enter Your Last Name",
                    prefixIcon: const Icon(Icons.person, color: Colors.blueAccent),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey.shade300, width: 1.4),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey.shade300, width: 1.4),
                    ),
                  ),
                ),

                const SizedBox(height: 10),
                const Text("City", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                const SizedBox(height: 10),
                TextFormField(
                  initialValue: provider.city,
                  onChanged: (v) => provider.city = v,
                  decoration: InputDecoration(
                    hintText: "Enter Your City",
                    prefixIcon: const Icon(Icons.location_city, color: Colors.blueAccent),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey.shade300, width: 1.4),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey.shade300, width: 1.4),
                    ),
                  ),
                  validator: (v) => (v == null || v.isEmpty) ? "Enter city" : null,
                ),

                const SizedBox(height: 10),
                const Text("Phone", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                const SizedBox(height: 10),
                TextFormField(
                  initialValue: provider.phone,
                  keyboardType: TextInputType.number,
                  onChanged: (v) => provider.phone = v,
                  decoration: InputDecoration(
                    hintText: "Enter Your Phone Number",
                    prefixIcon: const Icon(Icons.call, color: Colors.blueAccent),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey.shade300, width: 1.4),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey.shade300, width: 1.4),
                    ),
                  ),
                  validator: (v) {
                    if (v == null || v.isEmpty) return "Enter phone number";
                    if (v.length != 10) return "Enter valid number";
                    return null;
                  },
                ),

                const SizedBox(height: 10),
                Row(
                  children: [
                    // House No
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "House No",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            initialValue: provider.houseNo,
                            onChanged: (v) => provider.houseNo = v,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey.shade200,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: Colors.grey.shade300, width: 1.4),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: Colors.grey.shade300, width: 1.4),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20), // Dono fields ke beech gap
                    // Apartment No
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Apartment No",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            initialValue: provider.roadName,
                            onChanged: (v) => provider.roadName = v,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey.shade200,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: Colors.grey.shade300, width: 1.4),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: Colors.grey.shade300, width: 1.4),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),
                const Text("Pin Code", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                const SizedBox(height: 10),
                TextFormField(
                  initialValue: provider.pinCode,
                  keyboardType: TextInputType.number,
                  onChanged: (v) => provider.pinCode = v,
                  decoration: InputDecoration(
                    hintText: "Enter Your Pin Code",
                    prefixIcon: const Icon(Icons.password, color: Colors.blueAccent),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey.shade300, width: 1.4),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey.shade300, width: 1.4),
                    ),
                  ),
                ),

                const SizedBox(height: 25),
                MaterialButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        bool success = await provider.addOrUpdateAddress();
                        if (success) {
                          await provider.fetchAddresses(1);
                          Navigator.pop(context);
                        }
                      }
                    },
                  color: Colors.blueAccent,
                  height: 50,
                  minWidth: double.infinity,
                  child: Text(isEdit ? "Update" : "Submit", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
