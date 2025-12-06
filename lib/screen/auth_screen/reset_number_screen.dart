import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_sathi_app/screen/signup_otp_screen.dart';


import '../providers/auth_provider.dart';
import 'home_screen.dart';

class ResetNumberScreen extends StatefulWidget {
  final String phone;
  const ResetNumberScreen({super.key, required this.phone});

  @override
  State<ResetNumberScreen> createState() => _ResetNumberScreenState();
}
class _ResetNumberScreenState extends State<ResetNumberScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthProvider>(context, listen: false);
    var numberController=provider.phoneController;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              "assets/image/double1.png",
              height: 250,
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              "assets/image/login.png",
              height: 200,
            ),
          ),

          Positioned(
            top: 197,
            right: 0,
            child: Image.asset(
              "assets/image/single.png",
              height: 120,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25,vertical:210),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height:80),
                  Text("Forgot number", style: TextStyle(
                    fontSize:33, fontWeight: FontWeight.bold,),
                  ),
                  Text("please enter your Number",
                    style: TextStyle(fontSize:12, color: Colors.grey),
                  ),

                  SizedBox(height: 25),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Enter number",style: TextStyle(fontSize: 14, color: Colors.black
                      ),
                      ),
                      SizedBox(height:15),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.black26)
                        ),
                        child: TextField(
                          controller: numberController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "enter your Number",
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                      onTap: () async {
                        final forgotData = {
                          "phone": numberController.text.trim(),
                        };

                        try {
                          final res = await provider.forgotPassword( numberController.text.trim(),);

                          if (res.success) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => SignupOtpScreen(
                                  phone: numberController.text.trim(),
                                ),
                              ),
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
                      child: Text("Reset Password",style:TextStyle(fontSize: 16,color: Colors.white,),
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
  }}
