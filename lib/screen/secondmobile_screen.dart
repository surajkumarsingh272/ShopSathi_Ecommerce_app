
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/mobile_provider.dart';


class SecondMobileScreen extends StatefulWidget {
  final String id;
  const SecondMobileScreen({super.key, required this.id});

  @override
  State<SecondMobileScreen> createState() => _SecondMobileScreenState();
}

class _SecondMobileScreenState extends State<SecondMobileScreen> {
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
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(width * 0.04),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Colors.grey.shade300)),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "₹$price",
                    style: TextStyle(
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: width * 0.03),
            Expanded(
              child: InkWell(
                onTap: () {
                },
                child: Container(
                  height: height * 0.06,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(width * 0.03),
                  ),
                  child: Center(
                    child: Text(
                      "Buy now",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: width * 0.045,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Bar
            Container(
              width: width,
              padding: EdgeInsets.only(top: height * 0.06, bottom: height * 0.03),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Row(
                children: [
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.arrow_back, color: Colors.white, size: 28),
                  ),
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
                          Text(
                            "Search for products",
                            style: TextStyle(color: Colors.grey),
                          ),
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

            // Product Image
            Container(
              height: height * 0.32,
              margin: EdgeInsets.symmetric(horizontal: width * 0.02),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(width * 0.03),
                border: Border.all(color: Colors.black26),
                image: DecorationImage(
                  image: productImage.isNotEmpty ? NetworkImage(productImage) : NetworkImage('https://via.placeholder.com/300'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: height * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.04),
              child:  Text(
                "Selected Color: ",
                style: TextStyle(fontSize: width * 0.05, color: Colors.black),
              ),
            ),
            SizedBox(height: height * 0.02),

            // Colors
            SizedBox(
              height: height * 0.1,
              child: ListView.builder(
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
            SizedBox(height: height * 0.028),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.04),
              child: Text("Variant: 256 GB + 8 GB",
                style: TextStyle(fontSize: width * 0.043, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: height*0.02,),
            SizedBox(
              height: height * 0.10,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: width * 0.04, right: width * 0.02),
                      padding: EdgeInsets.all(width * 0.03),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width * 0.03),
                        border: Border.all(color: Colors.black12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("256 GB + 12 GB",style: TextStyle(fontSize: width * 0.035, fontWeight: FontWeight.bold)),
                          SizedBox(height: 4),
                          Text("₹$price",style: TextStyle(fontSize: width * 0.035, fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(right: width * 0.04),
                      padding: EdgeInsets.all(width * 0.03),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width * 0.03),
                        border: Border.all(color: Colors.black12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("128 GB + 8 GB",style: TextStyle(fontSize: width * 0.035, fontWeight: FontWeight.bold)),
                          SizedBox(height: 4),
                          Text("₹$price",style: TextStyle(fontSize: width * 0.035, fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:EdgeInsets.symmetric(horizontal: width * 0.04,vertical: height*0.02),
              child:Text("Product highlights",style: TextStyle(fontSize: width * 0.06, fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.04),
              child: Column(
                children:[
                  SizedBox(height:height*0.01),
                  Row(
                    children: [
                      Container(
                        height: 38,
                        width: 38,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(Icons.memory, size: 20),
                      ),
                      SizedBox(width: 16),
                      Expanded(child: Text("8 GB RAM")),
                      Expanded(child: Text("256 GB ROM", textAlign: TextAlign.right)),
                    ],
                  ),
                  SizedBox(height:height*0.04),
                  Row(
                    children: [
                      Container(
                        height: 38,
                        width: 38,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(Icons.speed, size: 20),
                      ),
                      SizedBox(width: 16),
                      Expanded(child: Text("Dimensity 7400")),
                      Expanded(child: Text("2.5 GHz Clock", textAlign: TextAlign.right)),
                    ],
                  ),
                  SizedBox(height:height*0.04),
                  Row(
                    children: [
                      Container(
                        height: 38,
                        width: 38,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(Icons.camera_alt, size: 20),
                      ),
                      SizedBox(width: 16),
                      Expanded(child: Text("50MP + 13MP Rear Camera")),
                    ],
                  ),
                  SizedBox(height:height*0.04),
                  Row(
                    children: [
                      Container(
                        height: 38,
                        width: 38,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(Icons.camera_front, size: 20),
                      ),
                      SizedBox(width: 16),
                      Expanded(child: Text("32MP Front Camera")),
                    ],
                  ),
                  SizedBox(height:height*0.04),
                  Row(
                    children: [
                      Container(
                        height: 38,
                        width: 38,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(Icons.phone_android, size: 20),
                      ),
                      SizedBox(width: 16),
                      Expanded(child: Text("6.67 inch Super HD+ 1.5K Display")),
                    ],
                  ),
                  SizedBox(height:height*0.04),
                  Row(
                    children: [
                      Container(
                        height: 38,
                        width: 38,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(Icons.battery_5_bar, size: 20),
                      ),
                      SizedBox(width: 16),
                      Expanded(child: Text("5500 mAh Battery")),
                    ],
                  ),
                  SizedBox(height:height*0.09),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
