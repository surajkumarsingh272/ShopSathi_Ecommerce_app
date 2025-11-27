import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  int _selectedIndex = 0;

  // ⭐ Function to return image without list
  String getImageByIndex(int index) {
    switch (index) {
      case 0:
        return "Image/girl.png";
      case 1:
        return "Image/gir;histry2.png";
      case 2:
        return "Image/girlhis5.png";
      case 3:
        return "Image/girlhis5.png";
      case 4:
        return "Image/girl_history.png";
      default:
        return "Image/girl.png";
    }
  }

  // ⭐ Product Card Widget
  Widget productCard(String imgPath) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          // 🟠 IMAGE WITH CORNER CUT (UPDATED)
          Padding(
            padding: const EdgeInsets.all(11),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(7), // 🔥 Image rounded
              child: Container(
                height: 140,
                width: 110,
                color: Colors.orangeAccent,
                child: Image.asset(
                  imgPath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // 🟢 Text Section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Brand: Aurelia",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Product: Floral Printed Cotton Kurti",
                  style: TextStyle(color: Colors.grey[700]),
                ),
                SizedBox(height: 5),
                Text("Price: ₹799"),
                SizedBox(height: 5),

                // ⭐ Rating Bar
                RatingBar.builder(
                  initialRating: 4,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 22,
                  itemPadding: EdgeInsets.symmetric(horizontal: 1),
                  itemBuilder: (context, _) =>
                      Icon(Icons.star, color: Colors.amber),
                  onRatingUpdate: (rating) {},
                ),

                // ⭐ Date + Review Button Row
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 33,
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.grey.shade100,
                        ),
                        child: Center(
                          child: Text(
                            "Apri, 06",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 33,
                      width: 120,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent),
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                      ),
                      child: Center(
                        child: Text(
                          "Review",
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
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

  // ⭐ Bottom Navigation change
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // ⭐ Build UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Card(
                shape: CircleBorder(),
               child: Padding(
                 padding: const EdgeInsets.all(2),
                 child: Icon(Icons.account_circle_sharp,size: 45,color: Colors.blue,),
               ),
              ),
            ),
         //   CircleAvatar(child: Icon(Icons.account_circle_sharp, size: 45)),
            Padding(
              padding: const EdgeInsets.only(right: 150),
              child: Text("History",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            CircleAvatar(backgroundColor: Colors.white,child: Icon(Icons.filter_list, size: 30,color: Colors.blueAccent,),),
          ],
        ),
      ),

      // ⭐ Body
      body: Column(
        children: [
          // 🔍 Search Bar
          Padding(
            padding: const EdgeInsets.all(11),
            child: Container(
              height: 55,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.grey),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search here...",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ⭐ Scrollable Products
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return productCard(getImageByIndex(index));
              },
            ),
          ),
        ],
      ),

      // ⭐ Bottom Navigation bar
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.purple, Colors.blue]),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.blue,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Message'),
            BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
            BottomNavigationBarItem(
                icon: Icon(Icons.card_travel), label: 'Cart'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_sharp), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
