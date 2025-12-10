import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_sathi_app/screen/order_review_second_screen.dart';

import '../Change_Delivery_Address/add_delivery_screen.dart';

class OrderReviewFirstScreen extends StatefulWidget {
  const OrderReviewFirstScreen({super.key});

  @override
  State<OrderReviewFirstScreen> createState() => _OrderReviewFirstScreenState();
}

class _OrderReviewFirstScreenState extends State<OrderReviewFirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0.5,
        leading: Padding(
          padding: EdgeInsets.all(8),
          child: CircleAvatar(
            backgroundColor: Colors.grey.shade200,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black87),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
        title: const Text("Review Your Order", style: TextStyle(
            fontWeight: FontWeight.w600, color: Colors.black87, fontSize: 18),),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 12,top: 9,right: 12,bottom: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            orderProgressIndicator(2),
            SizedBox(height: 5,),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12.withOpacity(0.05),
                      blurRadius: 6,
                      offset: const Offset(0, 3))
                ],
              ),
              child: Row(
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          "assets/image/first_image.jpeg", width: 120,
                          height: 145,
                          fit: BoxFit.cover,),
                      ),
                      Positioned(
                        right: 8,
                        top: 8,
                        child: CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.white,
                          child: Icon(
                              CupertinoIcons.heart_fill, size: 20, color: Colors
                              .red),
                        ),
                      )
                    ],
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Nike Sportswear Club Fleece",
                            style: TextStyle(fontSize: 16, color: Colors
                                .black87, fontWeight: FontWeight.w600,)),
                        const SizedBox(height: 6),
                        Row(
                          children: const [
                            Text("₹200", style: TextStyle(fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,)),
                            SizedBox(width: 10),
                            Text("₹390",
                              style: TextStyle(fontSize: 13, color: Colors.grey,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text("5% off", style: TextStyle(
                              fontSize: 14, color: Colors.green,))
                          ],
                        ),
                        SizedBox(height: 8),

                        const Text("Size: M   •   Qty: 1",
                            style: TextStyle(color: Colors.grey,
                              fontSize: 13,)),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
            Container(
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
                        child: Icon(
                            Icons.local_shipping_outlined, color: Colors.blue,
                            size: 28),
                      ),
                      const SizedBox(width: 12),
                      const Text("Delivery by Monday, 17 Nov", style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 15),),
                    ],
                  ),
                  SizedBox(height: 14),
                  Text("Nagma khatoon  9328487564",
                    style: TextStyle(fontSize: 14, color: Colors.black87),),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        child: Text(
                          "Chandpur, Naliya, Bihar - 841260",
                          style: TextStyle(color: Colors.black54),
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
                        child: const Text(
                          "Change", style: TextStyle(color: Colors.blue),),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding:
              EdgeInsets.symmetric(horizontal: 16, vertical: 18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.blue.shade100),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Price Details", style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w600,)),
                  Row(
                    children: const [
                      Text("₹900", style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 16),),
                      Icon(Icons.keyboard_arrow_down_rounded),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 100),
          ],
        ),
      ),

      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 4),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Text("₹360", style: TextStyle(fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,)),
                const SizedBox(width: 10),
                Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text(
                    "33% off", style: TextStyle(color: Colors.blue),),
                ),
              ],
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => OrderReviewSecondScreen(),));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding:
                const EdgeInsets.symmetric(horizontal: 35, vertical: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              child: const Text(
                "Continue", style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            )
          ],
        ),
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
            backgroundColor: currentStep == 1 ? Colors.blue : currentStep > 1   ? Colors.blue : Colors.grey,
            child: currentStep > 1
                ? const Icon(Icons.check, color: Colors.white, size: 18)
                : const Text("1",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
          Expanded(
            child: Container(
              height: 3,
              color: currentStep > 1 ? Colors.blue : Colors.grey.shade300,
            ),
          ),
          CircleAvatar(
            radius: 15,
            backgroundColor: currentStep == 2
                ? Colors.blue: currentStep > 2 ? Colors.blue  : Colors.grey,
            child: currentStep > 2 ? const Icon(Icons.check, color: Colors.white, size: 18)
                : const Text("2",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),

          Expanded(
            child: Container(
              height: 3,
              color: currentStep > 2 ? Colors.blue : Colors.grey.shade300,
            ),
          ),

          CircleAvatar(
            radius: 15,
            backgroundColor: currentStep == 3 ? Colors.blue : currentStep > 3   ? Colors.green  : Colors.grey,
            child: currentStep > 3 ? const Icon(Icons.check, color: Colors.white, size: 18)
                : const Text("3", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}