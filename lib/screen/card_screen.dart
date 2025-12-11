import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_sathi_app/screen/order_review_second_screen.dart';
import '../providers/cart_provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int userId = 0;

  @override
  void initState() {
    super.initState();
    _loadUserIdAndCart();
  }

  void _loadUserIdAndCart() async {
    final prefs = await SharedPreferences.getInstance();
    userId = prefs.getInt("userId") ?? 0;
    Provider.of<CartProvider>(context, listen: false).fetchCart(userId);
  }

  @override
  Widget build(BuildContext context) {
    final cartP = Provider.of<CartProvider>(context);

    double totalPrice = 0;
    for (var item in cartP.items) {
      totalPrice += item.totalPrice;
    }

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
                  children: const [
                    SizedBox(width: 10),
                    Icon(Icons.search, color: Colors.grey),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search for products, brands...",
                          hintStyle:
                          TextStyle(color: Colors.grey, fontSize: 15),
                          border: InputBorder.none,
                        ),
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

      body: cartP.items.isEmpty
          ? const Center(
        child: Text(
          "Your cart is empty",
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      )
          : Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: cartP.items.length,
                itemBuilder: (context, index) {
                  final item = cartP.items[index];

                  return Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 5),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12.withOpacity(0.06),
                            blurRadius: 10,
                            offset: const Offset(0, 3)),
                      ],

                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            "https://shop-sathi-api.onrender.com/uploads/${item.image}",
                            width: 110,
                            height: 135,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.broken_image, size: 50),
                          ),
                        ),
                        const SizedBox(width: 14),

                        // RIGHT SIDE COLUMN
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // NAME
                              Text(
                                item.name,
                                maxLines: 2,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15),
                              ),

                              const SizedBox(height: 6),

                              // PRICE + OLD PRICE + DISCOUNT
                              Row(
                                children: [
                                  Text(
                                    "₹${item.price}",
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    "${item.reviewsCount}% OFF",
                                    style: const TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),
                              Row(
                                children: [
                                  Text(
                                    "${item.reviewsCount}% OFF",
                                    style: const TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  for (int i = 1; i <= 5; i++)
                                    if (i <= (double.tryParse(item.rating.toString()) ?? 0).floor())
                                      const Icon(Icons.star, color: Colors.green, size: 18)
                                    else if (i - 0.5 <= (double.tryParse(item.rating.toString()) ?? 0))
                                      const Icon(Icons.star_half, color: Colors.green, size: 18)
                                    else
                                      const Icon(Icons.star_border, color: Colors.green, size: 18),
                                  const SizedBox(width: 6),
                                  Text("${item.rating}", style: const TextStyle(fontSize: 14)),
                                ],
                              ),

                              const SizedBox(height: 6),
                              Text(
                                "Color: ${item.colorName ?? "-"}",
                                style: const TextStyle(
                                    color: Colors.black54),
                              ),

                              const SizedBox(height: 10),

                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 6, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade100,
                                      borderRadius:
                                      BorderRadius.circular(12),
                                      border: Border.all(
                                          color: Colors.grey.shade300),
                                    ),
                                    child: Row(
                                      children: [
                                        // MINUS BUTTON
                                        InkWell(
                                          borderRadius:
                                          BorderRadius.circular(20),
                                          onTap: () {
                                            if (item.quantity > 1) {
                                              cartP.updateQuantity(
                                                item.cartId,
                                                item.quantity - 1,
                                                userId,
                                              );
                                            }
                                          },
                                          child: const Padding(
                                            padding: EdgeInsets.all(6.0),
                                            child: Icon(Icons.remove,
                                                size: 16),
                                          ),
                                        ),

                                        const SizedBox(width: 12),

                                        // QUANTITY TEXT
                                        Text(
                                          "${item.quantity}",
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight:
                                              FontWeight.bold),
                                        ),

                                        const SizedBox(width: 12),

                                        // PLUS BUTTON
                                        InkWell(
                                          borderRadius:
                                          BorderRadius.circular(20),
                                          onTap: () {
                                            cartP.updateQuantity(
                                              item.cartId,
                                              item.quantity + 1,
                                              userId,
                                            );
                                          },
                                          child: const Padding(
                                            padding: EdgeInsets.all(6.0),
                                            child: Icon(Icons.add,
                                                size: 16),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  const Spacer(),

                                  // DELETE BUTTON
                                  IconButton(
                                    onPressed: () {
                                      cartP.removeItem(
                                          item.cartId, userId);
                                    },
                                    icon: const Icon(
                                      Icons.delete_outline,
                                      color: Colors.red,
                                      size: 26,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // TOTAL PRICE BOX
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 18, vertical: 16),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, -2))
                ],
              ),
              child: Row(
                children: [
                  // TOTAL
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Total Amount",
                            style: TextStyle(
                                fontSize: 13, color: Colors.grey)),
                        const SizedBox(height: 4),
                        Text(
                          "₹${totalPrice.toStringAsFixed(2)}",
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),

                  // CHECKOUT BUTTON
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => OrderReviewSecondScreen(),));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding:
                        const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      child: const Text(
                        "Checkout",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
