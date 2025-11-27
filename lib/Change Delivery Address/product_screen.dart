import 'package:flutter/material.dart';

import 'notification_screen.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          backgroundColor: Colors.blueAccent,
          centerTitle: true,
          automaticallyImplyLeading: false,

          leading: Align(alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30), child: Container(height: 35, width: 35, color: Colors.white, child: Icon(Icons.arrow_back, color: Colors.black),),
                  ),
                ],
              ),
            ),
          ),

          flexibleSpace: Padding(
            padding: const EdgeInsets.only(left: 70, right: 70, bottom: 20),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 45,
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search, size: 20),
                    hintText: "Search address by name",
                    hintStyle: TextStyle(fontSize: 13),
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10,top: 15),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.keyboard_voice, color: Colors.white),
              ),
            )
          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 5,left: 5,top: 5),
              child: GestureDetector( onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NotificationScreen(),)),
                child: Container(height: 99,
                  width: double.infinity,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 6, offset: const Offset(0, 3),),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10), child: Card(color: Colors.grey, child: Image.asset("asset/images/comos.png", height: 85, width: 85, fit: BoxFit.cover,)),
                      ),
                
                      const SizedBox(width: 12),
                
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10,),
                            Text("Comos Fan Portable 3 Power Speed (color blace)", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, height: 1.3,),),
                            SizedBox(height: 6),
                
                            Row(
                              children: const [
                                Icon(Icons.arrow_downward, size: 16, color: Colors.green),
                                SizedBox(width: 4),
                                Text("40%", style: TextStyle(fontSize: 13, color: Colors.green, fontWeight: FontWeight.bold,),),
                                SizedBox(width: 6),
                                Text("₹ 2299", style: TextStyle(fontSize: 12, decoration: TextDecoration.lineThrough, color: Colors.grey,),),
                                SizedBox(width: 8),
                                Text("₹ 300", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold,),),
                              ],
                            ),
                
                            SizedBox(height: 6),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: const [
                                    Icon(Icons.star, size: 16, color: Colors.green),
                                    Icon(Icons.star, size: 16, color: Colors.green),
                                    Icon(Icons.star, size: 16, color: Colors.green),
                                    Icon(Icons.star, size: 16, color: Colors.green),
                                    Icon(Icons.star_border, size: 16, color: Colors.green),
                                  ],
                                ),
                                Text("Success", style: TextStyle(color: Colors.green, fontSize: 14, fontWeight: FontWeight.bold,),),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 5,left: 5,top: 5),
              child: Container(height: 99,
                width: double.infinity,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 6, offset: const Offset(0, 3),),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10), child: Card(color: Colors.grey, child: Image.asset("asset/images/comos.png", height: 85, width: 85, fit: BoxFit.cover,)),
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10,),
                          Text("Comos Fan Portable 3 Power Speed (color blace)", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, height: 1.3,),),
                          SizedBox(height: 6),

                          Row(
                            children: const [
                              Icon(Icons.arrow_downward, size: 16, color: Colors.green),
                              SizedBox(width: 4),
                              Text("40%", style: TextStyle(fontSize: 13, color: Colors.green, fontWeight: FontWeight.bold,),),
                              SizedBox(width: 6),
                              Text("₹ 2299", style: TextStyle(fontSize: 12, decoration: TextDecoration.lineThrough, color: Colors.grey,),),
                              SizedBox(width: 8),
                              Text("₹ 300", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold,),),
                            ],
                          ),

                          SizedBox(height: 6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: const [
                                  Icon(Icons.star, size: 16, color: Colors.green),
                                  Icon(Icons.star, size: 16, color: Colors.green),
                                  Icon(Icons.star, size: 16, color: Colors.green),
                                  Icon(Icons.star, size: 16, color: Colors.green),
                                  Icon(Icons.star_border, size: 16, color: Colors.green),
                                ],
                              ),
                              Text("Success", style: TextStyle(color: Colors.green, fontSize: 14, fontWeight: FontWeight.bold,),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 5,left: 5,top: 5),
              child: Container(height: 99,
                width: double.infinity,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 6, offset: const Offset(0, 3),),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10), child: Card(color: Colors.grey, child: Image.asset("asset/images/comos.png", height: 85, width: 85, fit: BoxFit.cover,)),
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10,),
                          Text("Comos Fan Portable 3 Power Speed (color blace)", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, height: 1.3,),),
                          SizedBox(height: 6),

                          Row(
                            children: const [
                              Icon(Icons.arrow_downward, size: 16, color: Colors.green),
                              SizedBox(width: 4),
                              Text("40%", style: TextStyle(fontSize: 13, color: Colors.green, fontWeight: FontWeight.bold,),),
                              SizedBox(width: 6),
                              Text("₹ 2299", style: TextStyle(fontSize: 12, decoration: TextDecoration.lineThrough, color: Colors.grey,),),
                              SizedBox(width: 8),
                              Text("₹ 300", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold,),),
                            ],
                          ),

                          SizedBox(height: 6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: const [
                                  Icon(Icons.star, size: 16, color: Colors.green),
                                  Icon(Icons.star, size: 16, color: Colors.green),
                                  Icon(Icons.star, size: 16, color: Colors.green),
                                  Icon(Icons.star, size: 16, color: Colors.green),
                                  Icon(Icons.star_border, size: 16, color: Colors.green),
                                ],
                              ),
                              Text("Success", style: TextStyle(color: Colors.green, fontSize: 14, fontWeight: FontWeight.bold,),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 5,left: 5,top: 5),
              child: Container(height: 99,
                width: double.infinity,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 6, offset: const Offset(0, 3),),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10), child: Card(color: Colors.grey, child: Image.asset("asset/images/comos.png", height: 85, width: 85, fit: BoxFit.cover,)),
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10,),
                          Text("Comos Fan Portable 3 Power Speed (color blace)", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, height: 1.3,),),
                          SizedBox(height: 6),

                          Row(
                            children: const [
                              Icon(Icons.arrow_downward, size: 16, color: Colors.green),
                              SizedBox(width: 4),
                              Text("40%", style: TextStyle(fontSize: 13, color: Colors.green, fontWeight: FontWeight.bold,),),
                              SizedBox(width: 6),
                              Text("₹ 2299", style: TextStyle(fontSize: 12, decoration: TextDecoration.lineThrough, color: Colors.grey,),),
                              SizedBox(width: 8),
                              Text("₹ 300", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold,),),
                            ],
                          ),

                          SizedBox(height: 6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: const [
                                  Icon(Icons.star, size: 16, color: Colors.green),
                                  Icon(Icons.star, size: 16, color: Colors.green),
                                  Icon(Icons.star, size: 16, color: Colors.green),
                                  Icon(Icons.star, size: 16, color: Colors.green),
                                  Icon(Icons.star_border, size: 16, color: Colors.green),
                                ],
                              ),
                              Text("Pending", style: TextStyle(color: Colors.orange, fontSize: 14, fontWeight: FontWeight.bold,),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 5,left: 5,top: 5),
              child: Container(height: 99,
                width: double.infinity,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 6, offset: const Offset(0, 3),),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10), child: Card(color: Colors.grey, child: Image.asset("asset/images/comos.png", height: 85, width: 85, fit: BoxFit.cover,)),
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10,),
                          Text("Comos Fan Portable 3 Power Speed (color blace)", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, height: 1.3,),),
                          SizedBox(height: 6),

                          Row(
                            children: const [
                              Icon(Icons.arrow_downward, size: 16, color: Colors.green),
                              SizedBox(width: 4),
                              Text("40%", style: TextStyle(fontSize: 13, color: Colors.green, fontWeight: FontWeight.bold,),),
                              SizedBox(width: 6),
                              Text("₹ 2299", style: TextStyle(fontSize: 12, decoration: TextDecoration.lineThrough, color: Colors.grey,),),
                              SizedBox(width: 8),
                              Text("₹ 300", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold,),),
                            ],
                          ),

                          SizedBox(height: 6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: const [
                                  Icon(Icons.star, size: 16, color: Colors.green),
                                  Icon(Icons.star, size: 16, color: Colors.green),
                                  Icon(Icons.star, size: 16, color: Colors.green),
                                  Icon(Icons.star, size: 16, color: Colors.green),
                                  Icon(Icons.star_border, size: 16, color: Colors.green),
                                ],
                              ),
                              Text("Cancel", style: TextStyle(color: Colors.red, fontSize: 14, fontWeight: FontWeight.bold,),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 5,left: 5,top: 5),
              child: Container(height: 99,
                width: double.infinity,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 6, offset: const Offset(0, 3),),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10), child: Card(color: Colors.grey, child: Image.asset("asset/images/comos.png", height: 85, width: 85, fit: BoxFit.cover,)),
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10,),
                          Text("Comos Fan Portable 3 Power Speed (color blace)", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, height: 1.3,),),
                          SizedBox(height: 6),

                          Row(
                            children: const [
                              Icon(Icons.arrow_downward, size: 16, color: Colors.green),
                              SizedBox(width: 4),
                              Text("40%", style: TextStyle(fontSize: 13, color: Colors.green, fontWeight: FontWeight.bold,),),
                              SizedBox(width: 6),
                              Text("₹ 2299", style: TextStyle(fontSize: 12, decoration: TextDecoration.lineThrough, color: Colors.grey,),),
                              SizedBox(width: 8),
                              Text("₹ 300", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold,),),
                            ],
                          ),

                          SizedBox(height: 6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: const [
                                  Icon(Icons.star, size: 16, color: Colors.green),
                                  Icon(Icons.star, size: 16, color: Colors.green),
                                  Icon(Icons.star, size: 16, color: Colors.green),
                                  Icon(Icons.star, size: 16, color: Colors.green),
                                  Icon(Icons.star_border, size: 16, color: Colors.green),
                                ],
                              ),
                              Text("Cancel", style: TextStyle(color: Colors.red, fontSize: 14, fontWeight: FontWeight.bold,),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 5,left: 5,top: 5),
              child: Container(height: 99,
                width: double.infinity,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 6, offset: const Offset(0, 3),),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10), child: Card(color: Colors.grey, child: Image.asset("asset/images/comos.png", height: 85, width: 85, fit: BoxFit.cover,)),
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10,),
                          Text("Comos Fan Portable 3 Power Speed (color blace)", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, height: 1.3,),),
                          SizedBox(height: 6),

                          Row(
                            children: const [
                              Icon(Icons.arrow_downward, size: 16, color: Colors.green),
                              SizedBox(width: 4),
                              Text("40%", style: TextStyle(fontSize: 13, color: Colors.green, fontWeight: FontWeight.bold,),),
                              SizedBox(width: 6),
                              Text("₹ 2299", style: TextStyle(fontSize: 12, decoration: TextDecoration.lineThrough, color: Colors.grey,),),
                              SizedBox(width: 8),
                              Text("₹ 300", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold,),),
                            ],
                          ),

                          SizedBox(height: 6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: const [
                                  Icon(Icons.star, size: 16, color: Colors.green),
                                  Icon(Icons.star, size: 16, color: Colors.green),
                                  Icon(Icons.star, size: 16, color: Colors.green),
                                  Icon(Icons.star, size: 16, color: Colors.green),
                                  Icon(Icons.star_border, size: 16, color: Colors.green),
                                ],
                              ),
                              Text("Pending", style: TextStyle(color: Colors.orange, fontSize: 14, fontWeight: FontWeight.bold,),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 5,left: 5,top: 5),
              child: Container(height: 99,
                width: double.infinity,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 6, offset: const Offset(0, 3),),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10), child: Card(color: Colors.grey, child: Image.asset("asset/images/comos.png", height: 85, width: 85, fit: BoxFit.cover,)),
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10,),
                          Text("Comos Fan Portable 3 Power Speed (color blace)", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, height: 1.3,),),
                          SizedBox(height: 6),

                          Row(
                            children: const [
                              Icon(Icons.arrow_downward, size: 16, color: Colors.green),
                              SizedBox(width: 4),
                              Text("40%", style: TextStyle(fontSize: 13, color: Colors.green, fontWeight: FontWeight.bold,),),
                              SizedBox(width: 6),
                              Text("₹ 2299", style: TextStyle(fontSize: 12, decoration: TextDecoration.lineThrough, color: Colors.grey,),),
                              SizedBox(width: 8),
                              Text("₹ 300", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold,),),
                            ],
                          ),

                          SizedBox(height: 6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: const [
                                  Icon(Icons.star, size: 16, color: Colors.green),
                                  Icon(Icons.star, size: 16, color: Colors.green),
                                  Icon(Icons.star, size: 16, color: Colors.green),
                                  Icon(Icons.star, size: 16, color: Colors.green),
                                  Icon(Icons.star_border, size: 16, color: Colors.green),
                                ],
                              ),
                              Text("Success", style: TextStyle(color: Colors.green, fontSize: 14, fontWeight: FontWeight.bold,),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
