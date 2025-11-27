import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_sathi_app/Change%20Delivery%20Address/provider_class.dart';

class AddDeliveryScreen extends StatefulWidget {
  const AddDeliveryScreen({super.key});

  @override
  State<AddDeliveryScreen> createState() => _AddDeliveryScreenState();
}

class _AddDeliveryScreenState extends State<AddDeliveryScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProviderClass>(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: provider.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),

                const Text(
                  "Please Enter Your Details",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 20),

                // Name
                const Text("Name", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                const SizedBox(height: 10),
                TextFormField(
                  controller: provider.nameController,
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
                  validator: (v) {
                    if (v == null || v.isEmpty) return "Enter name";
                    return null;
                  },
                ),

                const SizedBox(height: 10),

                // Last Name
                const Text("Last Name", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                const SizedBox(height: 10),
                TextFormField(
                  controller: provider.lastNameController,
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
                  validator: (v) {
                    if (v == null || v.isEmpty) return "Enter last name";
                    return null;
                  },
                ),

                const SizedBox(height: 10),

                // City
                const Text("City", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                const SizedBox(height: 10),
                TextFormField(
                  controller: provider.cityController,
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
                  validator: (v) {
                    if (v == null || v.isEmpty) return "Enter city";
                    return null;
                  },
                ),

                const SizedBox(height: 10),

                // Phone Number
                const Text("Number", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                const SizedBox(height: 10),
                TextFormField(
                  controller: provider.phoneController,
                  keyboardType: TextInputType.number,
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

                // HOUSE + APARTMENT
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("House No", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: 150,
                          child: TextFormField(
                            controller: provider.houseController,
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
                            validator: (v) {
                              if (v == null || v.isEmpty) return "Required";
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(width: 20),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Apartment No", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: 150,
                          child: TextFormField(
                            controller: provider.apartmentController,
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
                            validator: (v) {
                              if (v == null || v.isEmpty) return "Required";
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                // Pin Code
                const Text("Pin Code", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                const SizedBox(height: 10),
                TextFormField(
                  controller: provider.pinCodeController,
                  keyboardType: TextInputType.number,
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
                  validator: (v) {
                    if (v == null || v.isEmpty) return "Enter pin code";
                    if (v.length != 6) return "Enter valid pin";
                    return null;
                  },
                ),

                const SizedBox(height: 25),

                // Submit Button
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: MaterialButton(
                    onPressed: () async {
                      if (provider.formKey.currentState!.validate()) {
                        final success = await provider.addAndUpdateData(context);
                        if (success) {
                          Navigator.pop(context);
                        }
                      }
                    },
                    color: Colors.blueAccent,
                    height: 50,
                    minWidth: 400,
                    child: const Text(
                      "Submit",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
