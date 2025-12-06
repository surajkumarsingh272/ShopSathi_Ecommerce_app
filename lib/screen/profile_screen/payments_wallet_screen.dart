import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: PaymentsWalletScreen(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class PaymentsWalletScreen extends StatelessWidget {
  const PaymentsWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2f2f7),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Payments & Wallet",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(height: 10),

          // 💜 Wallet Balance Card with gradient
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                  colors: [Color(0xff6a1b9a), Color(0xffab47bc)]),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12.withOpacity(0.05),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Wallet Balance",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "₹ 2,500",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Icon(Icons.account_balance_wallet,
                    color: Colors.white, size: 40),
              ],
            ),
          ),

          const SizedBox(height: 30),

          // 🔹 Section: Payment Methods
          const Text(
            "Payment Methods",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
          ),
          const SizedBox(height: 12),

          paymentCard("Credit / Debit Card", Icons.credit_card, "**** **** **** 1234",
              Colors.blueAccent),
          paymentCard("UPI", Icons.account_balance_wallet, "john@upi", Colors.green),
          paymentCard("Net Banking", Icons.account_balance, "HDFC Bank", Colors.orange),

          const SizedBox(height: 30),

          // ➕ Add Money Button with gradient
          GestureDetector(
            onTap: () {
              // Add money logic
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                    colors: [Color(0xff6a1b9a), Color(0xffab47bc)]),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12.withOpacity(0.05),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: const Center(
                child: Text(
                  "Add Money to Wallet",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget paymentCard(
      String title, IconData icon, String details, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: color.withOpacity(0.1),
            child: Icon(icon, color: color),
          ),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w600)),
              const SizedBox(height: 2),
              Text(details, style: const TextStyle(color: Colors.black54)),
            ],
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              // Edit payment method
            },
            icon: const Icon(Icons.edit, color: Colors.blueAccent),
          )
        ],
      ),
    );
  }
}
