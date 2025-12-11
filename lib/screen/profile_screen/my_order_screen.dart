import 'package:flutter/material.dart';
import 'package:shop_sathi_app/screen/profile_screen/view_order_details_screen.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f6fa),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "My Orders",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          buildOrderCard(
            orderId: "12345",
            date: "12 Feb 2025",
            status: "Delivered",
            statusColor: Colors.green,
            imageUrl: "assets/image/first_image.jpeg",
            productName: "Wireless Bluetooth Headphones",
            price: "₹1,499",context: context, title: 'brand product',
          ),

          buildOrderCard(
            orderId: "67890",
            date: "07 Feb 2025",
            status: "Shipped",
            statusColor: Colors.blue,
            imageUrl: "assets/image/first_image.jpeg",
            productName: "Smart Fitness Band",
            price: "₹999",context: context, title: 'brand product',
          ),

          buildOrderCard(
            orderId: "45988",
            date: "03 Feb 2025",
            status: "Cancelled",
            statusColor: Colors.red,
            imageUrl: "assets/image/first_image.jpeg",
            productName: "Laptop Stand",
            price: "₹799", context: context, title: 'brand product',
          ),
        ],
      ),
    );
  }

  // ⭐ PREMIUM ORDER CARD
  Widget buildOrderCard({
    required String orderId,
    required BuildContext context,
    required String date,
    required String status,
    required Color statusColor,
    required String imageUrl,
    required String productName,
    required String price,
    required String title
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ViewOrderDetailsScreen(
              image: imageUrl,
              title: title,
              orderId: orderId,
              status: status,
              statusColor: statusColor,
              date: date,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.black12.withOpacity(0.05)),
          boxShadow: [
            BoxShadow(
              color: Colors.black12.withOpacity(0.08),
              blurRadius: 12,
              spreadRadius: 2,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            // Header Section
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
                color: Color(0xfffafafa),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Order #$orderId",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14)),
                  Row(
                    children: [
                      const Icon(Icons.calendar_today,
                          size: 13, color: Colors.black54),
                      const SizedBox(width: 6),
                      Text(
                        date,
                        style:
                        const TextStyle(color: Colors.black54, fontSize: 13),
                      ),
                    ],
                  )
                ],
              ),
            ),

            // Product Section
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Product Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.asset(
                      imageUrl,
                      width: 75,
                      height: 75,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 16),

                  // Product Detail
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          productName,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 15),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          price,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                              fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Status Bar Section
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: statusColor.withOpacity(0.1),
                borderRadius:
                const BorderRadius.vertical(bottom: Radius.circular(18)),
              ),
              child: Row(
                children: [
                  Icon(Icons.circle, size: 12, color: statusColor),
                  const SizedBox(width: 8),
                  Text(
                    status,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: statusColor),
                  ),

                  const Spacer(),

                  // VIEW DETAILS BUTTON
                  Text(
                    "View Details",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade700,
                        fontSize: 14),
                  ),
                  const SizedBox(width: 6),
                  Icon(Icons.arrow_forward_ios,
                      size: 14, color: Colors.blue.shade700),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
