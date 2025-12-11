import 'package:flutter/material.dart';

class PaymentsWalletScreen extends StatelessWidget {
  const PaymentsWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f5f7),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Payments & Wallet",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          const SizedBox(height: 10),

          /// 💜 Wallet Card
          _walletCard(),

          const SizedBox(height: 30),

          /// 🔹 Section Title
          const Text(
            "Payment Methods",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.black87),
          ),
          const SizedBox(height: 14),

          /// Payment Method Cards
          _paymentCard(
            title: "Credit / Debit Card",
            icon: Icons.credit_card,
            details: "**** **** **** 1234",
            color: Colors.blueAccent,
          ),

          _paymentCard(
            title: "UPI",
            icon: Icons.qr_code_2,
            details: "john@upi",
            color: Colors.green,
          ),

          _paymentCard(
            title: "Net Banking",
            icon: Icons.account_balance,
            details: "HDFC Bank",
            color: Colors.orange,
          ),

          const SizedBox(height: 35),

          /// ➕ Add Money Button
          _addMoneyButton(),
        ],
      ),
    );
  }

  // -----------------------------
  // 🔮 Wallet Card
  // -----------------------------
  Widget _walletCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xff6a1b9a), Color(0xffab47bc)],
        ),
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.06),
            blurRadius: 14,
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
                    color: Colors.white70,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 8),
              Text(
                "₹ 2,500",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Icon(Icons.account_balance_wallet_outlined,
              color: Colors.white, size: 45),
        ],
      ),
    );
  }

  // -----------------------------
  // 💳 Payment Method Card
  // -----------------------------
  Widget _paymentCard({
    required String title,
    required IconData icon,
    required String details,
    required Color color,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: color.withOpacity(0.12),
            child: Icon(icon, color: color, size: 22),
          ),
          const SizedBox(width: 16),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 2),
              Text(details, style: const TextStyle(color: Colors.black54)),
            ],
          ),

          const Spacer(),

          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit, color: Colors.blueAccent, size: 22),
          )
        ],
      ),
    );
  }

  Widget _addMoneyButton() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 17),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xff6a1b9a), Color(0xffab47bc)],
          ),
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black12.withOpacity(0.08),
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
                fontSize: 17,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.3),
          ),
        ),
      ),
    );
  }
}
