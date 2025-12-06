import 'package:flutter/material.dart';

class ViewOrderDetailsScreen extends StatelessWidget {
  final String image;
  final String title;
  final String orderId;
  final String status;
  final Color statusColor;
  final String date;

  const ViewOrderDetailsScreen({
    super.key,
    required this.image,
    required this.title,
    required this.orderId,
    required this.status,
    required this.statusColor,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2f2f7),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Order Details",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          // ---- Product Card ----
          Container(
            padding: const EdgeInsets.all(16),
            decoration: boxStyle(),
            child: Row(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(image, width: 80, height: 80, fit: BoxFit.cover)),

                const SizedBox(width: 14),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 5),
                      Text("Order ID: $orderId",
                          style: const TextStyle(fontSize: 13, color: Colors.black54)),
                      const SizedBox(height: 5),
                      Text(
                        status,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: statusColor),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),

          const SizedBox(height: 20),

          // ---- Order Information ----
          sectionTitle("Order Information"),
          infoCard([
            rowItem("Order Date", date),
            rowItem("Payment", "Online Payment"),
            rowItem("Total Amount", "₹ 3,499"),
            rowItem("Quantity", "1"),
          ]),

          const SizedBox(height: 20),

          // ---- Delivery Info ----
          sectionTitle("Delivery Address"),
          infoCard([
            const Padding(
              padding: EdgeInsets.only(bottom: 6),
              child: Text(
                "Ravi Sharma\nSector 22, Noida\nUttar Pradesh - 201301\nPhone: 9876543210",
                style: TextStyle(fontSize: 14, color: Colors.black87, height: 1.4),
              ),
            ),
          ]),

          const SizedBox(height: 20),

          // ---- Tracking Timeline ----
          sectionTitle("Tracking Status"),
          trackingCard(),
        ],
      ),
    );
  }

  // =======================================================================
  // WIDGETS
  // =======================================================================

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(title,
          style: const TextStyle(
              fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black87)),
    );
  }

  Widget infoCard(List<Widget> children) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: boxStyle(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }

  Widget rowItem(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: const TextStyle(
                  fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black54)),
          Text(value,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  BoxDecoration boxStyle() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      boxShadow: [
        BoxShadow(
          color: Colors.black12.withOpacity(0.05),
          blurRadius: 8,
          offset: const Offset(0, 2),
        )
      ],
    );
  }

  Widget trackingCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: boxStyle(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          trackingTile("Order Placed", true),
          Divider(),
          trackingTile("Packed", true),
          Divider(),
          trackingTile("Shipped", true),
          Divider(),
          trackingTile("Out for Delivery", false),
          Divider(),
          trackingTile("Delivered", false),
        ],
      ),
    );
  }
}

class trackingTile extends StatelessWidget {
  final String title;
  final bool completed;

  const trackingTile(this.title, this.completed, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          completed ? Icons.check_circle : Icons.radio_button_unchecked,
          color: completed ? Colors.green : Colors.grey,
          size: 22,
        ),
        const SizedBox(width: 12),
        Text(
          title,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
