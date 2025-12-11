  import 'package:flutter/material.dart';
  import 'package:provider/provider.dart';
  import 'package:shared_preferences/shared_preferences.dart';

  import '../providers/cart_provider.dart';
  import '../providers/product_details_provider.dart';
  import '../services/product_api.dart';
  import 'auth_screen/login_screen.dart';
  import 'order_review_second_screen.dart';

  class ProductDetailsPage extends StatefulWidget {
    final int productId;
    const ProductDetailsPage({super.key, required this.productId});

    @override
    State<ProductDetailsPage> createState() => _ProductDetailsPageState();
  }

  class _ProductDetailsPageState extends State<ProductDetailsPage> {
    int selectedSize = 0;
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
            _productImageCarousel(),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _productTitle(),
                    const SizedBox(height: 10),
                    _priceSection(),
                    const SizedBox(height: 20),
                    _offersSection(),
                    const SizedBox(height: 20),
                    _divider(),

                    _buildTitle("Select Color"),
                    const SizedBox(height: 10),
                    _colorOptions(),
                    const SizedBox(height: 20),

                    _buildTitle("Select Size"),
                    const SizedBox(height: 10),
                    _sizeOptions(),
                    const SizedBox(height: 20),
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
                    _description(1),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    // ---------------- IMAGE CAROUSEL ----------------
    Widget _productImageCarousel() {
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
              background: PageView.builder(
                itemCount: provider.images.length,
                itemBuilder: (context, index) {
                  final imgUrl = provider.images[index].imageUrl;
                  final fullUrl = imgUrl.startsWith("http")
                      ? imgUrl
                      : "https://shop-sathi-api.onrender.com/uploads/$imgUrl";
                  return Image.network(
                    fullUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                    const Center(child: Icon(Icons.broken_image)),
                  );
                },
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
                style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.orange.shade600, size: 20),
                  const SizedBox(width: 4),
                  Text("${product.rating?.toStringAsFixed(1) ?? 0}",
                      style: const TextStyle(fontSize: 16)),
                  const SizedBox(width: 10),
                  Text("${product.ratingCount ?? 0} Ratings",
                      style: TextStyle(color: Colors.grey.shade600)),
                ],
              ),
            ],
          );
        },
      );
    }

    // ---------------- PRICE SECTION ----------------
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
                style: const TextStyle(
                    fontSize: 32, fontWeight: FontWeight.bold, color: Colors.green),
              ),
              const SizedBox(width: 10),
              Text(
                "₹${product.oldPrice ?? 0}",
                style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    color: Colors.grey.shade600,
                    fontSize: 16),
              ),
              const SizedBox(width: 10),
              if (discount > 0)
                Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(6)),
                  child: Text("₹${product.discount ?? 0}%",
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ),
            ],
          );
        },
      );
    }

    Widget _offersSection() {
      return Consumer<ProductDetailsProvider>(
        builder: (context, provider, child) {
          if (provider.offers.isEmpty) {
            return const SizedBox();
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitle("Available Offers"),
              const SizedBox(height: 10),
              Column(
                children: provider.offers
                    .map((offer) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    children: [
                      Icon(Icons.local_offer,
                          size: 20, color: Colors.green.shade700),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          offer.offerText ?? "",
                          style: TextStyle(
                              fontSize: 14, color: Colors.grey.shade800),
                        ),
                      ),
                    ],
                  ),
                ))
                    .toList(),
              ),
            ],
          );
        },
      );
    }

    // ---------------- DIVIDER ----------------
    Widget _divider() => const Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Divider(thickness: 1),
    );

    // ---------------- DELIVERY ----------------
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
              const Text("Free Delivery in 2–3 days",
                  style: TextStyle(fontSize: 15)),
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
                  child: const Text("Check",
                      style: TextStyle(fontSize: 15)))
            ],
          )
        ],
      );
    }

    // ---------------- RATINGS ----------------
    Widget _ratingsSection() {
      return Consumer<ProductDetailsProvider>(
        builder: (context, provider, child) {
          final product = provider.product;
          if (product == null) return const SizedBox();
          final stars = [5, 4, 3, 2, 1];
          final widths = [70.0, 50.0, 20.0, 6.0, 4.0];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitle("Ratings & Reviews"),
              const SizedBox(height: 12),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${product.rating?.toStringAsFixed(1) ?? 0}",
                      style: const TextStyle(
                          fontSize: 36, fontWeight: FontWeight.bold)),
                  const SizedBox(width: 12),
                  Column(
                    children: List.generate(
                        stars.length,
                            (i) => _ratingBar(stars[i], widths[i])),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${product.ratingCount ?? 0} Ratings",
                          style: TextStyle(color: Colors.grey.shade600)),
                      TextButton(
                          onPressed: () {},
                          child: const Text("See all reviews",
                              style: TextStyle(fontSize: 13)))
                    ],
                  )
                ],
              )
            ],
          );
        },
      );
    }

    Widget _ratingBar(int star, double width) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Row(
          children: [
            Text("$star ★", style: const TextStyle(fontSize: 13)),
            const SizedBox(width: 4),
            Container(
              height: 6,
              width: width,
              color: Colors.green,
            )
          ],
        ),
      );
    }

    // ---------------- COLOR OPTIONS ----------------
    Widget _colorOptions() {
      return Consumer<ProductDetailsProvider>(
        builder: (context, provider, child) {
          if (provider.colors.isEmpty) return const SizedBox();
          return SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: provider.colors.length,
              itemBuilder: (context, index) {
                final colorCode = provider.colors[index].colorCode;
                return GestureDetector(
                  onTap: () => setState(() => selectedColor = index),
                  child: Container(
                    margin: const EdgeInsets.only(right: 12),
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: selectedColor == index
                              ? Colors.blue
                              : Colors.grey.shade400),
                    ),
                    child: CircleAvatar( radius: 14,
                      backgroundColor: Color(int.parse
                        ( "0xff${provider.colors[index].colorCode.replaceAll("#", "")}")),
                  ),)
                );
              },
            ),
          );
        },
      );
    }

    // ---------------- SIZE OPTIONS ----------------
    Widget _sizeOptions() {
      return Consumer<ProductDetailsProvider>(
        builder: (context, provider, child) {
          if (provider.sizes.isEmpty) return const SizedBox();
          return SizedBox(
            height: 50, // container ke height ke liye
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: provider.sizes.length,
              itemBuilder: (context, index) {
                final size = provider.sizes[index].size;
                return GestureDetector(
                  onTap: () => setState(() => selectedSize = index),
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: selectedSize == index
                            ? Colors.blue
                            : Colors.grey.shade400,
                      ),
                    ),
                    child: Text(
                      size,
                      style: TextStyle(
                        color: selectedSize == index
                            ? Colors.blue.shade700
                            : Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      );
    }

    // ---------------- HIGHLIGHTS ----------------
    Widget _highlights() {
      return Consumer<ProductDetailsProvider>(
        builder: (context, provider, child) {
          final highlights = provider.highlights;

          if (highlights.isEmpty) {
            return const SizedBox();
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: highlights
                .map((highlight) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  const Icon(Icons.check, size: 18, color: Colors.green),
                  const SizedBox(width: 8),
                  Expanded(child: Text(highlight.highlightText)),
                ],
              ),
            ))
                .toList(),
          );
        },
      );
    }




    // ---------------- DESCRIPTION ----------------
    Widget _description(int productId) {
      return FutureBuilder<String?>(
        future: ProductApi.fetchProductDescription(productId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text("Error loading description");
          } else if (snapshot.hasData && snapshot.data != null) {
            return Text(
              snapshot.data!,
              style: const TextStyle(
                height: 1.5,
                fontSize: 15,
              ),
            );
          } else {
            return const SizedBox(); // agar description null ho
          }
        },
      );
    }


    // ---------------- TITLE ----------------
    Widget _buildTitle(String text) {
      return Text(text,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700));
    }

    // ---------------- BOTTOM BAR ----------------
    Widget _bottomBar() {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 12),
          ],
        ),
        child: Row(
          children: [
            // Expanded(
            //   child: ElevatedButton.icon(
            //     onPressed: () {},
            //     icon: const Icon(Icons.shopping_cart_outlined,color: Colors.white,),
            //     label: const Text("Add to Cart",
            //         style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white)),
            //     style: ElevatedButton.styleFrom(
            //       backgroundColor: Colors.blue.shade700,
            //       padding: const EdgeInsets.symmetric(vertical: 14),
            //       shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(10)),
            //     ),
            //   ),
            // ),
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  final userId = prefs.getInt("userId") ?? 0;
                  final productProvider = Provider.of<ProductDetailsProvider>(context, listen: false);
                  final colorList = productProvider.colors;
                  final colorId = (colorList.isNotEmpty && selectedColor < colorList.length) ? colorList[selectedColor].id: null;
                  if (userId == 0) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please login first")), );
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginScreen()), );
                    return;
                  }
                  final quantity = 1;
                  Provider.of<CartProvider>(context, listen: false).addToCart(
                    userId: userId,
                    productId: widget.productId,
                    colorId: colorId,
                    quantity: quantity,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Added to cart")),
                  );
                },
                icon: const Icon(Icons.shopping_cart_outlined, color: Colors.white),
                label: const Text(
                  "Add to Cart",
                  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade700,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),


            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {
                  final productProvider = Provider.of<ProductDetailsProvider>(context, listen: false);
                  final product = productProvider.product;
                  Navigator.push(context, MaterialPageRoute(builder: (context) => OrderReviewSecondScreen(product: product!,),));
                },
                icon: const Icon(Icons.flash_on,color: Colors.white,),
                label: const Text("Buy Now",
                    style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange.shade700,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
