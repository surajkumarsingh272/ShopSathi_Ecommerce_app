import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import '../Change Delivery Address/success_screen.dart';
import '../services/razorpay_service.dart';

class RazorpayPaymentScreen extends StatefulWidget {
  final int amount;

  const RazorpayPaymentScreen({super.key, required this.amount});

  @override
  State<RazorpayPaymentScreen> createState() => _RazorpayPaymentScreenState();
}

class _RazorpayPaymentScreenState extends State<RazorpayPaymentScreen> {
  Razorpay? razorpay;

  @override
  void initState() {
    super.initState();

    razorpay = Razorpay();

    razorpay?.on(Razorpay.EVENT_PAYMENT_SUCCESS, (PaymentSuccessResponse response) {
      _showMessage("Payment Success: ${response.paymentId}");
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => SuccessScreen()));
    });

    razorpay?.on(Razorpay.EVENT_PAYMENT_ERROR, (PaymentFailureResponse response) {
      _showMessage("Payment Failed");
    });

    razorpay?.on(Razorpay.EVENT_EXTERNAL_WALLET, (ExternalWalletResponse response) {
      _showMessage("Payment done using Wallet");
    });

    // Directly open Razorpay on screen load
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _payNow();
    });
  }

  void _showMessage(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  @override
  void dispose() {
    razorpay?.clear();
    super.dispose();
  }

  void _payNow() async {
    int amountInPaise = widget.amount * 100;

    String orderId = await RazorpayService.createOrderId(amountInPaise);

    var options = {
      "key": "rzp_test_RD0BiIvkAPO6jt",
      "amount": amountInPaise,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 12,
                offset: Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(
                  strokeWidth: 6,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                "Processing Your Payment",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              const Text(
                "You will be redirected to Razorpay shortly...",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  DotIndicator(),
                  SizedBox(width: 6),
                  DotIndicator(delay: 100),
                  SizedBox(width: 6),
                  DotIndicator(delay: 200),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Animated Dot Indicator
class DotIndicator extends StatefulWidget {
  final int delay;
  const DotIndicator({this.delay = 0, super.key});

  @override
  State<DotIndicator> createState() => _DotIndicatorState();
}

class _DotIndicatorState extends State<DotIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    _animation = Tween<double>(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    Future.delayed(Duration(milliseconds: widget.delay), () {
      if (mounted) {
        _controller.repeat(reverse: true);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Container(
        width: 10,
        height: 10,
        decoration: const BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
