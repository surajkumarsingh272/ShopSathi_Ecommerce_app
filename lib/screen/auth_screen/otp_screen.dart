import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_sathi_app/screen/bottom_navigation.dart';

import '../providers/auth_provider.dart';
import 'home_screen.dart';

class OtpScreen extends StatefulWidget {
  final String phone;

  const OtpScreen({super.key, required this.phone});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthProvider>(context, listen: false);
    final otpController = TextEditingController();   // FIXED (pehle phoneController use ho raha tha)

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [

          Positioned(
            top: 0,
            left: 0,
            child: Image.asset("assets/image/double1.png", height: 250),
          ),

          Positioned(
            top: 0,
            left: 0,
            child: Image.asset("assets/image/login.png", height: 200),
          ),

          Positioned(
            top: 197,
            right: 0,
            child: Image.asset("assets/image/single.png", height: 120),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 210),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const SizedBox(height: 80),
                  const Text(
                    "OTP Verification",
                    style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold),
                  ),

                  Text(
                    "Enter the OTP sent to your number",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),

                  const SizedBox(height: 25),

                  const Text(
                    "Enter OTP",
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),

                  const SizedBox(height: 15),

                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.black26),
                    ),
                    child: TextField(
                      controller: otpController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter OTP",
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  GestureDetector(
                    onTap: () async {
                      if (otpController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Enter OTP")),
                        );
                        return;
                      }

                      final otpData = {
                        "phone": widget.phone,
                        "otp": otpController.text.trim(),
                      };

                      try {
                        final res = await provider.verifyOtp(otpData);

                        if (res.success) {
                          final prefs = await SharedPreferences.getInstance();
                          await prefs.setString("accessToken", res.accessToken);
                          await prefs.setString("refreshToken", res.refreshToken);

                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (_) => BottomNavigation()),
                                (route) => false,
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(res.message)),
                          );
                        }
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Error: ${e.toString()}")),
                        );
                      }
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        "Verify OTP",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
