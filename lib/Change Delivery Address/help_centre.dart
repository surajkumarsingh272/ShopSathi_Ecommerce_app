import 'package:flutter/material.dart';

import 'FAQs_screen.dart';
import 'contact_us_screen.dart';

class HelpCentre extends StatelessWidget {
  const HelpCentre({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: AppBar(
            backgroundColor: Colors.blueAccent,
            automaticallyImplyLeading: false,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(15),
              ),
            ),

            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.arrow_back, color: Colors.white),
                Text("Help Center", style: TextStyle(fontSize: 20, color: Colors.white),),
                Icon(Icons.more_vert, color: Colors.white),
              ],
            ),

            bottom: PreferredSize(
              preferredSize: Size.fromHeight(45),
              child: Padding(
                padding: EdgeInsets.only(bottom: 0),
                child: TabBar(
                  indicatorColor: Colors.white,
                  indicatorWeight: 3,
                  dividerColor: Colors.transparent,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.white70,
                  labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),
                  indicator: UnderlineTabIndicator(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 4,color: Colors.white),
                    insets: EdgeInsets.symmetric(horizontal: 90),
                  ),
                  tabs: [
                    Tab(text: "FAQs"),
                    Tab(text: "Contact Us"),
                  ],
                ),
              ),
            ),
          ),
        ),

        body: TabBarView(
          children: [
            FaqsScreen(),
            ContactUsScreen()
          ],
        ),
      ),
    );
  }
}
