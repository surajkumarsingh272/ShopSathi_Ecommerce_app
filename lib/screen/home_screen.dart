// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:shop_sathi_app/screen/product_datails_page.dart';
// import 'package:shop_sathi_app/screen/profile_screen/profile_screen.dart';
// import 'package:shop_sathi_app/screen/search_screen.dart';
// import '../providers/auth_provider.dart';
// import '../providers/product_provider.dart';
// import '../providers/profile_provider/profile_provider.dart';
// import '../providers/wishlist_provider.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   Map<String, dynamic>? profile;
//
//
//   @override
//   void initState() {
//     super.initState();
//     final provider = Provider.of<ProductProvider>(context, listen: false);
//     provider.loadProducts();
//     provider.loadCategories();
//     loadProfile();
//     loadWishlistForUser();
//   }
//
//   void loadWishlistForUser() async {
//     final prefs = await SharedPreferences.getInstance();
//     String? token = prefs.getString("accessToken");
//     int? userId = Provider.of<ProfileProvider>(context, listen: false).user?.id;
//
//     if (token != null && userId != null) {
//       Provider.of<WishlistProvider>(context, listen: false)
//           .loadWishlist(userId, token);
//     }
//   }
//   void loadProfile() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? accessToken = prefs.getString("accessToken");
//     String? refreshToken = prefs.getString("refreshToken");
//
//     if (accessToken != null && refreshToken != null) {
//       final auth = Provider.of<AuthProvider>(context, listen: false);
//
//       auth.getProfile(accessToken).then((data) {
//         setState(() {
//           profile = data;
//         });
//       }).catchError((error) async {
//         final newTokens = await auth.refreshToken(refreshToken);
//
//         await prefs.setString("accessToken", newTokens["accessToken"]);
//         auth.getProfile(newTokens["accessToken"]).then((data) {
//           setState(() {
//             profile = data;
//           });
//         });
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<ProductProvider>(context);
//     final profileProvider = Provider.of<ProfileProvider>(context);
//     final user = profileProvider.user;
//     final profile = Provider.of<ProfileProvider>(context).user;
//
//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: GestureDetector(
//           onTap: () {
//             Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen(),));
//           },
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const CircleAvatar(radius: 20, backgroundColor: Colors.blue, child: Icon(Icons.person, color: Colors.white),
//               ),
//               const Text("Shop Sathi", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black,fontSize: 20),),
//               const CircleAvatar( radius: 20,    backgroundColor: Colors.blue, child: Icon(Icons.favorite_border, color: Colors.white),
//               ),
//             ],
//           ),
//         ),
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding:  EdgeInsets.all(12),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//           Text(
//           "Hello, ${profile?.name ?? 'User'}",
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//               const SizedBox(height: 5),
//               const Text("Discover your favorite items",style: TextStyle(fontSize: 16, color: Colors.black54)),
//               const SizedBox(height: 20),
//               Row(
//                 children: [
//                   Expanded(
//                     child: GestureDetector(
//                       onTap: () {
//                         Navigator.push(context,MaterialPageRoute(builder: (context) => SearchScreen(userId: 1,)),);
//                       },
//                       child: Container(
//                         height: 50,
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: Row(
//                           children: [
//                             const SizedBox(width: 10),
//                             const Icon(Icons.search, color: Colors.grey),
//                             const SizedBox(width: 10),
//                             Text("Search products, brands...",style: TextStyle(color: Colors.grey,fontSize: 15),),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 10),
//                   Container(
//                     height: 50,
//                     width: 50,
//                     decoration: BoxDecoration(
//                         color: Colors.blue,
//                         borderRadius: BorderRadius.circular(10)),
//                     child: const Icon(Icons.mic, color: Colors.white),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 20),
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   children: provider.categories.map((cat) {
//                     return _buildCategoryChip(cat.title ?? "");
//                   }).toList(),
//                 ),
//
//               ),
//               SizedBox(height: 25),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: const [
//                   Text("Popular Products", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), ),
//                   Text("View All", style: TextStyle(color: Colors.blue)),
//                 ],
//               ),
//               SizedBox(height: 15),
//               GridView.builder(
//                 physics: const NeverScrollableScrollPhysics(),
//                 shrinkWrap: true,
//                 itemCount: provider.products.length,
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     childAspectRatio: 0.75,
//                     crossAxisSpacing: 10,
//                     mainAxisSpacing: 10),
//                 itemBuilder: (context, index) {
//                   return GestureDetector(
//                     onTap: () {
//                       Navigator.push(context,  MaterialPageRoute(  builder: (context) => ProductDetailsPage( productId: provider.products[index].id!,
//                           ),
//                         ),
//                       );
//                     },
//                     child: _buildProductCard(
//                       image: provider.products[index].image ?? "",
//                       name: provider.products[index].name ?? "",
//                       oldPrice: provider.products[index].oldPrice?.toDouble() ?? 0,
//                       newPrice: provider.products[index].newPrice?.toDouble() ?? 0,
//                       rating: provider.products[index].rating?.toDouble() ?? 0.0,
//                       discount: provider.products[index].discount ?? 0,
//                     ),
//                   );
//
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildCategoryChip(String title, {bool isSelected = false}) {
//     return Container(
//       margin: const EdgeInsets.only(right: 10),
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
//       decoration: BoxDecoration(
//         color: isSelected ? Colors.blue : Colors.white,
//         borderRadius: BorderRadius.circular(20),
//         border: Border.all(color: Colors.blueAccent.shade100),
//       ),
//       child: Text(title,style: TextStyle(color: isSelected ? Colors.white : Colors.blue, fontWeight: FontWeight.w500),
//       ),
//     );
//   }
//
//   Widget _buildProductCard({
//     required String image,
//     required String name,
//     required double oldPrice,
//     required double newPrice,
//     required double rating,
//     required int discount,
//   }) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Expanded(
//             child: Stack(
//               children: [
//                 ClipRRect(
//                     borderRadius:
//                     const BorderRadius.vertical(top: Radius.circular(12)),
//                     child: Image.network(
//                       image.startsWith("http")
//                           ? image
//                           : "https://shop-sathi-api.onrender.com/uploads/$image",
//                       width: double.infinity,
//                       fit: BoxFit.cover,
//                     )
//                 ),
//
//                 const Positioned(
//                   right: 8,
//                   top: 8,
//                   child: CircleAvatar(
//                     radius: 15,
//                     backgroundColor: Colors.white,child: Icon(Icons.favorite_border, color: Colors.red),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//
//           Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
//               child: Text(name,  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, height: 1.2),
//                 maxLines: 1,
//                 overflow: TextOverflow.ellipsis,)),
//           Padding(
//             padding:  EdgeInsets.symmetric(horizontal: 8),
//             child: Row(
//               children: [
//                 const Icon(Icons.star, color: Colors.green, size: 16),
//                 const SizedBox(width: 4),
//                 Text(  rating.toString(), style: const TextStyle( color: Colors.black87, fontWeight: FontWeight.w500),
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding:
//             const EdgeInsets.symmetric(horizontal: 8).copyWith(bottom: 8),
//             child: Row(
//               children: [
//                 Text("₹$newPrice",style: const TextStyle( color: Colors.blue,fontWeight: FontWeight.bold, fontSize: 15),),
//                 const SizedBox(width: 6),
//                 Text("₹$oldPrice", style: const TextStyle( color: Colors.grey,  decoration: TextDecoration.lineThrough ,fontSize: 13),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_sathi_app/screen/product_datails_page.dart';
import 'package:shop_sathi_app/screen/product_wishlist.dart';
import 'package:shop_sathi_app/screen/profile_screen/profile_screen.dart';
import 'package:shop_sathi_app/screen/search_screen.dart';
import '../providers/auth_provider.dart';
import '../providers/product_provider.dart';
import '../providers/profile_provider/profile_provider.dart';
import '../providers/wishlist_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, dynamic>? profile;

  @override
  void initState() {
    super.initState();
    final productProvider = Provider.of<ProductProvider>(context, listen: false);
    productProvider.loadProducts();
    productProvider.loadCategories();
    loadProfile();
    loadWishlistForUser();
  }

  void loadWishlistForUser() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("accessToken");

    int? userId =
        Provider.of<ProfileProvider>(context, listen: false).user?.id;

    if (token != null && userId != null) {
      Provider.of<WishlistProvider>(context, listen: false)
          .loadWishlist(userId, token);
    }
  }

  // void loadProfile() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? accessToken = prefs.getString("accessToken");
  //   String? refreshToken = prefs.getString("refreshToken");
  //
  //   if (accessToken != null && refreshToken != null) {
  //     final auth = Provider.of<AuthProvider>(context, listen: false);
  //
  //     auth.getProfile(accessToken).then((data) {
  //       setState(() {
  //         profile = data;
  //       });
  //     }).catchError((error) async {
  //       final newTokens = await auth.refreshToken(refreshToken);
  //       await prefs.setString("accessToken", newTokens["accessToken"]);
  //
  //       auth.getProfile(newTokens["accessToken"]).then((data) {
  //         setState(() {
  //           profile = data;
  //         });
  //       });
  //     });
  //   }
  // }
  void loadProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accessToken = prefs.getString("accessToken");
    String? refreshToken = prefs.getString("refreshToken");

    if (accessToken != null && refreshToken != null) {
      final auth = Provider.of<AuthProvider>(context, listen: false);

      auth.getProfile(accessToken).then((data) async {
        setState(() {
          profile = data;
        });

        // ✅ Profile aagaya --> ab wishlist load karo
        int userId = data["id"];
        await Provider.of<WishlistProvider>(context, listen: false)
            .loadWishlist(userId, accessToken);
      }).catchError((error) async {
        final newTokens = await auth.refreshToken(refreshToken);
        await prefs.setString("accessToken", newTokens["accessToken"]);

        auth.getProfile(newTokens["accessToken"]).then((data) async {
          setState(() {
            profile = data;
          });

          // ✅ Refresh ke baad bhi wishlist load
          int userId = data["id"];
          await Provider.of<WishlistProvider>(context, listen: false)
              .loadWishlist(userId, newTokens["accessToken"]);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final profileProvider = Provider.of<ProfileProvider>(context);
    final wishlistProvider = Provider.of<WishlistProvider>(context);

    final user = profileProvider.user;

    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ProfileScreen()),
              ),
              child: const CircleAvatar(
                radius: 20,
                backgroundColor: Colors.blue,
                child: Icon(Icons.person, color: Colors.white),
              ),
            ),

            const Text(
              "Shop Sathi",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20),
            ),

            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>ProductWishlist(),));
              },
              child: const CircleAvatar(
                radius: 20,
                backgroundColor: Colors.blue,
                child: Icon(Icons.favorite_border, color: Colors.white),
              ),
            ),
          ],
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                "Hello, ${user?.name ?? 'User'} 👋",
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 5),
              const Text(
                "Discover your favorite items",
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),

              const SizedBox(height: 20),

              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => SearchScreen(userId: user?.id ?? 0)),
                        );
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: const [
                            SizedBox(width: 10),
                            Icon(Icons.search, color: Colors.grey),
                            SizedBox(width: 10),
                            Text("Search products, brands...",
                                style: TextStyle(color: Colors.grey, fontSize: 15)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Icon(Icons.mic, color: Colors.white),
                  )
                ],
              ),

              const SizedBox(height: 20),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: productProvider.categories.map((cat) {
                    return _buildCategoryChip(cat.title ?? "");
                  }).toList(),
                ),
              ),

              const SizedBox(height: 25),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Popular Products",
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text("View All", style: TextStyle(color: Colors.blue)),
                ],
              ),

              const SizedBox(height: 15),

              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: productProvider.products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) {
                  final product = productProvider.products[index];

                  bool isFavourite =
                  wishlistProvider.isInWishlist(product.id!);

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              ProductDetailsPage(productId: product.id!),
                        ),
                      );
                    },
                    child: _buildProductCard(
                      product: product,
                      isFavourite: isFavourite,
                      wishlistProvider: wishlistProvider,
                      userId: user?.id ?? 0,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // CATEGORY CHIP
  Widget _buildCategoryChip(String title, {bool isSelected = false}) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.blueAccent.shade100),
      ),
      child: Text(
        title,
        style: TextStyle(
            color: isSelected ? Colors.white : Colors.blue,
            fontWeight: FontWeight.w500),
      ),
    );
  }

  // PRODUCT CARD WITH WISHLIST ICON CLICK FIXED
  Widget _buildProductCard({
    required dynamic product,
    required bool isFavourite,
    required WishlistProvider wishlistProvider,
    required int userId,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.network(
                    product.image.startsWith("http")
                        ? product.image
                        : "https://shop-sathi-api.onrender.com/uploads/${product.image}",
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) =>
                    const Center(child: Icon(Icons.broken_image)),
                  ),
                ),

                Positioned(
                  right: 8,
                  top: 8,
                  child: GestureDetector(
                    onTap: () async {
                      final authProvider = Provider.of<AuthProvider>(context, listen: false);
                      final wishlistProvider = Provider.of<WishlistProvider>(context, listen: false);

                      await wishlistProvider.toggleWishlist(
                        userId,
                        product.id!,
                        authProvider,
                      );
                    },
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.white,
                      child: Icon(
                        wishlistProvider.isInWishlist(product.id!)
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.red,
                      ),
                    ),
                  )
                )
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              product.name,
              style:
              const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                const Icon(Icons.star, color: Colors.green, size: 16),
                const SizedBox(width: 4),
                Text(
                  product.rating.toString(),
                  style: const TextStyle(
                      color: Colors.black87, fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),

          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 8).copyWith(bottom: 8),
            child: Row(
              children: [
                Text(
                  "₹${product.newPrice}",
                  style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                const SizedBox(width: 6),
                Text(
                  "₹${product.oldPrice}",
                  style: const TextStyle(
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                      fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
