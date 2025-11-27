
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignupOtpScreen extends StatefulWidget {
  const SignupOtpScreen({super.key});
  @override
  State<SignupOtpScreen> createState() => _SignupOtpScreenState();
}
class _SignupOtpScreenState extends State<SignupOtpScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width  = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset("assets/image/double1.png",height: height * 0.38,),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset("assets/image/bubble2.png",height: height * 0.30,),
          ),
          Transform.translate(
            offset: Offset(0,-height * 0.15),
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
                  child: Center(child: Icon(Icons.person, size: width * 0.14, color: Colors.blue,),),
                ),

                SizedBox(height: height * 0.02),
                Text("Hello, Suraj!!",style: TextStyle(fontSize: width * 0.07, fontWeight: FontWeight.bold,),),
                SizedBox(height: height * 0.02),
                Text("Type your password", style: TextStyle(fontSize: width * 0.04, fontWeight: FontWeight.bold, color: Colors.black26,),),
                SizedBox(height: height * 0.04),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(6, (index) {
                    return Container(
                      height: width * 0.14,
                      width: width * 0.14,
                      margin: EdgeInsets.symmetric(horizontal: width * 0.010),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black54),
                        borderRadius: BorderRadius.circular(width * 0.035),
                      ),
                      child: Text("*",style: TextStyle(fontSize:width * 0.06)),
                    );
                  }),
                ),
                SizedBox(height: height*0.02,),
                Row(
                  children: [
                    SizedBox(width: width*0.2,),
                    Text("I already have an account"),
                    SizedBox(width: width*0.04,),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade600,
                        borderRadius: BorderRadius.circular(200),
                      ),
                      child: Center(
                        child: Icon(Icons.arrow_forward, color: Colors.white, size:15,),
                      ),)

                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
