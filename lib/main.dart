import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_sathi_app/providers/mobile_provider.dart';
import 'package:shop_sathi_app/providers/product_details_provider.dart';
import 'package:shop_sathi_app/providers/product_provider.dart';
import 'package:shop_sathi_app/providers/search_providers/search_provider.dart';
import 'package:shop_sathi_app/screen/furniture_screen.dart';
import 'package:shop_sathi_app/screen/offer_screen.dart';
import 'package:shop_sathi_app/screen/splace_screen.dart';
import '../providers/auth_provider.dart';
import 'Change_Delivery_Address/change_delivery_screen.dart';
import 'Change_Delivery_Address/provider_class.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => ProductDetailsProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => MobileProvider(),),
        ChangeNotifierProvider(create: (context) => ProviderClass(),),
        ChangeNotifierProvider(create: (context) => SearchProvider(),),
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
        home:ChangeDeliveryScreen(),
    );
  }
}

