import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'customer_supports.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset("asset/images/contact_us.png",height: 250,),
              SizedBox(height: 80,
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: ListTile(
                      leading: Icon(Icons.headphones,color: Colors.black,),
                      title: Text("Customer Services",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                      trailing: Icon(CupertinoIcons.right_chevron,color: Colors.black,),
                      onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CustomerSupports(),));
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 80,
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: ListTile(
                      leading: Image.asset("asset/images/whatsapp.png",height: 22,color: Colors.black,),
                      title: Text("WhatsApp",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                      trailing: Icon(CupertinoIcons.right_chevron,color: Colors.black,),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 80,
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: ListTile(
                      leading: Image.asset("asset/images/internet.png",height: 22,color: Colors.black,),
                      title: Text("Website",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                      trailing: Icon(CupertinoIcons.right_chevron,color: Colors.black,),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 80,
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: ListTile(
                      leading: Icon(Icons.facebook,color: Colors.black,),
                      title: Text("Facebook",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                      trailing: Icon(CupertinoIcons.right_chevron,color: Colors.black,),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 80,
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: ListTile(
                      leading: Image.asset("asset/images/twitter.png",height: 22,color: Colors.black,),
                      title: Text("Twitter",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                      trailing: Icon(CupertinoIcons.right_chevron,color: Colors.black,),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 80,
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: ListTile(
                      leading: Image.asset("asset/images/instagram.png",height: 22,color: Colors.black,),
                      title: Text("Instagram",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                      trailing: Icon(CupertinoIcons.right_chevron,color: Colors.black,),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
