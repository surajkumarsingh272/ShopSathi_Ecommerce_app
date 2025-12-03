import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Map<String, dynamic>> cartItems = [
    {
      "name": "Premium 6-Layer Rack",
      "price": 1400,
      "oldPrice": 2000,
      "discount": 30,
      "image": "assets/image/first_image.jpeg",
      "quantity": 1,
      "color": "Red",
    },
    {
      "name": "Wooden Chair",
      "price": 900,
      "oldPrice": 1200,
      "discount": 25,
      "image": "assets/image/first_image.jpeg",
      "quantity": 2,
      "color": "Blue",
    },
  ];

  double totalPrice = 0;
  void calculateTotal() {
    double total = 0;
    for (var item in cartItems) {
      total += item["price"] * item["quantity"];
    }
    setState(() {
      totalPrice = total;
    });
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
                  children:  [
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
            SizedBox(width: 8),
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

      body: cartItems.isEmpty
          ? const Center(
        child: Text("Your cart is empty", style: TextStyle(fontSize: 18, color: Colors.grey)),
      )
          : Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
                    children: [
             Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 8),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
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
                          child: Image.asset( item["image"], width: 110,   height: 110,  fit: BoxFit.cover,),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item["name"],maxLines: 2, style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 15)),
                               SizedBox(height: 6),
                              Row(
                                children: [
                                  Text("₹${item["price"]}", style: const TextStyle( fontSize: 16, fontWeight: FontWeight.bold)),
                                  const SizedBox(width: 8),
                                  Text("₹${item["oldPrice"]}",  style: const TextStyle(color: Colors.grey,   decoration:          TextDecoration.lineThrough)),
                                  const SizedBox(width: 8),
                                  Text("${item["discount"]}% OFF",  style: const TextStyle( color: Colors.green,  fontWeight: FontWeight.bold)),
                                ],
                              ),
                              const SizedBox(height: 6),
                              Text("Color: ${item["color"]}",style: const TextStyle(color: Colors.black54)),
                              Row(
                                children: [
                                  Icon(Icons.star, color: Colors.green, size: 18),
                                  Icon(Icons.star, color: Colors.green, size: 18),
                                  Icon(Icons.star, color: Colors.green, size: 18),
                                  Icon(Icons.star, color: Colors.green, size: 18),
                                  Icon(Icons.star_half, color: Colors.green, size: 18),
                                  SizedBox(width: 6),
                                  Text("4.5"),
                                ],
                              ),
                               SizedBox(height: 10),
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade100,
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(color: Colors.grey.shade300),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade300,
                                            shape: BoxShape.circle,
                                          ),
                                          child: InkWell(
                                            borderRadius: BorderRadius.circular(20),
                                            onTap: () {
                                              setState(() {
                                                if (item["quantity"] > 1) item["quantity"]--;
                                              });
                                            },
                                            child: const Padding(
                                              padding: EdgeInsets.all(6.0),
                                              child: Icon(Icons.remove, size: 16),
                                            ),
                                          ),
                                        ),

                                        const SizedBox(width: 12),
                                        Text("${item["quantity"]}", style:  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                        const SizedBox(width: 12),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                          ),
                                          child: InkWell(
                                            borderRadius: BorderRadius.circular(20),
                                            onTap: () {
                                              setState(() {
                                                item["quantity"]++;
                                              });
                                              calculateTotal();
                                            },
                                            child: const Padding(
                                              padding: EdgeInsets.all(6.0),
                                              child: Icon(Icons.add, size: 16),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  const Spacer(),

                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        cartItems.removeAt(index);
                                      });
                                      calculateTotal();
                                    },
                                    icon: const Icon(Icons.delete_outline,
                                        color: Colors.red, size: 26),
                                  )
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
            Container(
              padding:
              const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
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
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Total Amount", style: TextStyle(fontSize: 13, color: Colors.grey)),
                        const SizedBox(height: 4),
                        Text("₹${totalPrice.toStringAsFixed(2)}", style: const TextStyle( fontSize: 20, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),

                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      child: const Text("Checkout",style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold,color: Colors.white)),
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
