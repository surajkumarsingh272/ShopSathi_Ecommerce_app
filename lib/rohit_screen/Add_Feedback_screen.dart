import 'package:flutter/material.dart';

class AddFeedbackScreen extends StatefulWidget {
  const AddFeedbackScreen({super.key});

  @override
  State<AddFeedbackScreen> createState() => _AddFeedbackScreenState();
}

class _AddFeedbackScreenState extends State<AddFeedbackScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ADD FEEDBACK",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
        backgroundColor: Colors.blueAccent,
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back,color: Colors.white,)),
        shadowColor: Colors.black,
        elevation: 10,
      ),
    body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 50,right: 50,top: 29),
          child: Row(
            children: [
              Container(
              height: 20,
                width: 20,
                decoration: BoxDecoration(
                  border: Border.all(color:Colors.blue,width: 2),
                  borderRadius: BorderRadius.circular(50)
                ),
                child: Icon(Icons.done,color: Colors.blueAccent,size: 16),
              ),
              Expanded(
                child: Divider(
                  color: Colors.blue,
                  indent:0,
                  endIndent: 0,
                  thickness: 2,
                ),
              ),
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    border: Border.all(color:Colors.blue,width: 2),
                    borderRadius: BorderRadius.circular(50)
                ),
                child: Icon(Icons.done,color: Colors.blueAccent,size: 16),
              ),
              Expanded(
                child: Divider(
                  color: Colors.black,
                  indent: 0,
                  endIndent: 0,
                  thickness: 2,
                ),
              ),
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    border: Border.all(color:Colors.grey,width: 2),
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(50)

                ),
               child: Center(
                 child: Text("3",style:TextStyle(fontWeight: FontWeight.bold),),
               ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Rating"),
            Text("Photo & Vedios"),
            Text("Comment"),
          ],
        ),
        SizedBox(height: 15,),
        Divider(
          color: Colors.grey,
          indent: 0,
          endIndent: 0,
          thickness: 1,
        ),
        SizedBox(height: 6,),
        Padding(
          padding: const EdgeInsets.only(right: 175),
          child: Text("Add Photos and Videos",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
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
                Text("Show us what your\nproducts looks like",style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold,fontSize: 11),),
                Padding(
                  padding: const EdgeInsets.only(left: 66),
                  child: Image(image: AssetImage("Image/tablet.png")),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Container(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,   // 🔵 Button color
                foregroundColor: Colors.white,   // ⚪ Text color
                padding: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),



              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.camera_alt_outlined,size: 23,),
                  SizedBox(width: 10),
                  Text("Add Photos & Videos",style: TextStyle(fontSize: 16),),
                ],
              ),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 400,left: 10,right: 10),
          child: Container(

            width: double.infinity,
            child:  ElevatedButton(
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 10),
                backgroundColor: Colors.blueAccent,
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(10)
               )
               ),
                onPressed: () {
            }, child: Text("Submit",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 17),)),
          ),
        )
      ],
    ),
    );
  }
}
