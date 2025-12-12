import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_sathi_app/Change_Delivery_Address/success_provider.dart';
import 'package:shop_sathi_app/screen/home_screen.dart';

import '../screen/product_screen.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  void initState() {
    super.initState();
    final successProvider = Provider.of<SuccessProvider>(context,listen: false);
    successProvider.getSuccessData();
  }
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SuccessProvider>(context);
    return Scaffold(
      body:provider.successList.isEmpty
          ? Center(child: Text("No Success Data"))
          : ListView.builder(
        itemCount: provider.successList.length,
        itemBuilder: (BuildContext context, int index) {
          final success = provider.successList[index];
          return Column(
            children: [
              SizedBox(height: 120,),
              Image.asset("assets/image/img_13.png"),
              SizedBox(height: 15),
              Text(success.title,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              SizedBox(height: 20,),
              Text(
                success.subtitle.replaceAll("Thank you", "\nThank you"),
                textAlign: TextAlign.center,
              ),
              Text(success.productName,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
              SizedBox(height: 80,),
              MaterialButton(onPressed: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),));},height: 50,minWidth: 300,color: Colors.blueAccent,shape: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.blueAccent)),child: Text("CONTINUE SHOPPING",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),)
            ],
          );
        },
      ),
    );
  }
}
