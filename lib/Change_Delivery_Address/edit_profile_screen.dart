import 'package:flutter/material.dart';
class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}



class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [

              SizedBox(height: 151,),
              ClipRRect(borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)), child: Container(height: 650,width: 365,color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
