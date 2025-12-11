import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class OrderDetailsScreen2 extends StatefulWidget {
  const OrderDetailsScreen2({super.key});

  @override
  State<OrderDetailsScreen2> createState() => _OrderDetailsScreen2State();
}

class _OrderDetailsScreen2State extends State<OrderDetailsScreen2> {
  // 🔵 Sari Names
  List<String> sariNames = [
    "Banarasi Silk",
    "Kanjivaram Saree",
    "Cotton Saree",
    "Chiffon Saree",
    "Designer Saree"
  ];

  // 🔵 Sari Images (ADD THIS)
  List<String> sariImages = [
    "Image/img_31.png",
    "Image/img_32.png",
    "Image/sari2.png",
    "Image/sari3.png",
    "Image/sari4.png"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ORDER DETAILS",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.all(.5),
              child: Card(
                margin: EdgeInsets.zero,
                color: Colors.white,
                elevation: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 19),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            height: 100,
                            width: 90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.red,
                            ),
                            child: Image.asset(
                              "Image/girlhis.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(width: 10),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Order # 2343434...\nBahrain hijab diamond",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "Free Size * Pripaid\nOnly wrong/defect item returns",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),

                      Icon(Icons.arrow_forward_ios,
                          color: Colors.grey.shade600, size: 20),
                    ],
                  ),
                ),
              ),
            ),

            // ⭐ Rating Card
            Padding(
              padding: const EdgeInsets.all(2),
              child: Card(
                margin: EdgeInsets.zero,
                elevation: 1,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RatingBar.builder(
                            initialRating: 3,
                            minRating: 1,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 30,
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {},
                          ),

                          OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              side: BorderSide(
                                color: Colors.blue,
                                width: 2,
                              ),
                            ),
                            child: Text("Edit Review",
                                style: TextStyle(color: Colors.blueAccent)),
                          ),
                        ],
                      ),

                      SizedBox(height: 10),

                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.green.shade300,
                            child: Icon(Icons.save, color: Colors.white),
                          ),
                          SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Delivered Early",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Text(
                                "Fri, 07 Nov",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),

                      SizedBox(height: 12),

                      Container(
                        height: 34,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.green.shade100,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Center(
                          child: Text(
                            "Yoy! Your order delivered in just 5 days",
                            style: TextStyle(color: Colors.grey.shade600),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // ⭐ Address Card
            Card(
              margin: EdgeInsets.zero,
              color: Colors.white,
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.location_on, color: Colors.blueAccent),
                          SizedBox(width: 8),
                          Text(
                            "Delivery Address",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ],
                      ),

                      SizedBox(height: 10),

                      Text(
                        "Rohit\nkaituka lachhi, ps amnour, bihar, 841460\n92623117532",
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 14,
                        ),
                      ),
                    ]),
              ),
            ),

            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.only(right: 260),
              child: Text(
                "Recently Viewed",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),

            SizedBox(height: 10),

            // ⭐ Recently Viewed — (UPDATED)
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(sariNames.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.all(2),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: SizedBox(
                            height: 160,
                            width: 140,
                            child: Image.asset(
                              sariImages[index],   // ⭐ Changed here
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 5),

                        Text(sariNames[index])
                      ],
                    ),
                  );
                }),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  child: Text(
                    "Total Product Price",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20, top: 20),
                  child: Text("\$500",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                )
              ],
            ),

            SizedBox(height: 12),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Colors.grey.shade200,
                elevation: 1,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.circle_outlined,
                          size: 20, color: Colors.grey),
                      Text("\$500",
                          style: TextStyle(fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
