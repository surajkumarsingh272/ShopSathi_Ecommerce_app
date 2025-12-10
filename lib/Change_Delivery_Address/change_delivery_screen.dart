import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'payment_screen.dart';
import 'provider_class.dart';

import 'add_delivery_screen.dart';

class ChangeDeliveryScreen extends StatefulWidget {
  const ChangeDeliveryScreen({super.key});

  @override
  State<ChangeDeliveryScreen> createState() => _ChangeDeliveryScreenState();
}

class _ChangeDeliveryScreenState extends State<ChangeDeliveryScreen> {
  @override
  void initState() {
    super.initState();
    final providers = Provider.of<ProviderClass>(context,listen: false);
    providers.getAddressData();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProviderClass>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Change Delivery Address",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            elevation: 2,
            pinned: true,
            automaticallyImplyLeading: false,
            toolbarHeight: 60,
            title: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    height: 45,
                    width: 45,
                    color: Colors.blueAccent,
                    child: Icon(Icons.arrow_back, color: Colors.white),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: SizedBox(
                    height: 45,
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search, size: 20),
                        hintText: "Search address by name",
                        hintStyle: TextStyle(fontSize: 13),
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
                SizedBox(width: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 45,
                    width: 45,
                    color: Colors.blueAccent,
                    child: const Icon(
                      Icons.keyboard_voice_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),

          SliverList(
            delegate: SliverChildBuilderDelegate(childCount: provider.addressList.length,(context, index) {
              final address = provider.addressList[index];
              bool isExpanded = provider.selectedIndex == index;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: InkWell(
                    onTap: () {
                      provider.toggleIndex(index);
                    },
                    child: Column(
                      children: [
                        ListTile(contentPadding: EdgeInsets.only(left: 15),
                          title: Text(
                            "${address.name} ${address.lastName}",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${address.addressLine} ${address.city} ${address.state}"),
                              Text("${address.state} ${address.pincode}"),
                            ],
                          ),
                          trailing: Radio(
                            value: index,
                            groupValue: provider.selectedIndex,
                            onChanged: (val) {
                              provider.toggleIndex(index);
                            },
                            activeColor: Colors.blueAccent,
                          ),
                        ),
                        AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          height: isExpanded ? 150 : 0,
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: SingleChildScrollView(
                            child:
                                isExpanded
                                    ? Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("${address.contactNo}"),
                                        Text("House No:${address.houseNo}"),
                                        SizedBox(height: 10),
                                        GestureDetector(
                                          child: Text(
                                            "Edit",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              color: Colors.blueAccent,
                                            ),
                                          ),
                                          onTap: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => AddDeliveryScreen(),),);
                                          },
                                        ),

                                        SizedBox(height: 20),
                                        MaterialButton(
                                          onPressed: () {
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder:
                                                    (context) =>
                                                        PaymentMethodScreen(),
                                              ),
                                            );
                                          },
                                          height: 50,
                                          minWidth: double.infinity,
                                          color: Colors.blueAccent,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                          child: Text(
                                            "Delivery to this Address",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                    : null,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        child: Icon(Icons.add, color: Colors.white),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => AddDeliveryScreen()),
          );

          // Refresh the address list after returning
          final provider = Provider.of<ProviderClass>(context, listen: false);
          await provider.getAddressData();
        },
      ),

    );
  }
}
