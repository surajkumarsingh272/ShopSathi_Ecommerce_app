import 'package:flutter/material.dart';

class FeedbackScreen2 extends StatefulWidget {
  const FeedbackScreen2({super.key});

  @override
  State<FeedbackScreen2> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen2> {
  int? _selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Feedback",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // ← Back action
          },
        ),
        backgroundColor: Colors.blueAccent,
        elevation: 10,
        shadowColor: Colors.black,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 50,right: 50,top: 12),
            child: Row(
              children: [
                // 1st Circle ✔️
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                    child: Icon(Icons.done, size: 17, color: Colors.blueAccent),
                  ),
                ),

                // Divider 1 (FULL WIDTH)
                Expanded(
                  child: Divider(
                    thickness: 2,
                    color: Colors.blueAccent,
                  ),
                ),

                // 2nd Circle
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                    child: Text(
                      "2",
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
                ),

                // Divider 2 (FULL WIDTH)
                Expanded(
                  child: Divider(
                    thickness: 2,
                    color: Colors.grey,
                  ),
                ),

                // 3rd Circle
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                    child: Text(
                      "3",
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Rating",style: TextStyle(color: Colors.black),),
              Text("Photo & Viders",style: TextStyle(color: Colors.grey),),
              Text("comment",style: TextStyle(color: Colors.grey),),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right:220,top: 12),
            child: Text("Share Your Feedback",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
          ),
          Padding(
            padding: const EdgeInsets.only(right:239,top: 4),
            child: Text("Share Your Feedback",style: TextStyle(fontSize: 14,color: Colors.grey),),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(border: Border.all(color: Colors.grey,width:1),
                      borderRadius: BorderRadius.circular(8)
                  ),
                  child: Center(child: Text("😀",style: TextStyle(fontSize: 30),)),
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(border: Border.all(color: Colors.grey,width:1),
                      borderRadius: BorderRadius.circular(8)
                  ),
                  child: Center(child: Text("😁",style: TextStyle(fontSize: 30),)),
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(border: Border.all(color: Colors.grey,width:1),
                      borderRadius: BorderRadius.circular(8)
                  ),
                  child: Center(child: Text("🥰",style: TextStyle(fontSize: 30),)),
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(border: Border.all(color: Colors.grey,width:1),
                      borderRadius: BorderRadius.circular(8)
                  ),
                  child: Center(child: Text("😐",style: TextStyle(fontSize: 30),)),
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(border: Border.all(color: Colors.grey,width:1),
                      borderRadius: BorderRadius.circular(8)
                  ),
                  child: Center(child: Text("😨",style: TextStyle(fontSize: 30),)),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 222,top: 15),
            child: Text("Tell us what went wrong",style: TextStyle(fontWeight: FontWeight.bold),),
          ),


          Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              height: 53,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade200),
                borderRadius: BorderRadius.circular(7),
              ),
              child: Row(
                children: [
                  SizedBox(width: 12),
                  Icon(Icons.report_problem, color: Colors.red),
                  SizedBox(width: 12),
                  Expanded(child: Text("App Crashed & Freezing")),
                  Radio<int>(
                    value: 0,
                    groupValue: _selectedValue,
                    onChanged: (value) {
                      setState(() {
                        _selectedValue = (_selectedValue == value) ? null : value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),

          // Option 2
          Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              height: 53,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade200),
                borderRadius: BorderRadius.circular(7),
              ),
              child: Row(
                children: [
                  SizedBox(width: 12),
                  Icon(Icons.wordpress_rounded, color: Colors.purple),
                  SizedBox(width: 12),
                  Expanded(child: Text("Poor Photo Quinlity")),
                  Radio<int>(
                    value: 1,
                    groupValue: _selectedValue,
                    onChanged: (value) {
                      setState(() {
                        _selectedValue = (_selectedValue == value) ? null : value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),

          // Option 3
          Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              height: 53,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade200),
                borderRadius: BorderRadius.circular(7),
              ),
              child: Row(
                children: [
                  SizedBox(width: 12),
                  Icon(Icons.location_on, color: Colors.black),
                  SizedBox(width: 12),
                  Expanded(child: Text("GPS Traking Issues")),
                  Radio<int>(
                    value: 2,
                    groupValue: _selectedValue,
                    onChanged: (value) {
                      setState(() {
                        _selectedValue = (_selectedValue == value) ? null : value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              height: 53,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade200),
                borderRadius: BorderRadius.circular(7),
              ),
              child: Row(
                children: [
                  SizedBox(width: 12),
                  Icon(Icons.open_with_outlined, color: Colors.orangeAccent),
                  SizedBox(width: 12),
                  Expanded(child: Text("Other Reasons")),
                  Radio<int>(
                    value: 3,
                    groupValue: _selectedValue,
                    onChanged: (value) {
                      setState(() {
                        _selectedValue = (_selectedValue == value) ? null : value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
         Row(
           children: [
             Padding(

               padding: const EdgeInsets.only(top: 22,left: 12),
               child: Text("Your Comment",style: TextStyle(color: Colors.grey),),
             ),
             Padding(
               padding: const EdgeInsets.only(left: 133,top: 23),
               child: Container(
                 height: 20,
                 width: 20,
                 decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent),
                 borderRadius: BorderRadius.circular(50),
                 color: Colors.blueAccent

                 ),
                 child: Center(child: Icon(Icons.done,size: 18,color: Colors.white,)),
               ),
             ),
             Padding(
               padding: const EdgeInsets.only(top: 23,left: 4),
               child: Text("Need Quick Suport",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 12),),
             )
           ],
         ),
          Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                  height: 135,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: GestureDetector(

                    child: TextField(

                      maxLines: null,
                      decoration: InputDecoration(

                        hintText: "Describes your experience here",
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      ),
                    ),
                  )

              )

          ),
          ElevatedButton(
            onPressed: () {
              // button action
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              shape: RoundedRectangleBorder(

                borderRadius: BorderRadius.circular(12),
                // corners round
              ),
              padding: EdgeInsets.symmetric(horizontal: 120, vertical: 11), // button size
            ),
            child: Text(
              "Submit Feedback",
              style: TextStyle(
                  fontSize: 18, // text bada
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),
            ),
          )

        ],
      ),
    );
  }
}
