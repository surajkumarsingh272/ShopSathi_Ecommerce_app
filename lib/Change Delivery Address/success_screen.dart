import 'package:flutter/material.dart';
import 'package:shop_sathi_app/screen/home_screen.dart';


class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 150,),
            Image.asset("assets/image/img_13.png"),
            SizedBox(height: 30),
            Text("Success!",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            SizedBox(height: 20,),
            Text("Your order will be delivered soon"),
            Text("Thank you for choosing our app!"),
            SizedBox(height: 110,),
            MaterialButton(onPressed: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),));},height: 50,minWidth: 300,color: Colors.blueAccent,shape: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.blueAccent)),child: Text("CONTINUE SHOPPING",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),)
          ],
        ),
      ),
    );
  }
}
