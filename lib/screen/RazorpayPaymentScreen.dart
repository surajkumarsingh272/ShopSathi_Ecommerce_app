import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shop_sathi_app/Change%20Delivery%20Address/success_screen.dart';
import '../services/razorpay_service.dart';

class RazorpayPaymentScreen extends StatefulWidget {
  const RazorpayPaymentScreen({super.key});

  @override
  State<RazorpayPaymentScreen> createState() => _RazorpayPaymentScreenState();
}

class _RazorpayPaymentScreenState extends State<RazorpayPaymentScreen> {
  final amountController = TextEditingController();
  Razorpay? razorpay;

  @override
  void initState() {
    super.initState();

    razorpay = Razorpay();

    razorpay?.on(Razorpay.EVENT_PAYMENT_SUCCESS,
            (PaymentSuccessResponse response) {
          _showMessage("Payment Success: ${response.paymentId}");
          Navigator.push(context, MaterialPageRoute(builder: (context) => SuccessScreen(),));
        });

    razorpay?.on(Razorpay.EVENT_PAYMENT_ERROR,
            (PaymentFailureResponse response) {
          _showMessage("Payment Failed");
        });

    razorpay?.on(Razorpay.EVENT_EXTERNAL_WALLET,
            (ExternalWalletResponse response) {
          _showMessage("Payment done using Wallet");
        });
  }

  void _showMessage(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text)),
    );
  }

  @override
  void dispose() {
    razorpay?.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text(
          "Razorpay Payment",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
        elevation: 0.5,
      ),

      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(height: 10),

            const Text(
              "Enter Amount",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 10),

            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(0, 2))
                ],
              ),
              child: TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  hintText: "Enter amount in ₹",
                  border: InputBorder.none,
                ),
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  _payNow();

                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Pay Now",
                  style: TextStyle(fontSize: 17, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _payNow() async {
    if (amountController.text.isEmpty) {
      _showMessage("Enter amount");
      return;
    }

    int amount = int.parse(amountController.text) * 100;

    String orderId = await RazorpayService.createOrderId(amount);

    var options = {
      "key": "rzp_test_RD0BiIvkAPO6jt",
      "amount": amount,
      "currency": "INR",
      "name": "Shop Sathi",
      "description": "Order Payment",
      "order_id": orderId,
      "prefill": {
        "contact": "9876543210",
        "email": "user@gmail.com",
      }
    };

    razorpay?.open(options);
  }
}
