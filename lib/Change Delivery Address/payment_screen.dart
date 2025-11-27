import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_sathi_app/Change%20Delivery%20Address/provider_class.dart';
import 'package:shop_sathi_app/Change%20Delivery%20Address/success_screen.dart';

import 'change_delivery_screen.dart';


class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  int? selectedMethod;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProviderClass>(context);
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
              child: Row(
                children: [
                  CircleAvatar(backgroundColor: Colors.grey[200], child: IconButton(onPressed: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ChangeDeliveryScreen(),));}, icon: Icon(Icons.arrow_back)),),
                  SizedBox(width: 12),
                  Text("Payment Method", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600,),)
                ],
              ),
            ),

            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Icon(Icons.check_circle_outline_outlined, color: Colors.blueAccent, size: 28),
                  Expanded(
                    child: Container(
                      height: 2,
                      color: Colors.blue,
                    ),
                  ),
                  CircleAvatar(radius: 14, backgroundColor: Colors.blueAccent, child: Text("2", style: TextStyle(color: Colors.white, fontSize: 12)),),

                  Expanded(child: Container(height: 2, color: Colors.blue,),),
                  CircleAvatar(radius: 14, backgroundColor: Colors.blueAccent, child: Text("3", style: TextStyle(color: Colors.white, fontSize: 12)),),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Divider(color: Colors.blueAccent,),

            SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Select payment methods", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),),
                    SizedBox(height: 10,),
                    ClipRRect(borderRadius: BorderRadius.circular(5), child: Container(height: 60,width: 320,color: Colors.grey.shade50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              Text("\$1,601",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Container(height: 30,width: 2,color: Colors.grey,),
                              ),
                              Text("Cash on Delivery",style: TextStyle(color: Colors.grey,fontSize: 18,fontWeight: FontWeight.bold),),
                              Spacer(),
                              Radio(value: 1, groupValue: provider.selectedMethod, onChanged: (value) {
                                provider.selectAddress(value!);
                              },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    ),),
                    SizedBox(height: 10,),
                    ClipRRect(borderRadius: BorderRadius.circular(1), child: Container(height: 250,width: 320,decoration: BoxDecoration(border: Border.fromBorderSide(BorderSide(color: Colors.grey.shade300))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [SizedBox(height: 20,),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Text("\$1,601",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                      decoration: BoxDecoration(
                                        color: Colors.green.shade100,
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Text("Save \$33", style: TextStyle(color: Colors.green[800], fontWeight: FontWeight.w600),),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: Container(height: 50,width: 2,color: Colors.grey,),
                                ),
                                Text("Pay Online",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                                Spacer(),
                                Radio(value: 2, groupValue: provider.selectedMethod, onChanged: (value) {
                                  provider.selectAddress(value!);
                                },
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20,top: 20),
                            child: Text("Last Used",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20,top: 10),
                            child: Row(
                              children: [
                                CircleAvatar(radius: 12, backgroundColor: Colors.purple,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 2),
                                    child: Text("पे",style: TextStyle(color: Colors.white),),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text("Phone Pe",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                ),
                                Spacer(),
                                Radio(value: 3, groupValue: provider.selectedMethod, onChanged: (value) {
                                  provider.selectAddress(value!);
                                },
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 53),
                            child: Text("Upto \$100 cashback on Rpay \n Credit Card on UPI using PhonePe",style: TextStyle(color: Colors.green,fontSize: 12,fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                    ),),
                    SizedBox(height: 15),
                    ClipRRect(borderRadius: BorderRadius.circular(5), child: Container(height: 60,width: 320,color: Colors.grey.shade50,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 4),
                                  decoration: BoxDecoration(
                                    border: Border.fromBorderSide(BorderSide(color: Colors.grey,width: 2)),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text("UPI", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text("Pay by any UpI App",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                ),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Icon(Icons.keyboard_arrow_down_outlined,size: 30,),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30,top: 2),
                            child: Text("Offers Available",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),),
                          )
                        ],
                      ),
                    ),),
                    SizedBox(height: 18),
                    ClipRRect(borderRadius: BorderRadius.circular(5), child: Container(height: 60,width: 320,color: Colors.grey.shade50,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text("Wallet",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20,top: 2),
                                  child: Text("Offers Available",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),),
                                ),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Icon(Icons.keyboard_arrow_down_outlined,size: 30,),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),),
                    SizedBox(height: 18),
                    ClipRRect(borderRadius: BorderRadius.circular(5), child: Container(height: 60,width: 320,color: Colors.grey.shade50,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text("Debit/Credit",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20,top: 2),
                                  child: Text("Offers Available",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),),
                                ),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Icon(Icons.keyboard_arrow_down_outlined,size: 30,),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),),
                  ],
                ),
              ),
            ),

            Container(
              height: 80,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: Colors.grey)),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("\$250",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),

                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.green.shade100,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text("\$33 OFF", style: TextStyle(color: Colors.green[800], fontWeight: FontWeight.w600),),
                      )
                    ],
                  ),

                  SizedBox(height: 48, width: 150, child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),), onPressed: () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SuccessScreen(),));}, child: Text("Continue", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),),)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
