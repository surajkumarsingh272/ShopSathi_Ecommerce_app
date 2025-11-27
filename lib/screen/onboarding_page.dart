import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'checkgender_screen.dart';

class OnbordingScreen extends StatefulWidget {
  const OnbordingScreen({super.key});

  @override
  State<OnbordingScreen> createState() => _OnbordingScreenState();
}

class _OnbordingScreenState extends State<OnbordingScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor:Colors.white,
      body:Column(
        children:[
          Align(
            alignment: Alignment.topRight,
            child: Container(
              height: height * 0.30,
              width: width * 0.30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),
              ),
              child: Image.asset("assets/image/image2.png",height:height * 0.30 ,),
            ),
          ),
          SizedBox(height: height * 0.02),
          Center(
            child: Image.asset("assets/image/Image3.png",height: height * 0.30,),
          ),
          SizedBox(height: height * 0.04),
          Text("We promise that you’ll have the most\nfuss-free time with us ever.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: height*0.04,),
          Padding(
            padding:EdgeInsets.all(10),
            child: SizedBox(
              height: height * 0.06,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CheckGenderScreen(),));
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                child: Ink(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF3A7BFF),
                        Color(0xFF3FF3C3),
                      ],
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Next",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight:FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),


        ],
      ),

    );
  }
}
