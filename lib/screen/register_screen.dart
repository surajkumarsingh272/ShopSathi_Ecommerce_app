import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}
class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    var provider=  Provider.of<AuthProvider>(context,);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset:false,
      body: Stack(
        children: [
          Positioned(top: 0,left: 0,
            child: Image.asset("assets/image/double1.png",height:height * 0.30,),
          ),
          Positioned(top: height * 0.10,right: 0,child: Image.asset("assets/image/image5.png",height: height * 0.28,),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.06,
              vertical: height * 0.13,
            ),
            child:SingleChildScrollView(
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  SizedBox(height: height * 0.01),
                  Text("Create", style: TextStyle(fontSize: width * 0.10,fontWeight: FontWeight.bold,),),
                  Text("Acoount",style: TextStyle(fontSize: width * 0.10,fontWeight: FontWeight.bold,),),
                  SizedBox(height:height * 0.09),
                  DottedBorder(
                    options: CircularDottedBorderOptions(
                      dashPattern: [10, 10],
                      strokeWidth: 2,
                      padding: EdgeInsets.all(width * 0.02),
                      color: Colors.blueAccent,
                    ),
                    child:Container(
                      height: width * 0.12,
                      width: width * 0.12,
                      alignment: Alignment.center,
                      child: Icon(Icons.photo_camera_outlined,size: width * 0.06,color: Colors.blueAccent,),
                    ),
                  ),
                  SizedBox(height: height * 0.03),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextField(controller: provider.emailController,decoration: InputDecoration(border: InputBorder.none,hintText: "Email",),),
                  ),
                  SizedBox(height: height * 0.02),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextField(controller: provider.passwordController,
                      decoration: InputDecoration(border: InputBorder.none,hintText: "Password",),),
                  ),
                  SizedBox(height: height * 0.02),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextField(
                      controller: provider.phoneController,
                      // keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Phone",
                        prefixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset("assets/image/img.png", height: width * 0.05, width: width * 0.06),
                            SizedBox(width: 4),
                            Text("| 91+ "),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.03),
                  InkWell(
                    onTap: () async {
                      String message = await provider.signup();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)),  );
                      if (message == "data inserted successfully") {
                        provider.clearFields();
                        Navigator.pushReplacement(context,  MaterialPageRoute(builder: (_) => LoginScreen()),
                        );
                      }
                    },
                    child: Container(
                      height: height * 0.06,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Done",
                        style: TextStyle(fontSize: width * 0.045, color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height:height * 0.025),
                  Container(
                    height: height * 0.06,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.black12),
                    ),
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        SizedBox(width:width * 0.15),
                        Image.asset("assets/image/img_1.png",height: width * 0.14,
                        ),
                        SizedBox(width: width * 0.03),
                        Text("Sign Up With Google",style: TextStyle(fontSize: width * 0.04),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}