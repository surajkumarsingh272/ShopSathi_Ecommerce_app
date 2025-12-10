import 'package:flutter/material.dart';
class FaqsScreen extends StatefulWidget {
  const FaqsScreen({super.key});

  @override
  State<FaqsScreen> createState() => _FaqsScreenState();
}

class _FaqsScreenState extends State<FaqsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(left: 10,top: 15,right: 15,bottom: 15),
              child: SizedBox(height: 48,
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Icon(Icons.filter_list),
                    hintText: "Search for help",
                    filled: true,
                    fillColor: Colors.grey[300],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  )
                ),
              ),
            ),
            SizedBox(height: 10),
            Card(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10,right: 15),
                    child: ListTile(
                      title: Text("How do I manage my notifications?",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                      subtitle: Padding(
                        padding:  EdgeInsets.only(top: 10),
                        child: Text('To manage notifications, go to "Settings," select "Notification Settings," and customize your preferences.',style: TextStyle(fontSize: 11,fontWeight: FontWeight.bold,color: Colors.grey[500]),),
                      ),
                      contentPadding: EdgeInsets.all(0),
                      trailing: Icon(Icons.keyboard_arrow_down_outlined,size: 30,)
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            SizedBox(height: 80,
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10,right: 15),
                      child: ListTile(
                        title: Text("How do I start a guided meditation session?",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                        contentPadding: EdgeInsets.all(0),
                        trailing: Icon(Icons.keyboard_arrow_down_outlined,size: 30,)
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 5),
            SizedBox(height: 80,
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10,right: 15),
                      child: ListTile(
                        title: Text("How do I join a support group?",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                        contentPadding: EdgeInsets.all(0),
                        trailing: Icon(Icons.keyboard_arrow_down_outlined,size: 30,)
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 5),
            SizedBox(height: 80,
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10,right: 15),
                      child: ListTile(
                        title: Text("How do I manage my notifications?",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                        contentPadding: EdgeInsets.all(0),
                        trailing: Icon(Icons.keyboard_arrow_down_outlined,size: 30,)
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 5),
            SizedBox(height: 80,
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10,right: 15),
                      child: ListTile(
                        title: Text("Is my data safe and private?",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                        contentPadding: EdgeInsets.all(0),
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
