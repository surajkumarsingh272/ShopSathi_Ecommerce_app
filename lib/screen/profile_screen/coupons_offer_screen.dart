import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CouponsOffersScreen extends StatelessWidget {
  const CouponsOffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2f2f7),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Coupons & Offers",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(height: 10),

          const Text(
            "Active Coupons",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
          ),
          const SizedBox(height: 12),

          couponCard(
            context,
            "GET50",
            "Get 50% off on first order",
            "Valid until: 31 Dec 2025",
            Colors.deepPurple,
            true,
          ),
          couponCard(
            context,
            "FREESHIP",
            "Free shipping on orders above ₹500",
            "Valid until: 31 Dec 2025",
            Colors.teal,
            true,
          ),

          const SizedBox(height: 20),
          const Text(
            "Expired Coupons",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
          ),
          const SizedBox(height: 12),

          couponCard(
            context,
            "WELCOME10",
            "10% off on your first order",
            "Expired on: 30 Nov 2025",
            Colors.grey,
            false,
          ),
          couponCard(
            context,
            "SAVE100",
            "Save ₹100 on orders above ₹1000",
            "Expired on: 15 Nov 2025",
            Colors.grey,
            false,
          ),
        ],
      ),
    );
  }

  Widget couponCard(BuildContext context, String code, String description,
      String validity, Color color, bool isActive) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: isActive
            ? LinearGradient(
          colors: [color.withOpacity(0.9), color],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )
            : null,
        color: isActive ? null : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          // Coupon Code Box
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
            decoration: BoxDecoration(
              color: isActive ? Colors.white.withOpacity(0.2) : Colors.grey.shade400,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              code,
              style: TextStyle(
                  color: isActive ? Colors.white : Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  description,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: isActive ? Colors.white : Colors.black54),
                ),
                const SizedBox(height: 4),
                Text(
                  validity,
                  style: TextStyle(
                      fontSize: 13,
                      color: isActive ? Colors.white70 : Colors.black38),
                ),
              ],
            ),
          ),
          if (isActive)
            InkWell(
              onTap: () {
                Clipboard.setData(ClipboardData(text: code));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Coupon code copied!")),
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  "COPY",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 13),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
