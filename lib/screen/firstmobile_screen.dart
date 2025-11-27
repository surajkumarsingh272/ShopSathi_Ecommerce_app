import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/mobile_provider.dart';

class FirstMobileScreen extends StatefulWidget {
  final String id;
  const FirstMobileScreen({super.key,required this.id});
  @override
  State<FirstMobileScreen> createState() => _FirstMobileScreenState();
}

class _FirstMobileScreenState extends State<FirstMobileScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<MobileProvider>(context, listen: false).getData(widget.id);
    });
  }
  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final provider = Provider.of<MobileProvider>(context);

    final product = provider.mobileData?.product;
    final price = product?.price ?? "0";
    final productImage = product?.image ?? "";
    final colors = provider.mobileData?.colors ?? [];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(width: width,
              padding: EdgeInsets.only(top: height * 0.06, bottom: height * 0.03),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30),
                ),
              ),
              child: Row(
                children: [
                  SizedBox(width: 10),
                  Icon(Icons.arrow_back, color: Colors.white, size: 28),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 12),
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.search, color: Colors.grey),
                          SizedBox(width: 10),
                          Text("Search for products",style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ),
                  ),
                  Icon(Icons.mic, color: Colors.white, size: 28),
                  SizedBox(width: 10),
                ],
              ),
            ),
            SizedBox(height: height * 0.015),
            Container(
              height: height * 0.32,
              margin: EdgeInsets.symmetric(horizontal: width * 0.02),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(width * 0.03),
                border:Border.all( color: Colors.black26) ,
                image: DecorationImage(image:productImage.isNotEmpty ? NetworkImage(productImage) : NetworkImage("'https://via.placeholder.com/300'"),fit: BoxFit.cover),
              ),
            ),
            SizedBox(height: height * 0.02),
            Padding(
              padding:EdgeInsets.symmetric(horizontal: width * 0.04),
              child:Text("Selected Color: Midnight Blue",style: TextStyle(fontSize: width * 0.05, color: Colors.black),),),
            SizedBox(height: height * 0.02),
            SizedBox(
              height:height * 0.1,
              width: width* 0.9,
              child:ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                itemCount: colors.isNotEmpty ? colors.length : 5,
                itemBuilder: (context, index) {
                  if (colors.isEmpty) {
                    return Container(
                      width: width * 0.22,
                      margin: EdgeInsets.only(right: width * 0.03),
                      padding: EdgeInsets.all(width * 0.02),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width * 0.03),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Center(child: Text("No colors")),
                    );
                  }
                  final color = colors[index];
                  return Container(
                    width: width * 0.22,
                    margin: EdgeInsets.only(right: width * 0.03),
                    padding: EdgeInsets.all(width * 0.02),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width * 0.03),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child:  Container(
                      decoration: BoxDecoration(
                        color: Color(int.parse(color.colorcode.replaceAll("#", "0xff"))),
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: height * 0.025),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.04),
              child: Text("Premium Phones",style: TextStyle(fontSize: width * 0.05,fontWeight: FontWeight.bold)),),
            SizedBox(height: height * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Wrap(
                spacing: 10,
                runSpacing: 15,
                children: List.generate(10, (index) {
                  return Container(
                    width: width * 0.44,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child:Image( height: width * 0.44,width: width * 0.44,fit: BoxFit.cover,
                                image: productImage.isNotEmpty ? NetworkImage(productImage) : NetworkImage("https://via.placeholder.com/300"))
                        ),
                        SizedBox(height: 8),
                        Text("$product",style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: 3),
                        Text("$price",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}