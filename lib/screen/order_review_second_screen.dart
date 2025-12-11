import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_sathi_app/screen/RazorpayPaymentScreen.dart';
import 'package:shop_sathi_app/screen/payment_status_method.dart';
import '../Change Delivery Address/change_delivery_screen.dart';
import '../models/cart_model.dart';
import '../models/product_model.dart';
import '../providers/address_provider.dart';
import '../providers/cart_provider.dart';

class OrderReviewSecondScreen extends StatefulWidget {
  final ProductModel product;
  const OrderReviewSecondScreen({super.key, required this.product});

  @override
  State<OrderReviewSecondScreen> createState() => _OrderReviewSecondScreenState();
}

class _OrderReviewSecondScreenState extends State<OrderReviewSecondScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<AddressProvider>(context, listen: false) .fetchAddresses(1);
      Provider.of<CartProvider>(context, listen: false).fetchCart(1);
    });
  }

  int currentStep = 2;
  bool isPriceExpanded = false;

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<CartProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: CircleAvatar(
            backgroundColor: Colors.grey.shade200,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black87),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
        title: const Text(
          "Review Your Order",
          style: TextStyle(
              fontWeight: FontWeight.w600, color: Colors.black87, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            orderProgressIndicator(currentStep),
            const SizedBox(height: 15),
            // Consumer<CartProvider>(builder: (context, cart, child) {
            //     return ListView.builder(
            //       shrinkWrap: true,
            //       physics: NeverScrollableScrollPhysics(),
            //       itemCount: cart.items.length,
            //       itemBuilder: (context, index) {
            //         return productCard(cart.items[index],provider,1, );
            //       },
            //     );
            //   },
            // ),
            productCard(),
            const SizedBox(height: 20),
            deliveryCard(),
            const SizedBox(height: 20),
            priceDetailsCard(),
            const SizedBox(height: 100),
          ],
        ),
      ),
      bottomNavigationBar: bottomNavBar(),
    );
  }

  Widget productCard() {
    final item = widget.product;
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.asset(
              "assets/image/first_image.jpeg",
              width: 110,
              height: 140,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name ?? "",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 18,
                    height: 1.3,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                const SizedBox(height: 6),
                Row(
                  children: [
                    Row(
                      children: List.generate(5, (index) {
                        double rating = item.rating ?? 0;
                        return Icon(
                          index < rating
                              ? Icons.star
                              : index + 0.5 <= rating
                              ? Icons.star_half
                              : Icons.star_border,
                          size: 17,
                          color: Colors.amber,
                        );
                      }),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      "(${item.rating?.toStringAsFixed(1) ?? "0.0"})",
                      style: const TextStyle(fontSize: 13, color: Colors.black54),
                    ),
                  ],
                ),

                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "₹${item.newPrice?.toInt() ?? 0}",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Text(
                              "₹${item.oldPrice?.toInt() ?? 0}",
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            const SizedBox(width: 6),
                            if (item.oldPrice != null && item.newPrice != null)
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 6, vertical: 2),
                                decoration: BoxDecoration(
                                  color: Colors.green.shade50,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  "${(((item.oldPrice! - item.newPrice!) / item.oldPrice!) * 100).toInt()}% OFF",
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }




  Widget deliveryCard() {
    return Consumer<AddressProvider>(
      builder: (BuildContext context, value, Widget? child) {
        if (value.addresses.isEmpty) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ChangeDeliveryScreen()),
              );
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.blue.shade100),
              ),
              child: Row(
                children: const [
                  Icon(Icons.add_location_alt, color: Colors.blue),
                  SizedBox(width: 10),
                  Text(
                    "Add Delivery Address",
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        }

        // Default address
        final address =
        value.addresses.firstWhere((e) => e.isDefault == 1);

        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.blue.shade100),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.blue.shade50,
                    child: Icon(Icons.local_shipping_outlined,
                        color: Colors.blue, size: 28),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    "Delivery by ${calculateDeliveryDate()}",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 15),
                  ),

                ],
              ),
              const SizedBox(height: 14),
              Text(
                "${address.name}  ${address.mobile}",
                style: const TextStyle(
                    fontSize: 14, color: Colors.black87),
              ),
              const SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "${address.houseNo}, ${address.roadName}, ${address.city}, ${address.state} - ${address.pincode}",
                      style: const TextStyle(color: Colors.black54),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChangeDeliveryScreen(),
                        ),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.blue),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text("Change",
                        style: TextStyle(color: Colors.blue)),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget priceDetailsCard() {
    return Consumer<CartProvider>(
      builder: (context, cart, child) {
        double subTotal = cart.totalPrice;
        double discount = cart.totalDiscount;
        double deliveryCharge = cart.deliveryCharge;
        double total = cart.grandTotal;

        return Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.blue.shade100),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Price Details",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Row(
                    children: [
                      Text(
                        "₹${total.toInt()}",
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                      const SizedBox(width: 4),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isPriceExpanded = !isPriceExpanded;
                          });
                        },
                        child: Icon(isPriceExpanded
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down),
                      ),
                    ],
                  ),
                ],
              ),

              if (isPriceExpanded)
                Container(
                  margin: const EdgeInsets.only(top: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Subtotal: ₹${subTotal.toInt()}"),
                      Text("Discount: ₹${discount.toInt()}",
                          style: const TextStyle(color: Colors.green)),
                      Text("Delivery Charge: ₹$deliveryCharge"),
                      const Divider(color: Colors.grey),
                      Text("Total: ₹${total.toInt()}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                    ],
                  ),
                )
            ],
          ),
        );
      },
    );
  }


  Widget bottomNavBar() {
    return Consumer<CartProvider>(
      builder: (context, cart, child) {

        double total = cart.grandTotal;
        double discountPercent =(cart.totalDiscount / cart.totalPrice) * 100;

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "₹${total.toInt()}",
                    style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      "${discountPercent.toInt()}% off",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  double price = widget.product.newPrice ?? 0;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentMethodScreens (amount: price.toInt(),),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 35, vertical: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text("Continue",
                    style: TextStyle(fontSize: 16, color: Colors.white)),
              )
            ],
          ),
        );
      },
    );
  }

  Widget orderProgressIndicator(int currentStep) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        children: [
          CircleAvatar(
            radius: 15,
            backgroundColor: currentStep >= 1 ? Colors.blue : Colors.grey.shade300,
            child: currentStep > 1
                ? const Icon(Icons.check, color: Colors.white, size: 18)
                : const Text("1",
                style:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: Container(
              height: 3,
              color: currentStep > 1 ? Colors.blue : Colors.grey.shade300,
            ),
          ),
          CircleAvatar(
            radius: 15,
            backgroundColor: currentStep >= 2 ? Colors.blue : Colors.grey.shade300,
            child: currentStep > 2
                ? const Icon(Icons.check, color: Colors.white, size: 18)
                : const Text("2",
                style:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: Container(
              height: 3,
              color: currentStep > 2 ? Colors.blue : Colors.grey.shade300,
            ),
          ),
          CircleAvatar(
            radius: 15,
            backgroundColor: currentStep >= 3 ? Colors.blue : Colors.grey.shade300,
            child: currentStep > 3
                ? const Icon(Icons.check, color: Colors.white, size: 18)
                : const Text("3",
                style:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
  String calculateDeliveryDate() {
    DateTime now = DateTime.now();
    DateTime delivery = now.add(Duration(days: 3));
    String day = _getWeekDay(delivery.weekday);
    String date = "${delivery.day} ${_getMonth(delivery.month)}";
    return "$day, $date";
  }

  String _getWeekDay(int weekday) {
    const days = ["Monday","Tuesday", "Wednesday","Thursday", "Friday",  "Saturday", "Sunday"];
    return days[weekday - 1];
  }

  String _getMonth(int month) {
    const months = [
      "Jan", "Feb", "Mar", "Apr", "May", "Jun",
      "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
    ];
    return months[month - 1];
  }

}



