import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final List<Map<String, dynamic>> products = [
    {
      "img": "assets/image/girlhis.png",
      "brand": "Aurelia",
      "product": "Floral Printed Cotton Kurti",
      "price": 799,
      "rating": 4.5,
      "date": "April 06"
    },
    {
      "img": "assets/image/girl_history.png",
      "brand": "Biba",
      "product": "Designer Kurti Set",
      "price": 999,
      "rating": 4.2,
      "date": "March 28"
    },
    {
      "img": "assets/image/girlhis4.png",
      "brand": "Libas",
      "product": "Red Anarkali Dress",
      "price": 1199,
      "rating": 4.8,
      "date": "Feb 16"
    },
    {
      "img": "assets/image/girlhis.png",
      "brand": "W Women",
      "product": "Printed Yellow Kurti",
      "price": 699,
      "rating": 4.1,
      "date": "May 11"
    },
    {
      "img": "assets/image/girlhis.png",
      "brand": "Global Desi",
      "product": "Modern Indo-Western Top",
      "price": 899,
      "rating": 4.3,
      "date": "Jan 08"
    },
  ];

  // ⭐ PRODUCT CARD (Responsive + No Overflow)
  Widget buildProductCard(Map<String, dynamic> data) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 14, vertical: 4),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: Offset(0, 4),
          )
        ],
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // IMAGE
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              height: 150,
              width: 135,
              decoration: BoxDecoration(color: Colors.orange.shade100),
              child: Image.asset(data["img"], fit: BoxFit.cover),
            ),
          ),

          SizedBox(width: 14),

          // TEXT CONTENT
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Brand: ${data["brand"]}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

                SizedBox(height: 3),

                Text(
                  data["product"],
                  style: TextStyle(color: Colors.grey.shade700, fontSize: 14),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

                SizedBox(height: 6),

                Text(
                  "Price: ₹${data["price"]}",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),

                SizedBox(height: 8),

                RatingBar.builder(
                  initialRating: data["rating"],
                  minRating: 1,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 22,
                  itemBuilder: (c, _) => Icon(Icons.star, color: Colors.amber),
                  onRatingUpdate: (v) {},
                ),

                SizedBox(height: 14),

                Row(
                  children: [
                    // DATE
                    Expanded(
                      child: Container(
                        height: 34,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey.shade100,
                        ),
                        child: Center(
                          child: Text(
                            data["date"],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(width: 10),

                    // REVIEW BUTTON
                    Expanded(
                      child: Container(
                        height: 34,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.blueAccent),
                        ),
                        child: Center(
                          child: Text(
                            "Review",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        shadowColor: Colors.black.withOpacity(0.2),
        backgroundColor: Colors.white,
        title: Text(
          "History",
          style: TextStyle(
            color: Colors.blueAccent,
            fontWeight: FontWeight.bold,
            fontSize: width * 0.055,
          ),
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: CircleAvatar(
            backgroundColor: Colors.blue.shade50,
            child: Icon(Icons.person, size: 32, color: Colors.blueAccent),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: CircleAvatar(
              backgroundColor: Colors.blue.shade50,
              child: Icon(Icons.filter_list, size: 28, color: Colors.blue),
            ),
          ),
        ],
      ),

      body: Column(
        children: [
          // SEARCH BAR
          Padding(
            padding: const EdgeInsets.all(14),
            child: Container(
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  )
                ],
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.grey),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search purchase history...",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(bottom: 10),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return buildProductCard(products[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
