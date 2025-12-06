import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(home: ReturnsRefundsScreen(),debugShowCheckedModeBanner: false,));
}
class ReturnsRefundsScreen extends StatelessWidget {
  const ReturnsRefundsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff3f4f7),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Returns & Refunds",
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
          premiumInfoCard(),
          const SizedBox(height: 25),

          const Text(
            "Your Recent Claims",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),

          returnProductCard(
            title: "Wireless Bluetooth Headphones",
            date: "12 Feb, 2025",
            price: "₹1,499",
            image: "assets/image/first_image.jpeg",
            status: "Refund Completed",
            statusColor: Colors.green,
          ),

          returnProductCard(
            title: "Smart Fitness Band",
            date: "10 Feb, 2025",
            price: "₹999",
            image: "assets/image/first_image.jpeg",
            status: "Return Approved",
            statusColor: Colors.blueAccent,
          ),

          returnProductCard(
            title: "Laptop Stand",
            date: "05 Feb, 2025",
            price: "₹799",
            image: "assets/image/first_image.jpeg",
            status: "Rejected",
            statusColor: Colors.redAccent,
          ),

          const SizedBox(height: 25),

          const Text(
            "Need Help?",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),

          helpTile(
            icon: Icons.support_agent,
            title: "Chat with Support",
            color: Colors.deepPurple,
          ),
          helpTile(
            icon: Icons.policy_outlined,
            title: "View Return Policy",
            color: Colors.orangeAccent,
          ),
        ],
      ),
    );
  }

  // ****************************
  //    BEAUTIFUL INFO BANNER
  // ****************************
  Widget premiumInfoCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.deepPurple.shade400,
            Colors.deepPurple.shade700,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.deepPurple.withOpacity(0.25),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          const Icon(Icons.autorenew, size: 48, color: Colors.white),
          const SizedBox(height: 12),
          const Text(
            "Hassle-free Returns & Quick Refunds!",
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          const Text(
            "You can request a return within 7 days. Refund gets credited within 2-5 business days.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  // ****************************
  //    RETURN ITEM CARD
  // ****************************
  Widget returnProductCard({
    required String title,
    required String date,
    required String price,
    required String image,
    required String status,
    required Color statusColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.asset(
              image,
              width: 75,
              height: 75,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 15)),

                const SizedBox(height: 6),

                Text(price,
                    style: TextStyle(
                        color: Colors.green.shade700,
                        fontWeight: FontWeight.bold,
                        fontSize: 14)),

                const SizedBox(height: 10),

                Row(
                  children: [
                    // Gradient Status Chip
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            statusColor.withOpacity(0.8),
                            statusColor,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Text(
                        status,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      date,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  // ****************************
  //    SUPPORT TILE
  // ****************************
  Widget helpTile({
    required IconData icon,
    required String title,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Row(
        children: [
          Icon(icon, size: 26, color: color),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                  fontSize: 15, fontWeight: FontWeight.w600),
            ),
          ),
          Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey.shade500),
        ],
      ),
    );
  }
}
