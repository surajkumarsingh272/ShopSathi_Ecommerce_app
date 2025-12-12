import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/address_provider.dart';
import 'add_delivery_screen.dart';

class ChangeDeliveryScreen extends StatefulWidget {
  const ChangeDeliveryScreen({super.key});

  @override
  State<ChangeDeliveryScreen> createState() => _ChangeDeliveryScreenState();
}

class _ChangeDeliveryScreenState extends State<ChangeDeliveryScreen> {
  int selectedIndex = -1;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<AddressProvider>(context, listen: false).fetchAddresses(1);
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AddressProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: provider.addresses.isEmpty
          ? const Center(child: Text("No Address Found"))
          : CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            pinned: true,
            automaticallyImplyLeading: false,
            elevation: 2,
            title: Row(
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: SizedBox(
                    height: 45,
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search, size: 20),
                        hintText: "Search address by name",
                        hintStyle: const TextStyle(fontSize: 13),
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.keyboard_voice_outlined, color: Colors.white),
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                final item = provider.addresses[index];
                final isExpanded = selectedIndex == index;

                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(item.name, style: const TextStyle(fontWeight: FontWeight.w600)),
                          subtitle: Text("City: ${item.city}"),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                                color: Colors.blueAccent,
                              ),
                              const SizedBox(width: 8),
                              GestureDetector(
                                onTap: () async {
                                  bool confirm = await showDialog(
                                    context: context,
                                    builder: (_) => AlertDialog(
                                      title: const Text("Confirm Delete"),
                                      content: const Text("Are you sure you want to delete this address?"),
                                      actions: [
                                        TextButton(
                                            onPressed: () => Navigator.pop(context, false),
                                            child: const Text("Cancel")),
                                        TextButton(
                                            onPressed: () => Navigator.pop(context, true),
                                            child: const Text("Delete", style: TextStyle(color: Colors.red))),
                                      ],
                                    ),
                                  );
                                  if (confirm) {
                                    bool success = await provider.delete(item.id);
                                    if (success) {
                                      await provider.fetchAddresses(1);
                                    } else {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(content: Text("Failed to delete address")),
                                      );
                                    }
                                  }
                                },
                                child: const Icon(Icons.delete, color: Colors.red),
                              ),
                            ],
                          ),
                          onTap: () {
                            setState(() {
                              selectedIndex = selectedIndex == index ? -1 : index;
                            });
                          },
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          height: isExpanded ? 200 : 0,
                          child: isExpanded
                              ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Phone: ${item.mobile}"),
                                Text("House: ${item.houseNo}"),
                                Text("Road: ${item.roadName}"),
                                Text("Pincode: ${item.pincode}"),
                                const SizedBox(height: 10),
                                GestureDetector(
                                  child: const Text(
                                    "Edit",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blueAccent),
                                  ),
                                  onTap: () {
                                    provider.setAddressData(item);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (_) => const AddDeliveryScreen()),
                                    );
                                  },
                                ),
                                const SizedBox(height: 20),
                                MaterialButton(
                                  onPressed: () {
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(builder: (_) => const PaymentMethodScreen()),
                                    // );
                                  },
                                  height: 50,
                                  minWidth: double.infinity,
                                  color: Colors.blueAccent,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                  child: const Text(
                                    "Deliver to this Address",
                                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          )
                              : null,
                        ),
                      ],
                    ),
                  ),
                );
              },
              childCount: provider.addresses.length,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () {
          provider.setAddressData(null);
          Navigator.push(context, MaterialPageRoute(builder: (_) => const AddDeliveryScreen()));
        },
      ),
    );
  }
}
