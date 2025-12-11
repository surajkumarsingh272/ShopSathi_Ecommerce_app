import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15))),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        leading: Icon(Icons.arrow_back),
        title: Text("About us",),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20,),
              Container(height: 240,width: 340,decoration: BoxDecoration(border: Border.fromBorderSide(BorderSide(color: Colors.grey)),borderRadius: BorderRadius.circular(5)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20, top: 20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Container(
                          height: 80,
                          width: 80,
                          color: Colors.grey,
                          child: Image.asset("asset/images/diagram 1.png"),
                        ),
                      ),
                    ),
        
                    SizedBox(width: 20),
        
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Our Story", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),),
                            SizedBox(height: 8),
                            Text("We are an online shopping\n app offering a wide range\n of products with excellent\n quality and competitive\n prices.", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14,),),
                            SizedBox(height: 20,),
                            MaterialButton(onPressed: (){},shape: OutlineInputBorder(),minWidth: 120,child: Text("Learn more"),)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 580,width: 350,
                child: Card(color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 120,width: 400,
                        child: Card(color: Colors.white,shape: RoundedRectangleBorder(),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Padding(
                                padding: EdgeInsets.only(left: 30,top: 10),
                                child: Text("Our Core Values",style: TextStyle(fontWeight: FontWeight.bold),),
                              ),
                             Row(
                               children: [
                                 Padding(
                                   padding: EdgeInsets.only(left: 30,top: 10),
                                   child: Container( height: 50,width: 50, decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),border: Border.fromBorderSide(BorderSide(color: Colors.orange))),
                                     child: Icon(Icons.favorite_border,color: Colors.orange,),
                                   ),
                                 ),
                                 Padding(
                                   padding: EdgeInsets.only(left: 30,top: 10),
                                   child: Container( height: 50,width: 50, decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),border: Border.fromBorderSide(BorderSide(color: Colors.orange))),
                                     child: Icon(Icons.star,color: Colors.orange,),
                                   ),
                                 ),
                                 Padding(
                                   padding: EdgeInsets.only(left: 30,top: 10),
                                   child: Container( height: 50,width: 50, decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),border: Border.fromBorderSide(BorderSide(color: Colors.orange))),
                                       child: Image.asset("asset/images/honesty.png",color: Colors.orange)
                                   ),
                                 ),
                               ],
                             )
                           ],
                         ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20,top: 8),
                        child: Text("Milestones & Trust",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20,top: 8),
                        child: Text("•  5 Million+ Happy Customers  • Delivered to 1000 Cities 4.5/5 App Rating",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),),
                      ),
                      ListTile(
                        leading: Icon(Icons.group), 
                        title: Text("Our Team",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                        trailing: Icon(CupertinoIcons.right_chevron),
                      ),
                      Divider(indent: 10,endIndent: 10,height: 0,),
                      ListTile(
                        leading: Image.asset("asset/images/terms.png",height: 22,width: 22,),
                        title: Text("Terms of Service",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                        trailing: Icon(CupertinoIcons.right_chevron),
                      ),
                      Divider(indent: 10,endIndent: 10,height: 0,),
                      ListTile(
                        leading: Icon(Icons.lock),
                        title: Text("Privacy Policy",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                        trailing: Icon(CupertinoIcons.right_chevron),
                      ),
                      Divider(indent: 10,endIndent: 10,height: 0,),
                      ListTile(
                        leading: Icon(Icons.help),
                        title: Text("Help Centre",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                        trailing: Icon(CupertinoIcons.right_chevron),
                      ),
                      Divider(indent: 10,endIndent: 10,height: 0,),
                      ListTile(
                        leading: Icon(Icons.account_circle_rounded),
                        title: Text("FAQs",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                        trailing: Icon(CupertinoIcons.right_chevron),
                      ),
                      Divider(indent: 10,endIndent: 10,height: 0,),
                      ListTile(
                        leading: Icon(Icons.shopping_bag_outlined),
                        title: Text("Careers",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                        trailing: Icon(CupertinoIcons.right_chevron),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(height: 50,
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.grey.shade300)), color: Colors.white,),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Follow Us",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 120),
                      child: Container( height: 30,width: 30, decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),border: Border.fromBorderSide(BorderSide(color: Colors.orange))),
                        child: Icon(Icons.facebook,color: Colors.orange,size: 20,),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Container( height: 30,width: 30, decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),border: Border.fromBorderSide(BorderSide(color: Colors.orange))),
                        child: Icon(Icons.close,color: Colors.orange,size: 20,),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Container( height: 30,width: 30, decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),border: Border.fromBorderSide(BorderSide(color: Colors.orange))),
                          child: Icon(Icons.call,color: Colors.orange,size: 20,)
                      ),
                    ),
                  ],
                )

              ],
            ),
          ],
        ),
      ),
    );
  }
}
