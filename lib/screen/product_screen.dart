// import 'package:flutter/material.dart';
//
// class ProductScreen extends StatelessWidget {
//   const ProductScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final List<Map<String, dynamic>> products = [
//       {
//         'image': 'images/first_image.jpeg',
//         'name': 'Casual Cotton Shirt',
//         'rating': 4.2,
//         'discount': '40% OFF',
//         'oldPrice': 999,
//         'newPrice': 599,
//       },
//       {
//         'image': 'images/first_image.jpeg',
//         'name': 'Running Shoes',
//         'rating': 4.5,
//         'discount': '35% OFF',
//         'oldPrice': 1999,
//         'newPrice': 1299,
//       },
//       {
//         'image': 'images/first_image.jpeg',
//         'name': 'Stylish Wrist Watch',
//         'rating': 4.0,
//         'discount': '50% OFF',
//         'oldPrice': 2499,
//         'newPrice': 1249,
//       },
//       {
//         'image': 'images/first_image.jpeg',
//         'name': 'Designer Saree',
//         'rating': 4.3,
//         'discount': '60% OFF',
//         'oldPrice': 2999,
//         'newPrice': 1199,
//       },
//     ];
//
//     return Scaffold(
//       backgroundColor: const Color(0xfff5f6fa),
//
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white,
//         automaticallyImplyLeading: false,
//         titleSpacing: 12,
//         title: Row(
//           children: [
//             InkWell(
//               onTap: () => Navigator.pop(context),
//               child: const Icon(Icons.arrow_back, color: Colors.blue, size: 26),
//             ),
//             const SizedBox(width: 12),
//
//             Expanded(
//               child: Container(
//                 height: 45,
//                 decoration: BoxDecoration(
//                   color: const Color(0xfff0f0f0),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: TextField(
//                   decoration: InputDecoration(
//                     prefixIcon: Icon(Icons.search, color: Colors.grey.shade700),
//                     hintText: "Search for products...",
//                     hintStyle: const TextStyle(fontSize: 14),
//                     border: InputBorder.none,
//                   ),
//                 ),
//               ),
//             ),
//
//              SizedBox(width: 8),
//
//             Container(
//               height: 45,
//               width: 45,
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: const Icon(Icons.mic, color: Colors.white),
//             )
//           ],
//         ),
//       ),
//
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//              SizedBox(height: 14),
//              SizedBox(
//               height: 170,
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 children: [
//                   const SizedBox(width: 12),
//                   banner("images/third_image.jpg"),
//                   banner("images/third_image.jpg"),
//                   banner("images/third_image.jpg"),
//                   const SizedBox(width: 12),
//                 ],
//               ),
//             ),
//
//             const SizedBox(height: 16),
//
//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 14),
//               child: Text("Best Deals For You",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700)),
//             ),
//             const SizedBox(height: 10),
//             Padding(
//               padding:  EdgeInsets.symmetric(horizontal: 12),
//               child: GridView.builder(
//                 itemCount: products.length,
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   mainAxisExtent: 280,
//                   crossAxisSpacing: 12,
//                   mainAxisSpacing: 12,
//                 ),
//                 itemBuilder: (context, index) =>
//                     productCard(products[index]),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//   Widget banner(String img) {
//     return Container(
//       margin: const EdgeInsets.only(right: 12),
//       width: 260,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(18),
//         color: Colors.grey[200],
//       ),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(18),
//         child: Image.asset(img, fit: BoxFit.cover),
//       ),
//     );
//   }
//
//   Widget productCard(Map<String, dynamic> p) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(14),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black12.withOpacity(0.05),
//             blurRadius: 8,
//             offset: const Offset(0, 3),
//           )
//         ],
//       ),
//
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Stack(
//             children: [
//               ClipRRect(
//                 borderRadius:
//                 const BorderRadius.vertical(top: Radius.circular(14)),
//                 child: Image.asset( p['image'], height: 170,   width: double.infinity, fit: BoxFit.cover,)),
//               Positioned(
//                 top: 8,
//                 right: 8,
//                 child: Container(
//                   height: 34,
//                   width: 34,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     shape: BoxShape.circle,
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black12.withOpacity(0.2),
//                         blurRadius: 5,
//                       )
//                     ],
//                   ),
//                   child: const Icon(Icons.favorite_border,  color: Colors.red, size: 20),
//                 ),
//               )
//             ],
//           ),
//
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text( p['name'], maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
//                 const SizedBox(height: 6),
//                 Row(
//                   children: [
//                     Container(
//                       padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
//                       decoration: BoxDecoration(
//                         color: Colors.green,
//                         borderRadius: BorderRadius.circular(6),
//                       ),
//                       child: Row(
//                         children: [
//                           Text( p['rating'].toString(),style: const TextStyle( color: Colors.white, fontSize: 12),),
//                           const Icon(Icons.star, color: Colors.white, size: 12),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(width: 6),
//                     const Text( "2,340 ratings", style: TextStyle(fontSize: 11, color: Colors.grey),)
//                   ],
//                 ),
//
//                 const SizedBox(height: 8),
//                 Row(
//                   children: [
//                     Text( p['discount'],style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold,fontSize: 13,)),
//                     const SizedBox(width: 5),
//                     Text( "₹${p['oldPrice']}",  style: const TextStyle( decoration: TextDecoration.lineThrough,fontSize: 12,color: Colors.grey,)),
//                     const SizedBox(width: 6),
//                     Text("₹${p['newPrice']}", style: const TextStyle( fontSize: 15,   color: Colors.blue, fontWeight: FontWeight.w700)),
//                   ],
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product_model.dart';
import '../providers/product_provider.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProductProvider>(context, listen: false).loadProductScreenProducts();
  }
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductProvider>(context).products;
    return Scaffold(
      backgroundColor: const Color(0xfff5f6fa),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        titleSpacing: 12,
        title: Row(
          children: [
            InkWell(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.arrow_back, color: Colors.blue, size: 26),
            ),
            const SizedBox(width: 12),

            Expanded(
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  color: const Color(0xfff0f0f0),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search, color: Colors.grey.shade700),
                    hintText: "Search for products...",
                    hintStyle: const TextStyle(fontSize: 14),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),

            SizedBox(width: 8),

            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.mic, color: Colors.white),
            )
          ],
        ),
      ),

      body: Consumer<ProductProvider>( builder: (context, provider, child) {
        final products = provider.productScreenProducts;
        if (products.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 14),
              SizedBox(
                height: 170,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    const SizedBox(width: 12),
                    banner("images/third_image.jpg"),
                    banner("images/third_image.jpg"),
                    banner("images/third_image.jpg"),
                    const SizedBox(width: 12),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 14),
                child: Text("Best Deals For You", style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.w700)),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: GridView.builder(
                  itemCount: products.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 280,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemBuilder: (context, index) =>
                      productCard(products[index]),
                ),
              )
            ],
          ),
        );
      })
    );
  }

  Widget banner(String img) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      width: 260,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.grey[200],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Image.asset(img, fit: BoxFit.cover),
      ),
    );
  }

  Widget productCard(ProductModel p) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 3),
          )
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [

              SizedBox(
                height: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(14)),
                  child: Image.network( p.image!.startsWith("http") ? p.image! : "http://10.21.98.64:3000/uploads/${p.image!}",
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),

              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  height: 34,
                  width: 34,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12.withOpacity(0.2),
                        blurRadius: 5,
                      )
                    ],
                  ),
                  child: const Icon(Icons.favorite_border,  color: Colors.red, size: 20),
                ),
              )
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text( p.name.toString(), maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        children: [
                          Text( p.rating.toString(),style: const TextStyle( color: Colors.white, fontSize: 12),),
                          const Icon(Icons.star, color: Colors.white, size: 12),
                        ],
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Text( "2,340 ratings", style: TextStyle(fontSize: 11, color: Colors.grey),)
                  ],
                ),

                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(p.discount.toString(),style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold,fontSize: 13,)),
                    const SizedBox(width: 5),
                    Text( "₹${p.oldPrice.toString()}",  style: const TextStyle( decoration: TextDecoration.lineThrough,fontSize: 12,color: Colors.grey,)),
                    const SizedBox(width: 6),
                    Text("₹${p.newPrice.toString()}", style: const TextStyle( fontSize: 15,   color: Colors.blue, fontWeight: FontWeight.w700)),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
