import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Change Delivery Address/add_delivery_screen.dart';
import '../Change Delivery Address/change_delivery_screen.dart';

class OrderReviewSecondScreen extends StatefulWidget {
  const OrderReviewSecondScreen({super.key});

  @override
  State<OrderReviewSecondScreen> createState() => _OrderReviewSecondScreenState();
}

class _OrderReviewSecondScreenState extends State<OrderReviewSecondScreen> {
  int currentStep = 2;
  bool isPriceExpanded = false;
  int quantity = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0.5,
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: CircleAvatar(
            backgroundColor: Colors.grey.shade200,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black87),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
        title: const Text(  "Review Your Order",  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black87, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        padding:  EdgeInsets.only(left: 12, top: 9, right: 12, bottom: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            orderProgressIndicator(currentStep),
            const SizedBox(height: 10),
            productCard(),
            const SizedBox(height: 10),
            Card(
              elevation: 1,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset("assets/image/first_image.jpeg",fit: BoxFit.cover,),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Musk Ai Taharan", style: TextStyle( fontSize: 16,   fontWeight: FontWeight.bold, color: Colors.black87),),
                          const SizedBox(height: 4),
                          const Text("Rasasi Perfumes", style: TextStyle(fontSize: 13, color: Colors.black54),),
                          const SizedBox(height: 6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text("₹3000", style: TextStyle( fontSize: 16,fontWeight: FontWeight.bold,  color: Colors.black87),
                                  ),
                                  SizedBox(height: 2),
                                  Text( "₹3500", style: TextStyle( fontSize: 12,color: Colors.grey,  decoration: TextDecoration.lineThrough),),
                                  SizedBox(height: 2),
                                  Text( "14% off",  style: TextStyle(fontSize: 12, color: Colors.green),),
                                ],
                              ),

                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        if (quantity > 1) {
                                          setState(() {
                                            quantity--;
                                          });
                                        }
                                      },
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        child: const Icon(Icons.remove, size: 20, color: Colors.blue),
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 12),
                                      child: Text("$quantity",style: const TextStyle( fontSize: 16, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          quantity++;
                                        });
                                      },
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        child:  Icon(Icons.add, size: 20, color: Colors.blue),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            deliveryCard(),
            const SizedBox(height: 20),
            priceDetailsCard(),
            const SizedBox(height: 100),
          ],
        ),
      ),
      bottomNavigationBar: bottomNavBar(),
    );
  }


  Widget productCard() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset( "assets/image/first_image.jpeg",    width: 120,  height: 145, fit: BoxFit.cover,),
              ),
              Positioned(
                right: 8,
                top: 8,
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.white,
                  child: Icon(CupertinoIcons.heart_fill, size: 20, color: Colors.red),
                ),
              )
            ],
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text( "Nike Sportswear Club Fleece", style: TextStyle(fontSize: 16, color: Colors.black87, fontWeight: FontWeight.w600),),
                const SizedBox(height: 6),
                Row(
                  children: const [
                    Text("₹200", style: TextStyle( fontSize: 17, fontWeight: FontWeight.bold, color: Colors.green),),
                    SizedBox(width: 10),
                    Text( "₹390",  style: TextStyle( fontSize: 13, color: Colors.grey, decoration: TextDecoration.lineThrough),),
                    SizedBox(width: 10),
                    Text( "5% off",style: TextStyle(fontSize: 14, color: Colors.green),),
                  ],
                ),
                const SizedBox(height: 8),
                const Text("Size: M   •   Qty: 1", style: TextStyle(color: Colors.grey, fontSize: 13),),
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget deliveryCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.blue.shade100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: Colors.blue.shade50,
                child: Icon(Icons.local_shipping_outlined, color: Colors.blue, size: 28),
              ),
              const SizedBox(width: 12),
              const Text( "Delivery by Monday, 17 Nov",style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text("Nagma khatoon  9328487564", style: TextStyle(fontSize: 14, color: Colors.black87),),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                child: Text( "Chandpur, Naliya, Bihar - 841260", style: TextStyle(color: Colors.black54),
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AddDeliveryScreen(),));
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.blue),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text("Change", style: TextStyle(color: Colors.blue)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget priceDetailsCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.blue.shade100),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Price Details", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
              Row(
                children: [
                  const Text("₹900",   style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),),
                  const SizedBox(width: 4),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isPriceExpanded = !isPriceExpanded;
                      });
                    },
                    child: Icon(isPriceExpanded? Icons.keyboard_arrow_up: Icons.keyboard_arrow_down),
                  ),
                ],
              ),
            ],
          ),
          if (isPriceExpanded)
            Container(
              margin: const EdgeInsets.only(top: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Product Price: ₹500"),
                  Text("Discount: ₹140", style: TextStyle(color: Colors.green)),
                  Text("Delivery Charge: ₹40"),
                  Divider(color: Colors.grey),
                  Text("Total: ₹900", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget bottomNavBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Text("₹360", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87),),
              const SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Text("33% off", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ChangeDeliveryScreen(),));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            child: const Text("Continue", style: TextStyle(fontSize: 16, color: Colors.white)),
          )
        ],
      ),
    );
  }

  Widget orderProgressIndicator(int currentStep) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        children: [
          CircleAvatar(
            radius: 15,
            backgroundColor: currentStep >= 1 ? Colors.blue : Colors.grey.shade300,
            child: currentStep > 1
                ? const Icon(Icons.check, color: Colors.white, size: 18)
                : const Text("1",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: Container(
              height: 3,
              color: currentStep > 1 ? Colors.blue : Colors.grey.shade300,
            ),
          ),
          CircleAvatar(
            radius: 15,
            backgroundColor: currentStep >= 2 ? Colors.blue : Colors.grey.shade300,
            child: currentStep > 2
                ? const Icon(Icons.check, color: Colors.white, size: 18)
                : const Text("2",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: Container(
              height: 3,
              color: currentStep > 2 ? Colors.blue : Colors.grey.shade300,
            ),
          ),
          CircleAvatar(
            radius: 15,
            backgroundColor: currentStep >= 3 ? Colors.blue : Colors.grey.shade300,
            child: currentStep > 3
                ? const Icon(Icons.check, color: Colors.white, size: 18)
                : const Text("3",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

}
