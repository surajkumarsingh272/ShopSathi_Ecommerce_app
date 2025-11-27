
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_sathi_app/screen/register_screen.dart';
import '../providers/auth_provider.dart';
import 'forgotpassword_screen.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var provider=  Provider.of<AuthProvider>(context,);
    return Scaffold(
      resizeToAvoidBottomInset:false,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset("assets/image/double1.png", height: 250,),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset("assets/image/loginsuraj.png",height: 200,),
          ),
          Positioned(
            top: 197,
            right: 0,
            child: Image.asset("assets/image/single.png",height: 120,),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal:25,vertical:198),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 60),
                  Text("Login", style:TextStyle(fontSize: 40,fontWeight:FontWeight.bold,),
                  ),
                  SizedBox(height: 5),
                  Text("Good to see you back!",style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  SizedBox(height: 25),
                  Container(
                    padding:EdgeInsets.symmetric(horizontal: 20),
                    decoration:BoxDecoration(
                      color:Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: TextField(controller: provider.emailController
                      ,decoration: InputDecoration(border:InputBorder.none, hintText: "Email",
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: TextField(controller: provider.passwordController
                      ,decoration: InputDecoration(border: InputBorder.none, hintText: "Password",),
                    ),
                  ),
                  SizedBox(height:5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => RegisterScreen(),));
                      }, child:Text("Create Account?",style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold),),),

                      TextButton(onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ForgotpasswordScreen(),));
                      }, child: Text("Forgot password?",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),), )
                    ],
                  ),
                  SizedBox(height: 25),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        elevation: 4,
                      ),
                      onPressed: () async {
                        String message = await provider.login();
                        if (provider.token == null) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login Failed")),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login Successfully")),
                          );
                          Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => RegisterScreen()),
                          );
                        }
                      },
                      child:Text("Next",style:TextStyle(color:Colors.white,fontSize:18,fontWeight:FontWeight.w600,),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


