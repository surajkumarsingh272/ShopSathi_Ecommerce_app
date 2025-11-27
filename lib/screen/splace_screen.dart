
import 'dart:async';
import 'package:flutter/material.dart';
import 'onboarding_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => OnbordingScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            Image.asset("assets/image/image1.png", height: height * 0.20,),
            SizedBox(height: height *0.01),
            Text("ShopSathi", style: TextStyle(fontSize: width * 0.09,fontWeight: FontWeight.bold, color: Colors.black87,),),
            SizedBox(height: height *0.01),
            Text("Beautiful eCommerce UI Kit", style: TextStyle(fontSize: width * 0.04, color: Colors.grey.shade600,),),
            Text("for your online store", style: TextStyle(fontSize: width * 0.04, color: Colors.grey.shade600,),),
            SizedBox(height: height*0.30,),
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
    );
  }
}
