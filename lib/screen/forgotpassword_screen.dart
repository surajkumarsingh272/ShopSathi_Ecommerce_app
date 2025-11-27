
import 'package:flutter/material.dart';

class ForgotpasswordScreen extends StatefulWidget {
  const ForgotpasswordScreen({super.key});

  @override
  State<ForgotpasswordScreen> createState() => _ForgotpasswordScreenState();
}
class _ForgotpasswordScreenState extends State<ForgotpasswordScreen> {
  @override
  Widget build(BuildContext context) {
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
              "assets/image/bubble2.png",
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
                  Text("Forgot Password", style: TextStyle(
                    fontSize:33, fontWeight: FontWeight.bold,),
                  ),
                  Text("please enter your email to reset the password",
                    style: TextStyle(fontSize:12, color: Colors.grey),
                  ),

                  SizedBox(height: 25),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Enter email",style: TextStyle(fontSize: 14, color: Colors.black
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
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "enter your email",
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }}
