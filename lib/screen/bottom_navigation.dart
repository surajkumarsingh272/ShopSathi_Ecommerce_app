import 'package:flutter/material.dart';
import 'package:shop_sathi_app/screen/card_screen.dart';
import 'package:shop_sathi_app/screen/categories_screen.dart';
import 'package:shop_sathi_app/screen/home_screen.dart';
import 'package:shop_sathi_app/screen/product_wishlist.dart';
import 'package:shop_sathi_app/screen/profile_screen/profile_screen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
     HomeScreen(),
     CategoriesScreen(),
     CartScreen(),
     ProductWishlist(),
     ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 2)
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            navItem(Icons.home, "Home", 0),
            navItem(Icons.category, "Category", 1),
            GestureDetector(
              onTap: () {
                setState(() => _selectedIndex = 2);
              },
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.deepPurple.withOpacity(0.4),
                        blurRadius: 10)
                  ],
                ),
                child: Icon(Icons.shopping_cart,
                    color: Colors.white, size: 30),
              ),
            ),

            navItem(Icons.favorite, "Wishlist", 3),
            navItem(Icons.person, "Profile", 4),
          ],
        ),
      ),
    );
  }

  Widget navItem(IconData icon, String label, int index) {
    bool isActive = _selectedIndex == index;

    return InkWell(
      onTap: () {
        setState(() => _selectedIndex = index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 250),
            height: 4,
            width: isActive ? 20 : 0,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(height: 6),

          Icon(icon, size: isActive ? 30 : 26,color: isActive ? Colors.blue : Colors.grey,),
          Text(label,style: TextStyle(color: isActive ? Colors.blue : Colors.grey, fontSize: 12,)),
        ],
      ),
    );
  }
}
