import 'package:flutter/material.dart';

import '../Change Delivery Address/product_screen.dart';


class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProductScreen(),));
                },
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children:  [
                      SizedBox(width: 10),
                      Icon(Icons.search, color: Colors.grey),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Search for products, brands...",
                            hintStyle:
                            TextStyle(color: Colors.grey, fontSize: 15),
                            border: InputBorder.none,
                          ),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ProductScreen(),));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
             SizedBox(width: 8),
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.mic, color: Colors.white, size: 22),
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text(  "Your Recent Searches",
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                _buildSearchChip("Shoes"),
                _buildSearchChip("T-shirt"),
                _buildSearchChip("Watch"),
                _buildSearchChip("Mobile"),
                _buildSearchChip("Saree"),
              ],
            ),
            const SizedBox(height: 30),
            const Text(
              "Popular Searches",
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(height: 15),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                _buildPopularChip(Icons.shopping_bag, "Kurti Set", Colors.pink),
                _buildPopularChip(Icons.access_time, "Watch", Colors.orange),
                _buildPopularChip(Icons.face_retouching_natural, "Earrings", Colors.purple),
                _buildPopularChip(Icons.shopping_basket, "Sweater", Colors.green),
                _buildPopularChip(Icons.emoji_people, "Short Kurti", Colors.red),
                _buildPopularChip(Icons.checkroom, "Jacket", Colors.teal),

              ],
            ),
            const SizedBox(height: 40),
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                "images/img.png",
                fit: BoxFit.cover,
                width: double.infinity,
                height: 180,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchChip(String text) {
    return Chip(
      label: Text(text,
          style: const TextStyle(color: Colors.black, fontSize: 14)),
      backgroundColor: Colors.white,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        side: BorderSide(color: Colors.blueAccent),
      ),
    );
  }

  Widget _buildPopularChip(IconData icon, String text,Color iconColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: iconColor, size: 18),
           SizedBox(width: 6),
          Text(text, style:  TextStyle(fontSize: 14, color: Colors.black)),
        ],
      ),
    );
  }
}
