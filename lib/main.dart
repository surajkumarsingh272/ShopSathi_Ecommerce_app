import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_sathi_app/providers/mobile_provider.dart';
import 'package:shop_sathi_app/providers/product_details_provider.dart';
import 'package:shop_sathi_app/providers/product_provider.dart';
import 'package:shop_sathi_app/screen/splace_screen.dart';
import '../providers/auth_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => ProductDetailsProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => MobileProvider(),)
      ],
      child:MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home:SplashScreen()
    );
  }
}
