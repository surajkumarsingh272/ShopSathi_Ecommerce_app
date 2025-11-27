import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int selectedValue=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("RETURNS/EXCHANGE FOR #122334...",style: TextStyle(fontSize: 15),),
        leading: IconButton(onPressed: () {
         Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 222),
              child: Text("Product Details",style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
            ),
            SizedBox(height:17),
        
            Padding(
              padding: const EdgeInsets.only(left: 26),
              child: Row(
        
                children: [
                 ClipRRect(
                   borderRadius: BorderRadius.circular(9),
                   child: Container(
                     height: 89,
                     width: 80,
                     child: Image(image: AssetImage("Image/girlhis5.png"),fit: BoxFit.cover,),
                   ),
        
                 ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 39,bottom: 12),
                        child: Text("Bahrain hijab diamond",style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Text("Size:Free Size\nRs:174* only wrong item returns"),
                      ),
        
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 13,),
            Container(
              height: 33,
              width: double.infinity,
              color:Colors.green.shade100,
              child: Center(child: Text("Return allow only for wrong/defect items                 WHY?",style: TextStyle(fontSize: 13),)),
            ),
            SizedBox(height: 12,),
            Padding(
              padding: const EdgeInsets.only(right: 55),
              child: Text("Please Select reason for returns/exchange",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
            ),
            SizedBox(height: 8,),
            Divider(
              thickness: 1,
              color: Colors.blueAccent.shade100,
        
            ),
            SizedBox(height: 12,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:22),
                  child: Icon(Icons.warning,color:Colors.red,),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 39),
                      child: Text("Size/Fit issue",style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Text("Tight or loose fitting")
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 55),
                  child: Container(
                    height: 20,
                    width: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.green.shade100,
                    ),
                    child: Center(
                      child: Text(
                        "Exchange Only",
                        style: TextStyle(fontSize: 10)
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 13),
                  child: Radio(
                    value: 0,
                    groupValue: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value!;
                      });
                    },
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12,),
            Divider(
              thickness: 1,
              color: Colors.blueAccent.shade100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 17),
                  child: Icon(Icons.watch_later,color:Colors.grey,),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 39),
                      child: Text("Damaged/Used Product",style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Text("Dirty,old,tern,or broken",style: TextStyle(fontSize: 12),)
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 55),
        
                ),
                Padding(
                  padding: const EdgeInsets.only(right:11),
                  child: Radio(
                    value: 1,
                    groupValue: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value!;
                      });
                    },
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12,),
            Divider(
              thickness: 1,
              color: Colors.blueAccent.shade100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:18),
                  child: Icon(Icons.announcement_outlined,color:Colors.orangeAccent,),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 88),
                      child: Text("Item Missing in the package",style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Text("Part missing in product or got less quantity",style: TextStyle(fontSize: 12),)
                  ],
                ),
        
                Padding(
                  padding: const EdgeInsets.only(right: 9),
                  child: Radio(
                    value: 2,
                    groupValue: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value!;
                      });
                    },
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12,),
            Divider(
              thickness: 1,
              color: Colors.blueAccent.shade100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Icon(Icons.format_size_outlined,color:Colors.black,),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 111),
                        child: Text("Diffrents Products Delivered",style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                      Text("Received deffrents size/colors then ordered",style: TextStyle(fontSize: 12),)
                    ],
                  ),
                ),
        
                Padding(
                  padding: const EdgeInsets.only(right: 19),
                  child: Radio(
                    value: 3,
                    groupValue: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value!;
                      });
                    },
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12,),
            Divider(
              thickness: 1,
              color: Colors.blueAccent.shade100,
            ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Row(
                children: [
                  Icon(Icons.question_mark,color: Colors.grey,),
                  Padding(
                    padding: const EdgeInsets.only(left: 14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Others",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                        Text("if you returns/exchange reason is not listed",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),)
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 133,),
            ElevatedButton(onPressed: () {
              
            }, style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              padding: EdgeInsets.symmetric(horizontal:160),
              shape:BeveledRectangleBorder(borderRadius: BorderRadius.circular(8),
              )
            ),
                child: Text("Submit",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),))
          ],
        ),
      ),
    );
  }
}
