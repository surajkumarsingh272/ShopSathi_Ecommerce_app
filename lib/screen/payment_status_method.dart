import 'package:flutter/material.dart';
import '../Change Delivery Address/success_screen.dart';
import 'RazorpayPaymentScreen.dart';

class PaymentMethodScreens extends StatefulWidget {
  final int amount;

  const PaymentMethodScreens({super.key, required this.amount});

  @override
  State<PaymentMethodScreens> createState() => _PaymentMethodScreensState();
}

class _PaymentMethodScreensState extends State<PaymentMethodScreens> {
  String selectedMethod = "";

  Widget paymentOptionCard({
    required String value,
    required String title,
    required String subtitle,
    required IconData icon,
  }) {
    bool isSelected = selectedMethod == value;

    return GestureDetector(
      onTap: () => setState(() => selectedMethod = value),
      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, size: 30, color: isSelected ? Colors.blue : Colors.black54),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: isSelected ? Colors.blue : Colors.black)),
                  const SizedBox(height: 4),
                  Text(subtitle,
                      style: TextStyle(fontSize: 13, color: Colors.grey.shade600)),
                ],
              ),
            ),
            if (isSelected)
              const Icon(Icons.check_circle, color: Colors.blue, size: 26),
          ],
        ),
      ),
    );
  }

  void onContinue() {
    if (selectedMethod.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Please select a payment method")));
      return;
    }

    if (selectedMethod == "cod") {
      Navigator.push(context, MaterialPageRoute(builder: (_) => SuccessScreen()));
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => RazorpayPaymentScreen(amount: widget.amount),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text("Select Payment Method",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 4,
                        color: Colors.black12,
                        offset: Offset(0, 2))
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Payable Amount",
                      style: TextStyle(fontSize: 16, color: Colors.black54)),
                  Text("₹${widget.amount}",
                      style: TextStyle(
                          fontSize: 19,
                          color: Colors.green,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            paymentOptionCard(
              value: "cod",
              title: "Cash on Delivery",
              subtitle: "Pay when you receive the order",
              icon: Icons.delivery_dining,
            ),
            paymentOptionCard(
              value: "online",
              title: "Online Payment (Razorpay)",
              subtitle: "Pay using UPI / Card / Wallet",
              icon: Icons.account_balance_wallet,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
        ),
        child: SizedBox(
          height: 50,
          child: ElevatedButton(
            onPressed: onContinue,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
            child: Text(
              selectedMethod == "cod"
                  ? "Place Order"
                  : "Pay ₹${widget.amount}",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
