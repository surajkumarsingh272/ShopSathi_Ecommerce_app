
import 'package:flutter/material.dart';

class OfferScreen extends StatefulWidget {
  const OfferScreen({super.key});
  @override
  State<OfferScreen> createState() => _OfferScreenState();
}
class _OfferScreenState extends State<OfferScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/image/img5.png"),
            fit: BoxFit.cover,
          ),
        ),
        child:SingleChildScrollView(
          child: Column(
            children:[
              SizedBox(height: height * 0.07),
              Text("40% OFF",style: TextStyle(fontSize:height * 0.045,fontWeight: FontWeight.bold,color: Colors.white,),),
              SizedBox(height: height * 0.02),
              Container(
                height: height * 0.42,
                width: width * 0.75,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color:Colors.white,
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Column(
                  children:[
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                        child:Icon(Icons.close,color:Colors.white, size: 15),
                      ),
                    ),
                    Image.asset("assets/image/img4.png", height: height * 0.18),
                    SizedBox(height: height * 0.015),
                    Text("08 : 23 : 12",style: TextStyle(fontSize: height * 0.04,letterSpacing: 2,fontWeight: FontWeight.bold,),),
                    SizedBox(height:height * 0.02),
                    Container(
                      height:height * 0.06,
                      width:double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child:Center(
                        child:Text("GET IT NOW",style: TextStyle(color: Colors.white,fontSize: height * 0.02,fontWeight: FontWeight.bold),),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height:height * 0.02),
              Text("Get this exclusive limited offer!",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: height * 0.02)),
              SizedBox(height: height * 0.02),
              Container(
                height: height * 0.35,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("SELECT YOUR PLAN",style: TextStyle(fontSize: height * 0.02,fontWeight: FontWeight.bold)),
                    SizedBox(height: height * 0.016),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: height*0.13,
                            padding: EdgeInsets.all(23),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.blueAccent),
                            ),
                            child: Column(
                              children: [
                                Text("MONTHLY",style: TextStyle(fontWeight: FontWeight.bold,fontSize: height * 0.016)),
                                Text("\$x.xx / month",style: TextStyle(fontWeight: FontWeight.bold,fontSize: height * 0.016)),
                                Text("No free trial",style: TextStyle(color: Colors.black38,fontWeight: FontWeight.bold,fontSize: height * 0.013)),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: width * 0.03),
                        Expanded(
                          child: Container(
                            height: height * 0.13,
                            padding: EdgeInsets.all(23),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                  color: Colors.grey.shade300),
                            ),
                            child: Column(
                              children: [
                                Text("YEARLY",style: TextStyle(fontSize: height * 0.016,fontWeight: FontWeight.bold)),
                                Text("\$x.xx/month",style: TextStyle(fontSize: height * 0.016,fontWeight: FontWeight.bold)),
                                Text("\$x.xx / month",style: TextStyle(color: Colors.black38,fontWeight: FontWeight.bold,fontSize: height * 0.013)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.02),
                    Container(
                      height: height* 0.06,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.blueAccent,
                      ),
                      child:Center(
                        child: Text("SUBSCRIBE NOW",style: TextStyle(color: Colors.white,fontSize: height * 0.02,fontWeight: FontWeight.bold)),),),
                    SizedBox(height: height * 0.02),
                    Text("*\$XX billed annually. Cancel anytime.",style:TextStyle(fontSize: height * 0.015, color: Colors.black)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
