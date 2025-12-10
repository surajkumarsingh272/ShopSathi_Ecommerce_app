import 'package:flutter/material.dart';

import '../Change_Delivery_Address/notification_screen.dart';


class ProductStatusScreen extends StatefulWidget {
  const ProductStatusScreen({super.key});

  @override
  State<ProductStatusScreen> createState() => _ProductStatusScreenState();
}

class _ProductStatusScreenState extends State<ProductStatusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F5F7),

      appBar: AppBar(
        elevation: 8,
        shadowColor: Colors.black.withOpacity(0.2),
        backgroundColor: Colors.blueAccent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blueAccent,
                Colors.lightBlue.shade400,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: _buildSearchBar(),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.arrow_back, color: Colors.black),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.mic, color: Colors.blueAccent),
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 0),
            _productTile(
              "Comos Fan Portable 3 Power Speed (Black Color)",
              "assets/image/first_image.jpeg",
              "Success",
              Colors.green,
            ),

            _productTile(
              "Stylish Wireless Bluetooth Headset with Mic",
              "assets/image/first_image.jpeg",
              "Pending",
              Colors.orange,
            ),

            _productTile(
              "Smart LED Bulb 12W – Alexa Supported",
              "assets/image/first_image.jpeg",
              "Cancelled",
              Colors.red,
            ),

            _productTile(
              "Premium Laptop Stand – Adjustable Height",
              "assets/image/first_image.jpeg",
              "Success",
              Colors.green,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 42,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 2),
          )
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search, size: 20, color: Colors.blueAccent),
          hintText: "Search best products...",
          hintStyle: TextStyle(fontSize: 13, color: Colors.grey.shade600),
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 10),
        ),
      ),
    );
  }


  Widget _productTile(String name, String img, String status, Color statusColor) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => NotificationScreen()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.09),
              blurRadius: 12,
              offset: Offset(0, 5),
            )
          ],
        ),

        child: Row(
          children: [

            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Container(
                height: 90,
                width: 90,
                child: Image.asset(img, fit: BoxFit.cover),
              ),
            ),

            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 15.5,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  SizedBox(height: 6),

                  // PRICE ROW
                  Row(
                    children: [
                      Icon(Icons.discount, color: Colors.green, size: 16),
                      SizedBox(width: 4),

                      Text("40% OFF",
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold)),

                      SizedBox(width: 10),

                      Text(
                        "₹2299",
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(width: 8),

                      Text(
                        "₹300",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 8),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: List.generate(
                          5,
                              (index) => Icon(
                            index < 4 ? Icons.star : Icons.star_border,
                            size: 17,
                            color: Colors.amber,
                          ),
                        ),
                      ),

                      Container(
                        padding:
                        EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          color: statusColor.withOpacity(0.12),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          status,
                          style: TextStyle(
                            color: statusColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
