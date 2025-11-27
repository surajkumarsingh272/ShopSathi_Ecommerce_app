// import 'package:flutter/material.dart';
// import 'package:shop_sathi/screen/search_screen.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: const [
//             CircleAvatar(radius: 20, backgroundColor: Colors.blue, child: Icon(Icons.person, color: Colors.white),
//             ),
//             Text("Shop Sathi", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black,fontSize: 20),),
//             CircleAvatar( radius: 20,    backgroundColor: Colors.blue, child: Icon(Icons.favorite_border, color: Colors.white),
//             ),
//           ],
//         ),
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding:  EdgeInsets.all(12),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text("Hello, Suraj ", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
//               const SizedBox(height: 5),
//               const Text("Discover your favorite items",style: TextStyle(fontSize: 16, color: Colors.black54)),
//               const SizedBox(height: 20),
//               Row(
//                 children: [
//                   Expanded(
//                     child: GestureDetector(
//                       onTap: () {
//                         Navigator.push(context,MaterialPageRoute(builder: (context) => SearchScreen()),);
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
//                SizedBox(height: 20),
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   children: [
//                     _buildCategoryChip("All", isSelected: true),
//                     _buildCategoryChip("Home"),
//                     _buildCategoryChip("Mobile"),
//                     _buildCategoryChip("Fashion"),
//                     _buildCategoryChip("Electronics"),
//                   ],
//                 ),
//               ),
//                SizedBox(height: 25),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: const [
//                   Text("Popular Products", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), ),
//                   Text("View All", style: TextStyle(color: Colors.blue)),
//                 ],
//               ),
//                SizedBox(height: 15),
//               GridView.builder(
//                 physics: const NeverScrollableScrollPhysics(),
//                 shrinkWrap: true,
//                 itemCount: 6,
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     childAspectRatio: 0.75,
//                     crossAxisSpacing: 10,
//                     mainAxisSpacing: 10),
//                 itemBuilder: (context, index) {
//                   return _buildProductCard(
//                     image: "images/first_image.jpeg",
//                     name: "Nike Club T-Shirt",oldPrice: 800, newPrice: 500,    rating: 4.2, discount: 38,
//                   );
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
//                   borderRadius:
//                   const BorderRadius.vertical(top: Radius.circular(12)),
//                   child: Image.asset(image,   width: double.infinity,  fit: BoxFit.contain,)),
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
//             padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
//             child: Text(name,  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, height: 1.2),
//               maxLines: 1,
//               overflow: TextOverflow.ellipsis,)),
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

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_sathi_app/screen/search_screen.dart';

import '../providers/product_provider.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();

    final provider = Provider.of<ProductProvider>(context, listen: false);
    provider.loadProducts();
    provider.loadCategories();
  }


  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context);
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            CircleAvatar(radius: 20, backgroundColor: Colors.blue, child: Icon(Icons.person, color: Colors.white),
            ),
            Text("Shop Sathi", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black,fontSize: 20),),
            CircleAvatar( radius: 20,    backgroundColor: Colors.blue, child: Icon(Icons.favorite_border, color: Colors.white),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding:  EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Hello, Suraj ", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              const Text("Discover your favorite items",style: TextStyle(fontSize: 16, color: Colors.black54)),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context,MaterialPageRoute(builder: (context) => SearchScreen()),);
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 10),
                            const Icon(Icons.search, color: Colors.grey),
                            const SizedBox(width: 10),
                            Text("Search products, brands...",style: TextStyle(color: Colors.grey,fontSize: 15),),
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
                  ),
                ],
              ),
              SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                // child: Row(
                //   children: [
                //     _buildCategoryChip("All", isSelected: true),
                //     _buildCategoryChip("Home"),
                //     _buildCategoryChip("Mobile"),
                //     _buildCategoryChip("Fashion"),
                //     _buildCategoryChip("Electronics"),
                //   ],
                // ),
                child: Row(
                  children: provider.categories.map((cat) {
                    return _buildCategoryChip(cat.title ?? "");
                  }).toList(),
                ),

              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Popular Products", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), ),
                  Text("View All", style: TextStyle(color: Colors.blue)),
                ],
              ),
              SizedBox(height: 15),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: provider.products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) {
                  // return _buildProductCard(
                  //   image: "images/first_image.jpeg",
                  //   name: "Nike Club T-Shirt",oldPrice: 800, newPrice: 500,    rating: 4.2, discount: 38,
                  // );
                  return _buildProductCard(
                    image: provider.products[index].image ?? "",
                    name: provider.products[index].name ?? "",
                    oldPrice: provider.products[index].oldPrice?.toDouble() ?? 0,
                    newPrice: provider.products[index].newPrice?.toDouble() ?? 0,
                    rating: provider.products[index].rating?.toDouble() ?? 0.0,
                    discount: provider.products[index].discount ?? 0,
                  );

                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String title, {bool isSelected = false}) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.blueAccent.shade100),
      ),
      child: Text(title,style: TextStyle(color: isSelected ? Colors.white : Colors.blue, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _buildProductCard({
    required String image,
    required String name,
    required double oldPrice,
    required double newPrice,
    required double rating,
    required int discount,
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
                      image.startsWith("http") ? image: "http://10.21.98.64:3000/uploads/$image", width: double.infinity, fit: BoxFit.cover,)
                ),

                const Positioned(
                  right: 8,
                  top: 8,
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.white,child: Icon(Icons.favorite_border, color: Colors.red),
                  ),
                ),
              ],
            ),
          ),

          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              child: Text(name,  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, height: 1.2),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,)),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                const Icon(Icons.star, color: Colors.green, size: 16),
                const SizedBox(width: 4),
                Text(  rating.toString(), style: const TextStyle( color: Colors.black87, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 8).copyWith(bottom: 8),
            child: Row(
              children: [
                Text("₹$newPrice",style: const TextStyle( color: Colors.blue,fontWeight: FontWeight.bold, fontSize: 15),),
                const SizedBox(width: 6),
                Text("₹$oldPrice", style: const TextStyle( color: Colors.grey,  decoration: TextDecoration.lineThrough ,fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

