import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}
int? selectedValue;
class _OrderScreenState extends State<OrderScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Details",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blueAccent,
        actions: [

          Container(
            height: 23,
            width: 60,
            decoration: BoxDecoration(border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(5))
            ),
            child: Center(child: Text("Help",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.white),)),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Icon(Icons.ios_share_rounded,color: Colors.white,size: 29,),
          ),
        ],
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back,color: Colors.white,)),
      ),
      body: ListView(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Container(
                  height: 60,
                  width: 50,
                  decoration: BoxDecoration(border: Border.all(color: Colors.grey),
                  image: DecorationImage(image: AssetImage("Image/img.png"),fit:BoxFit.cover),
                  borderRadius: BorderRadius.all(Radius.circular(5))
                  ),
                ),
              ),

              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text("Povaxpo Full Sleev Grafic Print...",style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right:155,bottom: 23),
                    child: Text("XXL,Purple",style: TextStyle(color: Colors.grey,fontSize: 12),),
                  )
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
               height: 40,
              width: double.infinity,
              decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Colors.grey.shade200
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:15),
                    child: Text("Pay Online for a smooth doorstep\nexprience",style: TextStyle(fontSize: 11,fontWeight: FontWeight.bold,color: Colors.grey),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 66),
                    child: Container(
                      height: 25,
                      width: 100,
                      decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent),
                      borderRadius: BorderRadius.circular(7)
                      ),
                      child: Center(child: Text("Pay ₹312",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 13),)),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(13),
            child: Container(

              height: 160,
              width: double.infinity,
              decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent),
              borderRadius: BorderRadius.all(Radius.circular(8))
              ),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12,top: 4),
                    child: Text("Order Confirmed",style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Text("Seller has processed your order",style: TextStyle(fontSize: 11),),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Left radio
                        Radio(
                          value: 1,
                          groupValue: selectedValue,
                          visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value!;
                            });
                          },
                          fillColor: WidgetStateProperty.all(Colors.green),

                        ),

                        // Left line
                        Expanded(
                          child: Divider(
                            color: Colors.green,
                            thickness: 2,
                            height: 0, // gap hatane ke liye
                          ),
                        ),

                        // Center radio
                        Radio(
                          value: 1,
                          groupValue: selectedValue,
                          visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value!;
                            });
                          },
                          fillColor:WidgetStateProperty.all(Colors.green),
                        ),

                        // Right line
                        Expanded(
                          child: Divider(
                            color: Colors.grey,
                            thickness: 2,
                            height: 0,
                          ),
                        ),

                        // Right radio
                        Radio(
                          value: 1,
                          groupValue: selectedValue,
                          visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value!;
                            });
                          },
                          fillColor: WidgetStateProperty.all(Colors.grey),
                        ),
                      ],
                    ),
                  ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Padding(
                       padding: const EdgeInsets.only(left: 8),
                       child: Text("Order Confirmed",style: TextStyle(fontSize: 11),),
                     ),
                     Padding(
                       padding: const EdgeInsets.only(right:40),
                       child: Text("Shipped",style: TextStyle(fontSize: 11),),
                     ),
                     Padding(
                       padding: const EdgeInsets.only(right: 8),
                       child: Text("Delivery",style: TextStyle(fontSize: 11),),
                     ),
                   ],
                 ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text("Nov 9",style: TextStyle(fontSize: 11),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 66),
                        child: Text("Tommorow, Nov 11",style: TextStyle(fontSize: 11),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 6),
                        child: Text("Nov 17 by 11 PM",style: TextStyle(fontSize: 11),),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Divider(
                      color: Colors.grey.shade300,
                      thickness: 1,
                      indent: 10,
                      endIndent: 10,
                    ),
                  ),
                  Center(child: Text("See all updates",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),))
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:15),
            child: Text("Rate your exprience",style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding: const EdgeInsets.all(11),
            child: Container(
              height: 38,
              width: double.infinity,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(7),
              color: Colors.grey.shade200
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.thumb_up,color:Colors.grey.shade400,),
                  Text("Did you find this page helpful?"),
                  Text(">",style: TextStyle(color: Colors.black,fontSize: 22),)
                ],
              ),
            ),
          ),
          Divider(
            color: Colors.grey.shade300,
            thickness: 3,
            indent: 20,
            endIndent: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(11),
            child: Container(
              height: 90,
              width: double.infinity,
              decoration: BoxDecoration(
               
                gradient: LinearGradient(
                  colors: [
                    Colors.blueAccent,
                    Colors.purple, // ← doosra color
                  ],
                  begin: Alignment.centerLeft, // gradient start
                  end: Alignment.centerRight,  // gradient end
                ),
                borderRadius: BorderRadius.circular(8)
              ),
              child: Row(
               crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right:25,bottom: 8),
                    child: Image(image: AssetImage("Image/phone.png")),
                  ),
                 Column(
                   children: [
                     Padding(
                       padding: const EdgeInsets.only(right: 22,top: 7),
                       child: Text("Extra ₹1,000 off*\non Sumsung Appliances",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                     ),
                     Text("With Flipkart Axis Bank Credit Card\nApply Now >",style: TextStyle(fontSize: 11,color: Colors.white),)
                   ],
                 )
                ],
              ),
            ),
          ),
          Divider(
            thickness: 3,
            color: Colors.grey.shade300,
            indent: 20,
            endIndent: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 13),
            child: Text("You might be also interested in",style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 7),
                      height: 140,
                      width: 150,
                      decoration:BoxDecoration(border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(7))
                      ) ,
                      child: Image(image: AssetImage("Image/shirt.png")),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 7),
                      height: 140,
                      width: 150,
                      decoration:BoxDecoration(border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(7))
                      ) ,
                      child: Image(image: AssetImage("Image/img_1.png")),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 7),
                      height: 140,
                      width: 150,
                      decoration:BoxDecoration(border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(7))
                      ) ,
                      child: Image(image: AssetImage("Image/img_2.png")),
                    )
                  ],
                ),
              ),

          )
        ],
      ),
    );
  }
}
