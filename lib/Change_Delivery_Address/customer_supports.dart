import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'customer_service_chat.dart';

class CustomerSupports extends StatefulWidget {
  const CustomerSupports({super.key});

  @override
  State<CustomerSupports> createState() => _CustomerSupportsState();
}

class _CustomerSupportsState extends State<CustomerSupports> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
          centerTitle: true,
          leading: Icon(Icons.arrow_back),
          title: Text("Customer Supports"),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40),
            Image.asset("asset/images/customer_supports.png"),
            Padding(
              padding: EdgeInsets.only(top: 50),
              child: Container(height: 70,width: 350,decoration: BoxDecoration(border: Border.fromBorderSide(BorderSide(color: Colors.grey)),borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: ListTile(
                    leading: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Image.asset("asset/images/gst.png"),
                    ),
                    title: Text("What issue are you facing ?",style: TextStyle(fontSize: 19),),
                    subtitle: Text("I want help with new Gst changes",style: TextStyle(fontSize: 13),),
                    contentPadding: EdgeInsets.all(0),
                    trailing: Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Icon(CupertinoIcons.right_chevron),
                    ),
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CustomerServiceChat(),)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Container(height: 70,width: 350,decoration: BoxDecoration(border: Border.fromBorderSide(BorderSide(color: Colors.grey)),borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: ListTile(
                    leading: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Image.asset("asset/images/manage_order.png"),
                    ),
                    title: Text("I want to manage my order",style: TextStyle(fontSize: 19),),
                    subtitle: Text("View ,cancel or return an order",style: TextStyle(fontSize: 13),),
                    contentPadding: EdgeInsets.all(0),
                    trailing: Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Icon(CupertinoIcons.right_chevron),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Container(height: 70,width: 350,decoration: BoxDecoration(border: Border.fromBorderSide(BorderSide(color: Colors.grey)),borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: ListTile(
                    leading: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Image.asset("asset/images/return.png"),
                    ),
                    title: Text("I want help with return & refunds",style: TextStyle(fontSize: 15.9),),
                    subtitle: Text("Manage and track returns",style: TextStyle(fontSize: 13),),
                    contentPadding: EdgeInsets.all(0),
                    trailing: Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Icon(CupertinoIcons.right_chevron),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Container(height: 70,width: 350,decoration: BoxDecoration(border: Border.fromBorderSide(BorderSide(color: Colors.grey)),borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: ListTile(
                    leading: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Image.asset("asset/images/other.png"),
                    ),
                    title: Text("I want help with other issues",style: TextStyle(fontSize: 18.2),),
                    subtitle: Text("Offers, payment ,shopSathi Plus & all other issues",style: TextStyle(fontSize: 13),),
                    contentPadding: EdgeInsets.all(0),
                    trailing: Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Icon(CupertinoIcons.right_chevron),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Container(height: 70,width: 350,decoration: BoxDecoration(border: Border.fromBorderSide(BorderSide(color: Colors.grey)),borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: ListTile(
                    leading: Image.asset("asset/images/seller.png"),
                    title: Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Text("I want to contact the seller",style: TextStyle(fontSize: 19),),
                    ),
                    contentPadding: EdgeInsets.all(0),
                    trailing: Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Icon(CupertinoIcons.right_chevron),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Container(height: 70,width: 350,decoration: BoxDecoration(border: Border.fromBorderSide(BorderSide(color: Colors.grey)),borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: ListTile(
                    leading: Image.asset("asset/images/browse_help.png"),
                    title: Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Text("Browse Help Topics",style: TextStyle(fontSize: 19),),
                    ),
                    contentPadding: EdgeInsets.all(0),
                    trailing: Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Icon(CupertinoIcons.right_chevron),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
