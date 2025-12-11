import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CouponsOffersScreen extends StatelessWidget {
  const CouponsOffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff3f4f8),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Coupons & Offers",
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(height: 10),

          _banner(),

          const SizedBox(height: 25),
          _title("Active Coupons ✨"),

          activeCoupon(
            context,
            code: "GET50",
            description: "Get 50% OFF on your first purchase",
            validity: "Valid till 31 Dec 2025",
            color: Colors.deepPurple,
          ),

          activeCoupon(
            context,
            code: "FREESHIP",
            description: "Free shipping on orders above ₹500",
            validity: "Valid till 31 Dec 2025",
            color: Colors.blueAccent,
          ),

          const SizedBox(height: 25),
          _title("Expired Coupons"),

          expiredCoupon(
            code: "WELCOME10",
            description: "10% OFF on first order",
            validity: "Expired: 30 Nov 2025",
          ),

          expiredCoupon(
            code: "SAVE100",
            description: "Save ₹100 on orders above ₹1000",
            validity: "Expired: 15 Nov 2025",
          ),
        ],
      ),
    );
  }

  // 🔵 Header Banner
  Widget _banner() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xff6a11cb), Color(0xff2575fc)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 12,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 26,
            backgroundColor: Colors.white,
            child: Icon(Icons.discount_rounded,
                size: 30, color: Colors.deepPurple),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              "Apply coupons and save big on every order!",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white.withOpacity(0.95),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Title
  Widget _title(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: Colors.black87,
      ),
    );
  }

  // ⭐ ACTIVE COUPON CARD (Premium)
  Widget activeCoupon(
      BuildContext context, {
        required String code,
        required String description,
        required String validity,
        required Color color,
      }) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
            color.withOpacity(0.90),
            color.withOpacity(0.75),
            color.withOpacity(0.95),
          ],
        ),
        boxShadow: [
          BoxShadow(
              color: color.withOpacity(0.4),
              blurRadius: 12,
              offset: const Offset(0, 6)),
        ],
      ),

      child: Row(
        children: [
          // Left badge
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.25),
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Icon(Icons.card_giftcard,
                color: Colors.white, size: 28),
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  code,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white.withOpacity(0.9),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  validity,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ),

          InkWell(
            onTap: () {
              Clipboard.setData(ClipboardData(text: code));
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("$code copied!"),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
            child: Container(
              padding:
              const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                "COPY",
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }

  // ❌ EXPIRED COUPON
  Widget expiredCoupon({
    required String code,
    required String description,
    required String validity,
  }) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade400, width: 1),
      ),

      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(Icons.lock_clock_rounded,
                color: Colors.white, size: 26),
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  code,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                      fontSize: 15, color: Colors.black54),
                ),
                const SizedBox(height: 4),
                Text(
                  validity,
                  style: const TextStyle(
                      fontSize: 12, color: Colors.black38),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
