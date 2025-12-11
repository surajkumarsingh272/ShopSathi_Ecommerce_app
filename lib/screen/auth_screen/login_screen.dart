import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_sathi_app/screen/auth_screen/reset_number_screen.dart';
import '../../providers/auth_provider.dart';
import '../bottom_navigation.dart';
import 'register_screen.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthProvider>(context, listen: false);

    var emailController = provider.emailController;
    var passController = provider.passController;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [

          /// ---------- BACKGROUND IMAGES ----------
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
            top: 200,
            right: 0,
            child: Image.asset("assets/image/single.png", height: 120),
          ),

          /// ---------- MAIN BODY ----------
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 180),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const SizedBox(height: 60),

                const Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 5),

                const Text(
                  "Good to see you back!",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),

                const SizedBox(height: 25),

                /// ---------- EMAIL ----------
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Email",
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                /// ---------- PASSWORD ----------
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: TextField(
                    controller: passController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Password",
                    ),
                  ),
                ),

                const SizedBox(height: 5),

                /// ---------- Create Account + Forgot Password ----------
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const RegisterScreen()),
                        );
                      },
                      child: const Text(
                        "Create Account?",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                           MaterialPageRoute(
                            builder: (_) => ResetNumberScreen(phone: '1',),
                          ),
                        );
                      },
                      child: const Text(
                        "Forgot password?",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                /// ---------- LOGIN BUTTON ----------
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      elevation: 4,
                    ),
                    onPressed: () async {
                      final res = await provider.loginUser(
                        emailController.text.trim(),
                        passController.text.trim(),
                      );

                      if (res.success) {
                        var prefs = await SharedPreferences.getInstance();
                        await prefs.setString("accessToken", res.accessToken ?? "");
                        await prefs.setString("refreshToken", res.refreshToken ?? "");

                        Map<String, dynamic> decoded = JwtDecoder.decode(res.accessToken!);
                        int userId = decoded["id"];
                        print("LOGIN USER ID = $userId");

                        await prefs.setInt("userId", userId);

                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (_) => const BottomNavigation()),
                              (route) => false,
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(res.message ?? "Login failed"),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      "Next",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
