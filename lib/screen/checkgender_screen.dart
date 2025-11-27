
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';


class CheckGenderScreen extends StatefulWidget {
  const CheckGenderScreen({super.key});

  @override
  State<CheckGenderScreen> createState() => _CheckGenderScreenState();
}

class _CheckGenderScreenState extends State<CheckGenderScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent,Colors.blueAccent, Colors.white,Colors.blueAccent,Colors.blueAccent,],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: [
            Positioned(top:0, left: 0, right: 0,
              child: Image.asset("assets/image/boy.png",height:845,fit: BoxFit.contain,),
            ),

            Positioned(
              bottom: 13,
              left: 13,
              right: 13,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Look Good, Feel Good",style: TextStyle(fontSize: 26,fontWeight: FontWeight.w600,),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height:10),
                    Text("Create your individual & unique style and look amazing everyday.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15,color: Colors.grey.shade600,
                      ),
                    ),
                    SizedBox(height:height * 0.03),
                    Row(
                      children: [
                        Expanded(
                            child: SizedBox(
                              height: height * 0.06,
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CheckGenderScreen(),));
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey.shade200,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  elevation: 0,
                                ),
                                child: Text("Men",style: TextStyle(fontSize: 18,color: Colors.grey,),),
                              ),
                            )

                        ),
                        SizedBox(width: width * 0.04),
                        Expanded(
                            child: SizedBox(
                              height: height * 0.06,
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blueAccent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  elevation: 0,
                                ),
                                child:Text("Women",style:TextStyle(fontSize: 18,color: Colors.white,
                                ),
                                ),
                              ),
                            )

                        ),
                      ],
                    ),
                    SizedBox(height:height * 0.025),
                    TextButton(onPressed: () {

                    }, child: Text("Skip",style: TextStyle(fontSize: 18,color: Colors.grey,),))


                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
