import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../../providers/auth_provider.dart';
import 'otp_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  File? imageFile;
  pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 70,
    );

    if (picked != null) {
      setState(() {
        imageFile = File(picked.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AuthProvider>(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    var nameController = provider.nameController;
    var emailController = provider.emailController;
    var phoneController = provider.phoneController;
    var passController = provider.passController;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          /// Background Images
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              "assets/image/double1.png",
              height: height * 0.30,
            ),
          ),
          Positioned(
            top: height * 0.10,
            right: 0,
            child: Image.asset(
              "assets/image/image5.png",
              height: height * 0.28,
            ),
          ),

          /// Main Content
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.06,
              vertical: height * 0.13,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height * 0.01),

                  Text(
                    "Create",
                    style: TextStyle(
                        fontSize: width * 0.10,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Acoount",
                    style: TextStyle(
                        fontSize: width * 0.10,
                        fontWeight: FontWeight.bold),
                  ),

                  SizedBox(height: height * 0.09),

                  /// Dotted Image Picker Box
                  // DottedBorder(
                  //   options: CircularDottedBorderOptions(
                  //     dashPattern: [10, 10],
                  //     strokeWidth: 2,
                  //     padding: EdgeInsets.all(width * 0.02),
                  //     color: Colors.blueAccent,
                  //   ),
                  //   child: Container(
                  //     height: width * 0.12,
                  //     width: width * 0.12,
                  //     alignment: Alignment.center,
                  //     child: Icon(
                  //       Icons.photo_camera_outlined,
                  //       size: width * 0.06,
                  //       color: Colors.blueAccent,
                  //     ),
                  //   ),
                  // ),

                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (_) => SizedBox(
                          height: 120,
                          child: Column(
                            children: [
                              ListTile(
                                leading: Icon(Icons.camera_alt),
                                title: Text("Camera"),
                                onTap: () async {
                                  Navigator.pop(context);
                                  final picker = ImagePicker();
                                  final picked = await picker.pickImage(
                                    source: ImageSource.camera,
                                    imageQuality: 70,
                                  );
                                  if (picked != null) {
                                    setState(() => imageFile = File(picked.path));
                                  }
                                },
                              ),
                              ListTile(
                                leading: Icon(Icons.photo),
                                title: Text("Gallery"),
                                onTap: () async {
                                  Navigator.pop(context);
                                  final picker = ImagePicker();
                                  final picked = await picker.pickImage(
                                    source: ImageSource.gallery,
                                    imageQuality: 70,
                                  );
                                  if (picked != null) {
                                    setState(() => imageFile = File(picked.path));
                                  }
                                },
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    child: DottedBorder(
                      options: CircularDottedBorderOptions(
                        dashPattern: [10, 10],
                        strokeWidth: 2,
                        padding: EdgeInsets.all(width * 0.02),
                        color: Colors.blueAccent,
                      ),
                      child: Container(
                        height: width * 0.20,
                        width: width * 0.20,
                        alignment: Alignment.center,
                        child: imageFile == null
                            ? Icon(Icons.photo_camera_outlined, size: width * 0.1)
                            : ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.file(
                            imageFile!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.03),

                  /// Username Input
                  buildInput(nameController, "User Name", width),

                  SizedBox(height: height * 0.03),

                  /// Email Input
                  buildInput(emailController, "Email", width),

                  SizedBox(height: height * 0.02),

                  /// Password Input
                  buildInput(passController, "Password", width),

                  SizedBox(height: height * 0.02),

                  /// Phone Input
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Phone",
                        prefixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              "assets/image/img.png",
                              height: width * 0.05,
                              width: width * 0.06,
                            ),
                            const SizedBox(width: 4),
                            const Text("| 91+ "),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: height * 0.03),

                  /// Done Button
                  InkWell(
                    onTap: () async {
                      if (nameController.text.isEmpty ||
                          emailController.text.isEmpty ||
                          phoneController.text.isEmpty ||
                          passController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text("Please fill all fields")),
                        );
                        return;
                      }

                      final res = await provider.register(
                        nameController.text.trim(),
                        emailController.text.trim(),
                        phoneController.text.trim(),
                        passController.text.trim(),
                        imageFile,
                      );

                      if (res != null && res.success) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                OtpScreen(phone: phoneController.text),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                "Registration failed"),
                          ),
                        );
                      }
                    },
                    child: Container(
                      height: height * 0.06,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Done",
                        style: TextStyle(
                          fontSize: width * 0.045,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: height * 0.025),

                  /// Google Button
                  Container(
                    height: height * 0.06,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.black12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/image/img_1.png",
                          height: width * 0.14,
                        ),
                        SizedBox(width: width * 0.03),
                        Text(
                          "Sign Up With Google",
                          style: TextStyle(fontSize: width * 0.04),
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

/// Input Box Widget
Widget buildInput(controller, String hint, double width) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: width * 0.05),
    decoration: BoxDecoration(
      color: Colors.grey.shade100,
      borderRadius: BorderRadius.circular(20),
    ),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hint,
      ),
    ),
  );
}
