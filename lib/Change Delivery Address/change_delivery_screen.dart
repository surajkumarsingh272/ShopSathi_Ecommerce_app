import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_sathi_app/Change%20Delivery%20Address/payment_screen.dart';
import 'package:shop_sathi_app/Change%20Delivery%20Address/provider_class.dart';

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
    Provider.of<ProviderClass>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProviderClass>(context);
    final addressProvider = Provider.of<ProviderClass>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Change Delivery Address",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
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
                ClipRRect( borderRadius: BorderRadius.circular(30),
                  child: Container(height: 45, width: 45, color: Colors.blueAccent,
                      child: Icon(Icons.arrow_back,color: Colors.white,)),
                ),
                SizedBox(width: 10),
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 45,
                    width: 45,
                    color: Colors.blueAccent,
                    child: const Icon(Icons.keyboard_voice_outlined, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),

          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
                final item = provider.list[index];
                bool isExpanded = addressProvider.selectedIndex == index;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: InkWell(
                      onTap: () {
                        addressProvider.toggleIndex(index);
                      },
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(
                              "${item['name']} ${item['lastName']}",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            subtitle: Text("City: ${item['city']}"),
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
                            height: isExpanded ? 200 : 0,
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: SingleChildScrollView(
                              child: isExpanded ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Phone: ${item['phone']}"),
                                  Text("House: ${item['house']}"),
                                  Text("Apartment: ${item['apartment']}"),
                                  Text("Pincode: ${item['pinCode']}"),
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
                                      provider.initialData(index);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => AddDeliveryScreen(),
                                        ),
                                      );
                                    },
                                  ),

                                  SizedBox(height: 20),
                                  MaterialButton(onPressed: () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PaymentMethodScreen(),),);},
                                    height: 50, minWidth: double.infinity, color: Colors.blueAccent,
                                    child: Text("Delivery to this Address", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                                  ),
                                ],
                              ) : null,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
            },
              childCount: provider.list.length,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () {
          provider.clearField();
          Navigator.push(context, MaterialPageRoute(builder: (_) => const AddDeliveryScreen()));
        },
      ),
    );
  }
}
