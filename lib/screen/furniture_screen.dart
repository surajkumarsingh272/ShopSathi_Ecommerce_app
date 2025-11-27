
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FurnitureScreen extends StatefulWidget {
  const FurnitureScreen({super.key});

  @override
  State<FurnitureScreen> createState() => _FurnitureScreenState();
}

class _FurnitureScreenState extends State<FurnitureScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width  = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: height * 0.06, bottom: height * 0.03),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child:Row(
                children: [
                  SizedBox(width: 10),
                  Icon(Icons.arrow_back, color: Colors.white, size: 28),
                  Expanded(
                    child: Container(
                      height: 45,
                      margin: EdgeInsets.symmetric(horizontal: 12),
                      padding: EdgeInsets.symmetric(horizontal: 15),
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
            SizedBox(height: 15),
            Container(
              height: height * 0.22,
              width: width * 0.9,
              margin: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(image: AssetImage("assets/image/img_2.png"),fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 15),
            SizedBox(
              height: height * 0.14,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 15),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    width: width * 0.22,
                    margin: EdgeInsets.only(right: 12),
                    child: Column(
                      children: [
                        Container(
                          height: height * 0.09,
                          width: width * 0.22,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: AssetImage("assets/image/img_4.png"),fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text("Wedding",style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 15),
            SizedBox(
              height: height * 0.12,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 15),
                children: [
                  Container(
                    width: width * 0.6,
                    margin: EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black54),
                      image: DecorationImage(image: AssetImage("assets/image/img_5.png"),fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: width * 0.6,
                    margin: EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black54),
                      image: DecorationImage(
                        image: AssetImage("assets/image/img_6.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: width * 0.6,
                    margin: EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black54),
                      image: DecorationImage(
                        image: AssetImage("assets/image/img_7.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: width * 0.6,
                    margin: EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black54),
                      image: DecorationImage(
                        image: AssetImage("assets/image/img_8.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text("Deal of the day",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height:20),
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
                          child: Image.asset("assets/image/img_9.png", height: width * 0.44, width: width * 0.44,fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text("Savannah easy chair",style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: 3),
                        Text("\$290.00",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                      ],
                    ),
                  );
                }),
              ),
            ),
            SizedBox(height: 35),
          ],
        ),
      ),
    );
  }
}
