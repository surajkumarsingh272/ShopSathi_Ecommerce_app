// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:shop_sathi_app/providers/auth_provider.dart';
// import 'package:shop_sathi_app/screen/home_screen.dart';
// import 'bottom_navigation.dart';
// import 'login_screen.dart';
//
// class SignupOtpScreen extends StatefulWidget {
//   final String phone;
//   const SignupOtpScreen({super.key, required this.phone});
//
//   @override
//   State<SignupOtpScreen> createState() => _SignupOtpScreenState();
// }
//
// class _SignupOtpScreenState extends State<SignupOtpScreen> {
//   final TextEditingController otpController = TextEditingController();
//   final TextEditingController newPasswordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;
//     var provider = Provider.of<AuthProvider>(context, listen: false);
//
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Stack(
//           children: [
//             Positioned(
//               top: 0,
//               left: 0,
//               child: Image.asset(
//                 "assets/image/double1.png",
//                 height: height * 0.38,
//               ),
//             ),
//
//             Positioned(
//               top: 0,
//               left: 0,
//               child: Image.asset(
//                 "assets/image/login.png",
//                 height: height * 0.30,
//               ),
//             ),
//
//             Transform.translate(
//               offset: Offset(0, -height * 0.15),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     height: width * 0.25,
//                     width: width * 0.25,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       border: Border.all(
//                         color: Colors.white,
//                         width: width * 0.011,
//                       ),
//                     ),
//                     child: Center(
//                       child: Icon(
//                         Icons.person,
//                         size: width * 0.14,
//                         color: Colors.blue,
//                       ),
//                     ),
//                   ),
//
//                   SizedBox(height: height * 0.02),
//
//                   Text(
//                     "Hello, Suraj!!",
//                     style: TextStyle(
//                       fontSize: width * 0.07,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//
//                   SizedBox(height: height * 0.02),
//
//                   Text(
//                     "Type your password",
//                     style: TextStyle(
//                       fontSize: width * 0.04,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black26,
//                     ),
//                   ),
//
//                   SizedBox(height: height * 0.04),
//
//                   TextField(
//                     controller: otpController,
//                     decoration: InputDecoration(labelText: "OTP"),
//                   ),
//
//                   TextField(
//                     controller: newPasswordController,
//                     decoration: InputDecoration(labelText: "NewPassword"),
//                   ),
//
//                   SizedBox(height: height * 0.02),
//
//                   Row(
//                     children: [
//                       SizedBox(width: width * 0.2),
//
//                       Text("I already have an account"),
//
//                       SizedBox(width: width * 0.04),
//
//                       Container(
//                         height: 30,
//                         width: 30,
//                         decoration: BoxDecoration(
//                           color: Colors.blue.shade600,
//                           borderRadius: BorderRadius.circular(200),
//                         ),
//                         child: GestureDetector(
//                           onTap: () async {
//                             final resetData = {
//                               "phone": widget.phone,
//                               "otp": otpController.text.trim(),
//                               "new_password":
//                               newPasswordController.text.trim(),
//                             };
//
//                             final res = await provider.resetPassword(resetData);
//
//                             if (res.success) {
//                               Navigator.pushAndRemoveUntil(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (_) => const LoginScreen(),
//                                 ),
//                                     (route) => false,
//                               );
//                             } else {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 SnackBar(content: Text(res.message)),
//                               );
//                             }
//                           },
//                           child: Center(
//                             child: Icon(
//                               Icons.arrow_forward,
//                               color: Colors.white,
//                               size: 15,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_sathi_app/providers/auth_provider.dart';
import 'package:shop_sathi_app/screen/login_screen.dart';

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
      backgroundColor: Colors.grey[50],
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // Decorative Top Images
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                "assets/image/double1.png",
                height: height * 0.35,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                "assets/image/login.png",
                height: height * 0.28,
                fit: BoxFit.cover,
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: height * 0.2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Profile Circle
                  Container(
                    height: width * 0.25,
                    width: width * 0.25,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 3,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
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

                  // Welcome Text
                  Text(
                    "Hello, Suraj!",
                    style: TextStyle(
                      fontSize: width * 0.07,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),

                  SizedBox(height: height * 0.01),

                  Text(
                    "Enter OTP & set a new password",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: width * 0.04,
                      fontWeight: FontWeight.w500,
                      color: Colors.black45,
                    ),
                  ),

                  SizedBox(height: height * 0.04),

                  // OTP TextField with Autofill
                  AutofillGroup(
                    child: Column(
                      children: [
                        TextField(
                          controller: otpController,
                          keyboardType: TextInputType.number,
                          autofillHints: [AutofillHints.oneTimeCode],
                          decoration: InputDecoration(
                            labelText: "OTP",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            prefixIcon: Icon(Icons.confirmation_number),
                          ),
                        ),
                        SizedBox(height: height * 0.02),
                        TextField(
                          controller: newPasswordController,
                          obscureText: true,
                          autofillHints: [AutofillHints.newPassword],
                          decoration: InputDecoration(
                            labelText: "New Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            prefixIcon: Icon(Icons.lock),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: height * 0.04),

                  // Action Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(color: Colors.black54),
                      ),
                      SizedBox(width: 8),
                      GestureDetector(
                        onTap: () async {
                          final resetData = {
                            "phone": widget.phone,
                            "otp": otpController.text.trim(),
                            "new_password": newPasswordController.text.trim(),
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
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade600,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue.withOpacity(0.4),
                                blurRadius: 8,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
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
