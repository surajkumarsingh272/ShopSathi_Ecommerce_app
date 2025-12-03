import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_sathi_app/providers/auth_provider.dart';
import 'package:shop_sathi_app/screen/home_screen.dart';
import 'bottom_navigation.dart';
import 'login_screen.dart';

class SignupOtpScreen extends StatefulWidget {
  final String phone;
  const SignupOtpScreen({super.key, required this.phone});

  @override
  State<SignupOtpScreen> createState() => _SignupOtpScreenState();
}

class _SignupOtpScreenState extends State<SignupOtpScreen> {
  final TextEditingController otpController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    var provider = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                "assets/image/double1.png",
                height: height * 0.38,
              ),
            ),

            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                "assets/image/login.png",
                height: height * 0.30,
              ),
            ),

            Transform.translate(
              offset: Offset(0, -height * 0.15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: width * 0.25,
                    width: width * 0.25,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: width * 0.011,
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.person,
                        size: width * 0.14,
                        color: Colors.blue,
                      ),
                    ),
                  ),

                  SizedBox(height: height * 0.02),

                  Text(
                    "Hello, Suraj!!",
                    style: TextStyle(
                      fontSize: width * 0.07,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: height * 0.02),

                  Text(
                    "Type your password",
                    style: TextStyle(
                      fontSize: width * 0.04,
                      fontWeight: FontWeight.bold,
                      color: Colors.black26,
                    ),
                  ),

                  SizedBox(height: height * 0.04),

                  TextField(
                    controller: otpController,
                    decoration: InputDecoration(labelText: "OTP"),
                  ),

                  TextField(
                    controller: newPasswordController,
                    decoration: InputDecoration(labelText: "NewPassword"),
                  ),

                  SizedBox(height: height * 0.02),

                  Row(
                    children: [
                      SizedBox(width: width * 0.2),

                      Text("I already have an account"),

                      SizedBox(width: width * 0.04),

                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade600,
                          borderRadius: BorderRadius.circular(200),
                        ),
                        child: GestureDetector(
                          onTap: () async {
                            final resetData = {
                              "phone": widget.phone,
                              "otp": otpController.text.trim(),
                              "new_password":
                              newPasswordController.text.trim(),
                            };

                            final res = await provider.resetPassword(resetData);

                            if (res.success) {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const LoginScreen(),
                                ),
                                    (route) => false,
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(res.message)),
                              );
                            }
                          },
                          child: Center(
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
