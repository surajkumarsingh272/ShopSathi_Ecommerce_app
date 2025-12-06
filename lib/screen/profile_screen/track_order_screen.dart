import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(home: TrackOrderScreen(),debugShowCheckedModeBanner: false,));
}
class TrackOrderScreen extends StatelessWidget {
  const TrackOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f6fa),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Track Order",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),

      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          buildOrderSummary(),

          const SizedBox(height: 25),

          const Text(
            "Order Status",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 20),

          // TIMELINE
          buildTrackStep(
            isCompleted: true,
            title: "Order Placed",
            description: "Your order has been placed successfully",
            date: "12 Feb, 11:35 AM",
          ),

          buildDivider(),

          buildTrackStep(
            isCompleted: true,
            title: "Order Confirmed",
            description: "Seller has confirmed your order",
            date: "12 Feb, 12:10 PM",
          ),

          buildDivider(),

          buildTrackStep(
            isCompleted: true,
            title: "Shipped",
            description: "Your order is on the way",
            date: "13 Feb, 02:45 PM",
          ),

          buildDivider(),

          buildTrackStep(
            isCompleted: false,
            title: "Out for Delivery",
            description: "Arriving today!",
            date: "Expected Today",
          ),

          buildDivider(),

          buildTrackStep(
            isCompleted: false,
            title: "Delivered",
            description: "Handed over to you",
            date: "",
          ),
        ],
      ),
    );
  }

  // ********************** ORDER SUMMARY CARD **********************
  Widget buildOrderSummary() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.07),
            blurRadius: 12,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              "assets/image/first_image.jpeg",
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Wireless Bluetooth Headphones",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 6),
                Text(
                  "₹1,499",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.green,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  // ********************** TIMELINE STEP UI **********************
  Widget buildTrackStep({
    required bool isCompleted,
    required String title,
    required String description,
    required String date,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Icon circle
        Column(
          children: [
            Container(
              width: 26,
              height: 26,
              decoration: BoxDecoration(
                color: isCompleted ? Colors.green : Colors.grey.shade300,
                shape: BoxShape.circle,
              ),
              child: Icon(
                isCompleted ? Icons.check : Icons.circle,
                size: 14,
                color: isCompleted ? Colors.white : Colors.grey,
              ),
            ),
          ],
        ),

        const SizedBox(width: 18),

        // Text Section
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isCompleted ? Colors.black : Colors.black54,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                description,
                style: const TextStyle(fontSize: 14, color: Colors.black54),
              ),
              if (date.isNotEmpty) ...[
                const SizedBox(height: 5),
                Text(
                  date,
                  style: const TextStyle(
                      fontSize: 13, color: Colors.black38),
                ),
              ]
            ],
          ),
        ),
      ],
    );
  }

  // *************** VERTICAL LINE BETWEEN STEPS ***************
  Widget buildDivider() {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: SizedBox(
        height: 35,
        child: VerticalDivider(
          thickness: 2,
          width: 20,
          color: Colors.grey.shade300,
        ),
      ),
    );
  }
}
