import 'package:flutter/material.dart';
import 'edit_address_screen.dart';

class SavedAddressesScreen extends StatelessWidget {
  const SavedAddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample addresses
    final addresses = [
      {
        "type": "Home",
        "name": "John Doe",
        "phone": "+91 9876543210",
        "address": "123, MG Road, Bangalore, Karnataka, 560001"
      },
      {
        "type": "Work",
        "name": "John Doe",
        "phone": "+91 9876543210",
        "address": "456, Brigade Road, Bangalore, Karnataka, 560001"
      },
      {
        "type": "Other",
        "name": "John Doe",
        "phone": "+91 9876543210",
        "address": "789, Whitefield, Bangalore, Karnataka, 560066"
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xfff3f4f7),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Saved Addresses",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(18),
        itemCount: addresses.length,
        itemBuilder: (context, index) {
          final address = addresses[index];
          return addressCard(
            context: context, // context pass karna zaroori hai
            type: address["type"]!,
            name: address["name"]!,
            phone: address["phone"]!,
            address: address["address"]!,
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add New Address Logic
        },
        label: const Text("Add New Address"),
        icon: const Icon(Icons.add_location_alt),
        backgroundColor: Colors.deepPurple,
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }

  Widget addressCard({
    required BuildContext context, // context pass karna zaroori hai
    required String type,
    required String name,
    required String phone,
    required String address,
  }) {
    Color typeColor;
    switch (type) {
      case "Home":
        typeColor = Colors.green;
        break;
      case "Work":
        typeColor = Colors.blue;
        break;
      default:
        typeColor = Colors.orange;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.06),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Type + Edit/Delete
          Row(
            children: [
              Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [typeColor.withOpacity(0.8), typeColor],
                  ),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Text(
                  type,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  // Navigator push to EditAddressScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditAddressScreen(
                        type: type,
                        name: name,
                        phone: phone,
                        address: address,
                      ),
                    ),
                  );
                },
                borderRadius: BorderRadius.circular(12),
                child: const Padding(
                  padding: EdgeInsets.all(6.0),
                  child: Icon(Icons.edit, color: Colors.blue, size: 22),
                ),
              ),
              const SizedBox(width: 8),
              InkWell(
                onTap: () {
                  // Delete Address Logic
                },
                borderRadius: BorderRadius.circular(12),
                child: const Padding(
                  padding: EdgeInsets.all(6.0),
                  child: Icon(Icons.delete, color: Colors.redAccent, size: 22),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            name,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16, letterSpacing: 0.3),
          ),
          const SizedBox(height: 4),
          Text(
            phone,
            style: const TextStyle(color: Colors.black54, fontSize: 14),
          ),
          const SizedBox(height: 8),
          Text(
            address,
            style: const TextStyle(
                color: Colors.black54, fontSize: 14, height: 1.4),
          ),
        ],
      ),
    );
  }
}
