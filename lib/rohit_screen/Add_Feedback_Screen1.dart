import 'package:flutter/material.dart';

class AddFeedbackScreen1 extends StatefulWidget {
  const AddFeedbackScreen1({super.key});

  @override
  State<AddFeedbackScreen1> createState() => _AddFeedbackScreen1State();
}

class _AddFeedbackScreen1State extends State<AddFeedbackScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ADD FEEDBACK",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17),),
        backgroundColor: Colors.blueAccent,
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back,color: Colors.white,)),
        shadowColor: Colors.black,
        elevation: 10,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15,left: 44,right: 44),
              child: Row(
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(border: Border.all(color: Colors.blue,width: 2),
                    borderRadius: BorderRadius.circular(50)
                    ),
                    child: Icon(Icons.done,color: Colors.blueAccent,size: 17,),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.blue,
                      indent: 0,
                      endIndent: 0,
                      thickness: 1,
                    ),
                  ),
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(border: Border.all(color: Colors.blue,width: 2),
                        borderRadius: BorderRadius.circular(50)
                    ),
                    child: Icon(Icons.done,color: Colors.blueAccent,size: 17,),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.blue,
                      indent: 0,
                      endIndent: 0,
                      thickness: 1,
                    ),
                  ),
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(border: Border.all(color: Colors.blue,width: 2),
                        borderRadius: BorderRadius.circular(50)
                    ),
                    child: Icon(Icons.done,color: Colors.blueAccent,size: 17,),
                  ),
                ],
              ),
            ),
            SizedBox(height: 4,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Rating"),
                Text("Photos & Videos"),
                Text("Comment"),
              ],
            ),
            SizedBox(height: 14,),
            Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(right: 244),
              child: Text("Type Comments",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                    color: Colors.teal.shade50
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Type Your Feedback\nTo Help Customers",style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold,fontSize: 11),),
                    Padding(
                      padding: const EdgeInsets.only(left: 66),
                      child: Image(image: AssetImage("Image/tablet.png")),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 13),
                  child: Text("Your Comments",style: TextStyle(fontSize: 16),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 99),
                  child: Container(
                    height: 16,
                    width: 16,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),
                    color: Colors.blue
                    ),
                    child: Icon(Icons.done,size: 16,color: Colors.white,),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text("Need Quick Support"),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                color: Colors.grey.shade100
                ),
                child:Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Icon(Icons.maps_ugc_outlined),
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Type Comments",
                          border: InputBorder.none,          
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Icon(Icons.keyboard_voice_sharp),
                    )
                  ],
                )
        
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 393,left: 10,right: 10),
              child: SizedBox(
                height: 45,
                 width: double.infinity,
                child: ElevatedButton(onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              padding: EdgeInsets.all(20),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(height: 40), // top icon ke liye space

                                  Center(
                                    child: Text(
                                      "Done!",
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),

                                  SizedBox(height: 10),

                                  Text(
                                    "You return has bu sucssesfully charged",
                                    textAlign: TextAlign.center,
                                  ),

                                  SizedBox(height: 25),

                                  Center(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blueAccent,
                                        padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                      ),
                                      child: Text(
                                        "Go to Product Page",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // 🔵 TOP ICON / CONTAINER
                            Positioned(
                              top: -30,
                              left: 0,
                              right: 0,
                              child: CircleAvatar(
                                radius: 40,
                                backgroundColor: Colors.white,
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),
                                  color: Colors.blue
                                  ),
                                  child: Icon(Icons.check, color: Colors.white, size: 32),
                                )
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );


                },style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),

                  )
                ), child: Text("Submit",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 19),)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
