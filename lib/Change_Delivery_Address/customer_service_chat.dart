import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class CustomerServiceChat extends StatefulWidget {
  const CustomerServiceChat({super.key});

  @override
  State<CustomerServiceChat> createState() => _CustomerServiceChatState();
}

class _CustomerServiceChatState extends State<CustomerServiceChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
          leading: Icon(Icons.arrow_back),
          title: Text("Customer Service",style: TextStyle(fontSize: 20),),
          actions: [
          Icon(Icons.video_call_outlined),
          SizedBox(width: 18,),
          Icon(Icons.call),
          SizedBox(width: 18,),
          Icon(Icons.more_vert),
          SizedBox(width: 18,),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
            Center(child: Text("Today")),
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: SizedBox(width: 250,height: 80,
                child: Card(
                  color: Colors.grey[200],
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Hi, how are you today? Are there any improvements?", style: TextStyle(color: Colors.black87,),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("7:00", style: TextStyle(fontSize: 12, color: Colors.grey[700],),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: SizedBox(width: 250,height: 80,
                    child: Card(
                      color: Colors.blueAccent,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(12),bottomRight: Radius.circular(12),bottomLeft: Radius.circular(12)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("It’s gotten worse, i keep thinking weird things", style: TextStyle(color: Colors.white,),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("7:00", style: TextStyle(fontSize: 12, color: Colors.white,),),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8,),
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: SizedBox(width: 250,height: 80,
                child: Card(
                  color: Colors.grey[200],
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Do not panic, would you like us to have a session?", style: TextStyle(color: Colors.black87,),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("7:00", style: TextStyle(fontSize: 12, color: Colors.grey[700],),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: SizedBox(width: 250,height: 100,
                    child: Card(
                      color: Colors.blueAccent,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(12),bottomRight: Radius.circular(12),bottomLeft: Radius.circular(12)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("Yes please,There’s is no other person i can talk to, i need help before i go crazy", style: TextStyle(color: Colors.white,),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("7:00", style: TextStyle(fontSize: 12, color: Colors.white,),),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8,),
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: SizedBox(width: 250,height: 80,
                child: Card(
                  color: Colors.grey[200],
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("I have a free time today at noon, can can you come over at 4pm?", style: TextStyle(color: Colors.black87,),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("7:00", style: TextStyle(fontSize: 12, color: Colors.grey[700],),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: SizedBox(width: 250,height: 100,
                    child: Card(
                      color: Colors.blueAccent,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(12),bottomRight: Radius.circular(12),bottomLeft: Radius.circular(12)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("Yes please, that’s totally fine  with me i will came at a 4pm to attend your session, thank you so much", style: TextStyle(color: Colors.white,),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("7:00", style: TextStyle(fontSize: 12, color: Colors.white,),),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8,),
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: SizedBox(width: 250,height: 80,
                child: Card(
                  color: Colors.grey[200],
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Take care and don’t be take any type of stress", style: TextStyle(color: Colors.black87,),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("7:00", style: TextStyle(fontSize: 12, color: Colors.grey[700],),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: SizedBox(width: 250,height: 115,
                    child: Card(
                      color: Colors.blueAccent,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(12),bottomRight: Radius.circular(12),bottomLeft: Radius.circular(12)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("“Thank you so much for your kind message. Please don’t worry, I’m here to assist you and everything is completely under control.”", style: TextStyle(color: Colors.white,),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("7:00", style: TextStyle(fontSize: 12, color: Colors.white,),),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8,),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 15, right: 15, bottom: 10, top: 8),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Message...",
                    suffixIcon: Icon(CupertinoIcons.photo),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.grey[300],
                  ),
                ),
              ),
            ),

            SizedBox(width: 10),
            Container(height: 50, width: 50,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                shape: BoxShape.circle,
              ),
              child: Icon(CupertinoIcons.mic_fill, color: Colors.white,),
            ),
          ],
        ),
      ),
    );
  }
}
