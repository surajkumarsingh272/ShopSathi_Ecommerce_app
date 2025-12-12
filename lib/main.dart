import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_sathi_app/providers/address_provider.dart';
import 'package:shop_sathi_app/providers/cart_provider.dart';
import 'package:shop_sathi_app/providers/category_provider.dart';
import 'package:shop_sathi_app/providers/mobile_provider.dart';
import 'package:shop_sathi_app/providers/order_provider.dart';
import 'package:shop_sathi_app/providers/product_details_provider.dart';
import 'package:shop_sathi_app/providers/product_provider.dart';
import 'package:shop_sathi_app/providers/profile_provider/profile_provider.dart';
import 'package:shop_sathi_app/providers/purchase_provider.dart';
import 'package:shop_sathi_app/providers/search_providers/search_provider.dart';
import 'package:shop_sathi_app/providers/wishlist_provider.dart';
import 'package:shop_sathi_app/screen/auth_screen/splace_screen.dart';
import 'package:shop_sathi_app/screen/order_review_second_screen.dart';
import '../providers/auth_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => ProductDetailsProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => MobileProvider(),),
        ChangeNotifierProvider(create: (context) => SearchProvider(),),
        ChangeNotifierProvider(create: (context) => ProfileProvider(),),
        ChangeNotifierProvider(create: (context) => OrderProvider(),),
        ChangeNotifierProvider(create: (_) => PurchaseProvider()),
        ChangeNotifierProvider(create: (context) => WishlistProvider(),),
        ChangeNotifierProvider(create: (context) => CartProvider(),),
        ChangeNotifierProvider(create: (context) => CategoryProvider(),),
        ChangeNotifierProvider(create: (context) => AddressProvider(),)
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
        home:SplashScreen() ,
    );
  }
}

