// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// class ProductDetailsPage extends StatefulWidget {
//   const ProductDetailsPage({super.key});
//
//   @override
//   State<ProductDetailsPage> createState() => _ProductDetailsPageState();
// }
//
// class _ProductDetailsPageState extends State<ProductDetailsPage> {
//   int selectedSize = 1;
//   int selectedColor = 0;
//
//   final List<String> sizes = ["S", "M", "L", "XL","2XL"];
//   final List<Color> colors = [
//     Colors.black,
//     Colors.blueGrey,
//     Colors.brown,
//     Colors.red,
//     Colors.green,
//     Colors.white
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       bottomNavigationBar: _bottomBar(),
//       body: CustomScrollView(
//         slivers: [
//           _productImage(),
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.all(18),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   _productTitle(),
//                   _priceSection(),
//                   _offersSection(),
//                   _divider(),
//
//                   _buildTitle("Select Color"),
//                   const SizedBox(height: 10),
//                   _colorOptions(),
//                   const SizedBox(height: 20),
//
//                   _buildTitle("Select Size"),
//                   const SizedBox(height: 10),
//                   _sizeOptions(),
//                   const SizedBox(height: 25),
//
//                   _divider(),
//
//                   _deliverySection(),
//                   const SizedBox(height: 25),
//
//                   _ratingsSection(),
//                   const SizedBox(height: 25),
//
//                   _divider(),
//
//                   _buildTitle("Highlights"),
//                   const SizedBox(height: 10),
//                   _highlights(),
//                   const SizedBox(height: 25),
//
//                   _buildTitle("Description"),
//                   const SizedBox(height: 8),
//                   _description(),
//
//                   const SizedBox(height: 30),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // ---------------- IMAGE SECTION ----------------
//   Widget _productImage() {
//     return SliverAppBar(
//       expandedHeight: 350,
//       backgroundColor: Colors.white,
//       pinned: true,
//       elevation: 0,
//
//       leading: Padding(
//         padding: const EdgeInsets.all(8),
//         child: CircleAvatar(
//           backgroundColor: Colors.white,
//           child: IconButton(
//             icon: const Icon(Icons.arrow_back, color: Colors.black54),
//             onPressed: () => Navigator.pop(context),
//           ),
//         ),
//       ),
//
//       actions: [
//         Padding(
//           padding: const EdgeInsets.only(top: 10,right: 15,bottom: 10),
//           child: CircleAvatar(
//             backgroundColor: Colors.white,
//             child: IconButton(
//               icon: const Icon(Icons.favorite_border, color: Colors.black45),
//               onPressed: () {},
//             ),
//           ),
//         ),
//       ],
//
//       flexibleSpace: FlexibleSpaceBar(
//         background: Padding(
//           padding: const EdgeInsets.only(top: 20),
//           child: Image.asset(
//             "images/first_image.jpeg",
//             fit: BoxFit.cover,
//           ),
//         ),
//       ),
//     );
//   }
//
//
//   // ---------------- PRODUCT DETAILS ----------------
//   Widget _productTitle() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "Casual Cotton Shirt",
//           style: const TextStyle(
//             fontSize: 26,
//             fontWeight: FontWeight.w700,
//           ),
//         ),
//         const SizedBox(height: 6),
//         Row(
//           children: [
//             Icon(Icons.star, color: Colors.orange.shade600, size: 20),
//             const SizedBox(width: 4),
//             const Text("4.2", style: TextStyle(fontSize: 16)),
//             const SizedBox(width: 10),
//             Text("1,245 ratings",
//                 style: TextStyle(color: Colors.grey.shade600)),
//           ],
//         ),
//         const SizedBox(height: 10),
//       ],
//     );
//   }
//
//   Widget _priceSection() {
//     return Row(
//       children: [
//         const Text(
//           "₹599",
//           style: TextStyle(
//             fontSize: 32,
//             fontWeight: FontWeight.bold,
//             color: Colors.green,
//           ),
//         ),
//         const SizedBox(width: 10),
//         Text(
//           "₹999",
//           style: TextStyle(
//             decoration: TextDecoration.lineThrough,
//             color: Colors.grey.shade600,
//             fontSize: 16,
//           ),
//         ),
//         const SizedBox(width: 10),
//         Container(
//           padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//           decoration: BoxDecoration(
//               color: Colors.green,
//               borderRadius: BorderRadius.circular(6)),
//           child: const Text(
//             "40% OFF",
//             style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
//           ),
//         )
//       ],
//     );
//   }
//
//   Widget _offersSection() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const SizedBox(height: 18),
//         _buildTitle("Available Offers"),
//         const SizedBox(height: 10),
//         _offerItem("Bank offer: 10% instant discount on HDFC Credit cards"),
//         _offerItem("Special price: Get extra ₹50 off (price inclusive)"),
//         _offerItem("Buy 2 get 10% extra off"),
//       ],
//     );
//   }
//
//   Widget _offerItem(String text) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4),
//       child: Row(
//         children: [
//           Icon(Icons.local_offer,
//               size: 20, color: Colors.green),
//           const SizedBox(width: 8),
//           Expanded(
//             child: Text(text,
//                 style: TextStyle(fontSize: 14, color: Colors.grey.shade800)),
//           )
//         ],
//       ),
//     );
//   }
//
//   Widget _divider() {
//     return const Padding(
//       padding: EdgeInsets.symmetric(vertical: 22),
//       child: Divider(thickness: 1),
//     );
//   }
//
//   // ---------------- DELIVERY SECTION ----------------
//   Widget _deliverySection() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         _buildTitle("Delivery"),
//         const SizedBox(height: 8),
//         Row(
//           children: [
//             Icon(Icons.local_shipping,
//                 color: Colors.blue.shade700, size: 22),
//             const SizedBox(width: 8),
//             const Text(
//               "Free Delivery in 2–3 days",
//               style: TextStyle(fontSize: 15),
//             ),
//           ],
//         ),
//         const SizedBox(height: 12),
//         Row(
//           children: [
//             SizedBox(
//               width: 140,
//               child: TextField(
//                 keyboardType: TextInputType.number,
//                 decoration: InputDecoration(
//                   labelText: "Enter Pincode",
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(6)),
//                   isDense: true,
//                 ),
//               ),
//             ),
//             const SizedBox(width: 10),
//             TextButton(
//                 onPressed: () {},
//                 child: const Text(
//                   "Check",
//                   style: TextStyle(fontSize: 15),
//                 )),
//           ],
//         )
//       ],
//     );
//   }
//
//   // ---------------- RATINGS ----------------
//   Widget _ratingsSection() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         _buildTitle("Ratings & Reviews"),
//         const SizedBox(height: 15),
//
//         Row(
//           children: [
//             const Text("4.2",
//                 style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
//             const SizedBox(width: 10),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 _ratingBar(5, 70),
//                 _ratingBar(4, 50),
//                 _ratingBar(3, 20),
//                 _ratingBar(2, 6),
//                 _ratingBar(1, 4),
//               ],
//             )
//           ],
//         ),
//       ],
//     );
//   }
//
//   Widget _ratingBar(int star, double width) {
//     return Row(
//       children: [
//         Text("$star ★  ",
//             style: const TextStyle(fontSize: 13)),
//         Container(
//           height: 6,
//           width: width,
//           color: Colors.green,
//         ),
//       ],
//     );
//   }
//
//   // ---------------- HIGHLIGHTS ----------------
//   Widget _highlights() {
//     final List<String> points = [
//       "100% Pure Cotton",
//       "Slim Fit Pattern",
//       "Suitable for Office & Casual Wear",
//       "Soft & Premium Fabric Quality",
//     ];
//
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: points
//           .map((e) => Padding(
//         padding: const EdgeInsets.only(bottom: 8),
//         child: Row(
//           children: [
//             const Icon(Icons.check, size: 18, color: Colors.green),
//             const SizedBox(width: 8),
//             Expanded(child: Text(e)),
//           ],
//         ),
//       ))
//           .toList(),
//     );
//   }
//
//   // ---------------- DESCRIPTION ----------------
//   Widget _description() {
//     return const Text(
//       "This premium cotton shirt is made from high-quality soft fabric. "
//           "Its slim-fit pattern gives a modern and stylish look. Suitable "
//           "for both casual and office wear.",
//       style: TextStyle(height: 1.5, fontSize: 15),
//     );
//   }
//
//   // ---------------- SIZE ----------------
//   Widget _buildTitle(String text) {
//     return Text(
//       text,
//       style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
//     );
//   }
//
//   Widget _colorOptions() {
//     return Row(
//       children: List.generate(
//         colors.length,
//             (index) => GestureDetector(
//           onTap: () => setState(() => selectedColor = index),
//           child: Container(
//             margin: const EdgeInsets.only(right: 12),
//             padding: const EdgeInsets.all(3),
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               border: Border.all(
//                 color: selectedColor == index
//                     ? Colors.blue
//                     : Colors.grey.shade400,
//               ),
//             ),
//             child: CircleAvatar(
//               radius: 12,
//               backgroundColor: colors[index],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _sizeOptions() {
//     return Row(
//       children: List.generate(
//         sizes.length,
//             (index) => GestureDetector(
//           onTap: () => setState(() => selectedSize = index),
//           child: Container(
//             margin: const EdgeInsets.only(right: 10),
//             padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(8),
//               border: Border.all(
//                 color: selectedSize == index
//                     ? Colors.blue
//                     : Colors.grey.shade400,
//               ),
//             ),
//             child: Text(
//               sizes[index],
//               style: TextStyle(
//                 color:
//                 selectedSize == index ? Colors.blue.shade700 : Colors.black,
//                 fontSize: 15,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   // ---------------- BOTTOM BAR ----------------
//   Widget _bottomBar() {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.08),
//             blurRadius: 10,
//           ),
//         ],
//       ),
//       child: Row(
//         children: [
//           Expanded(
//             child: Container(
//               height: 48,
//               decoration: BoxDecoration(
//                 color: Colors.blue.shade700,
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: const Center(
//                 child: Text(
//                   "Add to Cart",
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600),
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(width: 12),
//           Expanded(
//             child: Container(
//               height: 48,
//               decoration: BoxDecoration(
//                 color: Colors.orange.shade700,
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: const Center(
//                 child: Text(
//                   "Buy Now",
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product_details_provider.dart';

class ProductDetailsPage extends StatefulWidget {
  final int productId;
  const ProductDetailsPage({super.key, required this.productId});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int selectedSize = 1;
  int selectedColor = 0;

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<ProductDetailsProvider>(context, listen: false);
    provider.loadAllProductData(widget.productId);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: _bottomBar(),
      body: CustomScrollView(
        slivers: [
          _productImage(),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _productTitle(),
                  _priceSection(),
                  _offersSection(),
                  _divider(),

                  _buildTitle("Select Color"),
                  const SizedBox(height: 10),
                  _colorOptions(),
                  const SizedBox(height: 20),

                  _buildTitle("Select Size"),
                  const SizedBox(height: 10),
                  _sizeOptions(),
                  const SizedBox(height: 25),

                  _divider(),

                  _deliverySection(),
                  const SizedBox(height: 25),

                  _ratingsSection(),
                  const SizedBox(height: 25),

                  _divider(),

                  _buildTitle("Highlights"),
                  const SizedBox(height: 10),
                  _highlights(),
                  const SizedBox(height: 25),

                  _buildTitle("Description"),
                  const SizedBox(height: 8),
                  _description(),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _productImage() {
    return Consumer<ProductDetailsProvider>(
      builder: (context, provider, child) {
        if (provider.images.isEmpty) {
          return SliverAppBar(
            expandedHeight: 350,
            backgroundColor: Colors.white,
            pinned: true,
            flexibleSpace: const Center(child: CircularProgressIndicator()),
          );
        }
        return SliverAppBar(
          expandedHeight: 350,
          backgroundColor: Colors.white,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.network(
              provider.images.first.imageUrl.startsWith("http")
                  ? provider.images.first.imageUrl
                  : "http://10.21.98.64:3000/${provider.images.first.imageUrl}",
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }



  Widget _productTitle() {
    return Consumer<ProductDetailsProvider>(
      builder: (context, provider, child) {
        final product = provider.product;
        if (product == null) return const SizedBox();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.name ?? "",
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                Icon(Icons.star, color: Colors.orange.shade600, size: 20),
                const SizedBox(width: 4),
                Text("${product.rating ?? 0}", style: const TextStyle(fontSize: 16)),
                const SizedBox(width: 10),
                Text("1,245 ratings", style: TextStyle(color: Colors.grey.shade600)),
              ],
            ),
            const SizedBox(height: 10),
          ],
        );
      },
    );
  }

  Widget _priceSection() {
    return Consumer<ProductDetailsProvider>(
      builder: (context, provider, child) {
        final product = provider.product;
        if (product == null) return const SizedBox();
        final discount = product.discount ?? 0;
        return Row(
          children: [
            Text(
              "₹${product.newPrice ?? 0}",
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            const SizedBox(width: 10),
            Text(
              "₹${product.oldPrice ?? 0}",
              style: TextStyle(decoration: TextDecoration.lineThrough, color: Colors.grey.shade600, fontSize: 16),
            ),
            const SizedBox(width: 10),
            if (discount > 0)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(6)),
                child: Text("$discount% OFF", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
          ],
        );
      },
    );
  }


  Widget _offersSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 18),
        _buildTitle("Available Offers"),
        const SizedBox(height: 10),
        _offerItem("Bank offer: 10% instant discount on HDFC Credit cards"),
        _offerItem("Special price: Get extra ₹50 off (price inclusive)"),
        _offerItem("Buy 2 get 10% extra off"),
      ],
    );
  }

  Widget _offerItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(Icons.local_offer,
              size: 20, color: Colors.green),
          const SizedBox(width: 8),
          Expanded(
            child: Text(text,
                style: TextStyle(fontSize: 14, color: Colors.grey.shade800)),
          )
        ],
      ),
    );
  }

  Widget _divider() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 22),
      child: Divider(thickness: 1),
    );
  }

  // ---------------- DELIVERY SECTION ----------------
  Widget _deliverySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle("Delivery"),
        const SizedBox(height: 8),
        Row(
          children: [
            Icon(Icons.local_shipping,
                color: Colors.blue.shade700, size: 22),
            const SizedBox(width: 8),
            const Text(
              "Free Delivery in 2–3 days",
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            SizedBox(
              width: 140,
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Enter Pincode",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6)),
                  isDense: true,
                ),
              ),
            ),
            const SizedBox(width: 10),
            TextButton(
                onPressed: () {},
                child: const Text(
                  "Check",
                  style: TextStyle(fontSize: 15),
                )),
          ],
        )
      ],
    );
  }

  // ---------------- RATINGS ----------------
  Widget _ratingsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle("Ratings & Reviews"),
        const SizedBox(height: 15),

        Row(
          children: [
            const Text("4.2",
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ratingBar(5, 70),
                _ratingBar(4, 50),
                _ratingBar(3, 20),
                _ratingBar(2, 6),
                _ratingBar(1, 4),
              ],
            )
          ],
        ),
      ],
    );
  }

  Widget _ratingBar(int star, double width) {
    return Row(
      children: [
        Text("$star ★  ",
            style: const TextStyle(fontSize: 13)),
        Container(
          height: 6,
          width: width,
          color: Colors.green,
        ),
      ],
    );
  }

  // ---------------- HIGHLIGHTS ----------------
  Widget _highlights() {
    final List<String> points = [
      "100% Pure Cotton",
      "Slim Fit Pattern",
      "Suitable for Office & Casual Wear",
      "Soft & Premium Fabric Quality",
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: points
          .map((e) => Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Row(
          children: [
            const Icon(Icons.check, size: 18, color: Colors.green),
            const SizedBox(width: 8),
            Expanded(child: Text(e)),
          ],
        ),
      ))
          .toList(),
    );
  }

  // ---------------- DESCRIPTION ----------------
  Widget _description() {
    return const Text(
      "This premium cotton shirt is made from high-quality soft fabric. "
          "Its slim-fit pattern gives a modern and stylish look. Suitable "
          "for both casual and office wear.",
      style: TextStyle(height: 1.5, fontSize: 15),
    );
  }

  // ---------------- SIZE ----------------
  Widget _buildTitle(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
    );
  }

  Widget _colorOptions() {
    return Consumer<ProductDetailsProvider>(
      builder: (context, provider, child) {
        if (provider.colors.isEmpty) return const SizedBox();
        return Row(
          children: List.generate(
            provider.colors.length,
                (index) => GestureDetector(
              onTap: () => setState(() => selectedColor = index),
              child: Container(
                margin: const EdgeInsets.only(right: 12),
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: selectedColor == index ? Colors.blue : Colors.grey.shade400,
                  ),
                ),
                child: CircleAvatar(
                  radius: 12,
                  backgroundColor: Color(int.parse("0xff${provider.colors[index].colorCode.replaceAll("#", "")}")),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _sizeOptions() {
    return Consumer<ProductDetailsProvider>(
      builder: (context, provider, child) {
        if (provider.sizes.isEmpty) return const SizedBox();
        return Row(
          children: List.generate(
            provider.sizes.length,
                (index) => GestureDetector(
              onTap: () => setState(() => selectedSize = index),
              child: Container(
                margin: const EdgeInsets.only(right: 10),
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: selectedSize == index ? Colors.blue : Colors.grey.shade400,
                  ),
                ),
                child: Text(
                  provider.sizes[index].size,
                  style: TextStyle(
                    color: selectedSize == index ? Colors.blue.shade700 : Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }


  // ---------------- BOTTOM BAR ----------------
  Widget _bottomBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                color: Colors.blue.shade700,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Text(
                  "Add to Cart",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                color: Colors.orange.shade700,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Text(
                  "Buy Now",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          Text("aa")
        ],

      ),
    );
  }
}