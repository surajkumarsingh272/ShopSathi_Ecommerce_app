// import 'package:flutter/material.dart';
// import 'package:shop_sathi_app/screen/product_screen.dart';
//
//
// class SearchScreen extends StatefulWidget {
//   const SearchScreen({super.key});
//
//   @override
//   State<SearchScreen> createState() => _SearchScreenState();
// }
//
// class _SearchScreenState extends State<SearchScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       appBar: AppBar(
//         titleSpacing: 0,
//         backgroundColor: Colors.white,
//         title: Row(
//           children: [
//             Expanded(
//               child: GestureDetector(
//                 onTap: () {
//                   Navigator.push(context, MaterialPageRoute(builder: (context) => ProductScreen(),));
//                 },
//                 child: Container(
//                   height: 45,
//                   decoration: BoxDecoration(
//                     color: Colors.grey[200],
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Row(
//                     children:  [
//                       SizedBox(width: 10),
//                       Icon(Icons.search, color: Colors.grey),
//                       SizedBox(width: 10),
//                       Expanded(
//                         child: TextField(
//                           decoration: InputDecoration(
//                             hintText: "Search for products, brands...",
//                             hintStyle:
//                             TextStyle(color: Colors.grey, fontSize: 15),
//                             border: InputBorder.none,
//                           ),
//                           onTap: () {
//                             Navigator.push(context, MaterialPageRoute(builder: (context) => ProductScreen(),));
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//              SizedBox(width: 8),
//             Container(
//               height: 45,
//               width: 45,
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: const Icon(Icons.mic, color: Colors.white, size: 22),
//             ),
//             const SizedBox(width: 10),
//           ],
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 10),
//             const Text(  "Your Recent Searches",
//               style: TextStyle(
//                   fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
//             ),
//             const SizedBox(height: 12),
//             Wrap(
//               spacing: 10,
//               runSpacing: 10,
//               children: [
//                 _buildSearchChip("Shoes"),
//                 _buildSearchChip("T-shirt"),
//                 _buildSearchChip("Watch"),
//                 _buildSearchChip("Mobile"),
//                 _buildSearchChip("Saree"),
//               ],
//             ),
//             const SizedBox(height: 30),
//             const Text(
//               "Popular Searches",
//               style: TextStyle(
//                   fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
//             ),
//             const SizedBox(height: 15),
//             Wrap(
//               spacing: 10,
//               runSpacing: 10,
//               children: [
//                 _buildPopularChip(Icons.shopping_bag, "Kurti Set", Colors.pink),
//                 _buildPopularChip(Icons.access_time, "Watch", Colors.orange),
//                 _buildPopularChip(Icons.face_retouching_natural, "Earrings", Colors.purple),
//                 _buildPopularChip(Icons.shopping_basket, "Sweater", Colors.green),
//                 _buildPopularChip(Icons.emoji_people, "Short Kurti", Colors.red),
//                 _buildPopularChip(Icons.checkroom, "Jacket", Colors.teal),
//
//               ],
//             ),
//             const SizedBox(height: 40),
//             ClipRRect(
//               borderRadius: BorderRadius.circular(15),
//               child: Image.asset(
//                 "assets/image/search1.jpeg",
//                 fit: BoxFit.cover,
//                 width: double.infinity,
//                 height: 180,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildSearchChip(String text) {
//     return Chip(
//       label: Text(text,
//           style: const TextStyle(color: Colors.black, fontSize: 14)),
//       backgroundColor: Colors.white,
//       elevation: 1,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(18),
//         side: BorderSide(color: Colors.blueAccent),
//       ),
//     );
//   }
//
//   Widget _buildPopularChip(IconData icon, String text,Color iconColor) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Icon(icon, color: iconColor, size: 18),
//            SizedBox(width: 6),
//           Text(text, style:  TextStyle(fontSize: 14, color: Colors.black)),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/search_providers/search_provider.dart';
import '../screen/product_screen.dart';
import '../models/product_model.dart';

class SearchScreen extends StatefulWidget {
  final int userId;
  const SearchScreen({super.key, required this.userId});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<SearchProvider>(context, listen: false);
    provider.getRecentSearches(widget.userId);
    provider.getPopularSearches();
  }


  void _onSearch(String query) {
    final provider = Provider.of<SearchProvider>(context, listen: false);
    provider.searchProducts(query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Expanded(
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    const Icon(Icons.search, color: Colors.grey),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: const InputDecoration(
                          hintText: "Search for products, brands...",
                          hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                          border: InputBorder.none,
                        ),
                        onChanged: _onSearch,
                        onSubmitted: (value) {
                          if (value.isNotEmpty) {
                            Provider.of<SearchProvider>(context, listen: false).saveRecentSearch(widget.userId, value);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 8),
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.mic, color: Colors.white, size: 22),
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
      body: Consumer<SearchProvider>(
        builder: (context, provider, child) {
          // If search bar empty → show recent + popular
          if (_controller.text.isEmpty) {
            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                const Text(
                  "Your Recent Searches",
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: provider.recentSearches.isEmpty
                      ? [
                    _buildSearchChip("Shoes"),
                    _buildSearchChip("T-shirt"),
                    _buildSearchChip("Watch"),
                    _buildSearchChip("Mobile"),
                    _buildSearchChip("Saree"),
                  ]
                      : provider.recentSearches
                      .map((e) => _buildSearchChip(e.keyword))
                      .toList(),
                ),
                const SizedBox(height: 30),
                const Text(
                  "Popular Searches",
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                const SizedBox(height: 15),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: provider.popularSearches.isEmpty
                      ? [
                    _buildPopularChip(Icons.shopping_bag, "Kurti Set", Colors.pink),
                    _buildPopularChip(Icons.access_time, "Watch", Colors.orange),
                    _buildPopularChip(Icons.face_retouching_natural, "Earrings", Colors.purple),
                    _buildPopularChip(Icons.shopping_basket, "Sweater", Colors.green),
                    _buildPopularChip(Icons.emoji_people, "Short Kurti", Colors.red),
                    _buildPopularChip(Icons.checkroom, "Jacket", Colors.teal),
                  ]
                      : provider.popularSearches
                      .map((e) => _buildPopularChip(Icons.trending_up, e.keyword, Colors.blue))
                      .toList(),
                ),
                const SizedBox(height: 40),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    "assets/image/search1.jpeg",
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 180,
                  ),
                ),
              ],
            );
          }

          return provider.searchResults.isEmpty
              ? const Center(
              child: Text("No results found",
                  style: TextStyle(color: Colors.grey, fontSize: 16)))
              : ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: provider.searchResults.length,
            itemBuilder: (context, index) {
              final ProductModel product = provider.searchResults[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 6),
                child: ListTile(

                  leading: product.image != null
                      ? Image.network(
                    product.image!,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.image),
                  )
                      : const Icon(Icons.image),
                  title: Text(product.name ?? ''),
                  subtitle: Text("₹${product.newPrice}"),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                                ProductScreen(productId: product.id)));
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildSearchChip(String text) {
    return ActionChip(
      label: Text(
        text,
        style: const TextStyle(color: Colors.black, fontSize: 14),
      ),
      backgroundColor: Colors.white,
      elevation: 1,
      onPressed: () {
        _controller.text = text;
        _onSearch(text);
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        side: const BorderSide(color: Colors.blueAccent),
      ),
    );
  }

  Widget _buildPopularChip(IconData icon, String text, Color iconColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: iconColor, size: 18),
          const SizedBox(width: 6),
          Text(text, style: const TextStyle(fontSize: 14, color: Colors.black)),
        ],
      ),
    );
  }
}
