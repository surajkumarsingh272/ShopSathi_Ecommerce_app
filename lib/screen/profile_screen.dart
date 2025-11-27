import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2f2f7),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text("My Profile",  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        automaticallyImplyLeading: false,
      ),

      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12.withOpacity(0.06),
                  blurRadius: 12,
                  offset: const Offset(0, 3),
                )
              ],
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset("images/first_image.jpeg", width: 70,  height: 70,  fit: BoxFit.cover,),
                ),
                 SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text( "Nagma",style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Text("nagma9264@gmail.com",style: TextStyle(color: Colors.black54),),
                    ],
                  ),
                ),
                Icon(Icons.edit, color: Colors.deepPurple),
              ],
            ),
          ),

          const SizedBox(height: 20),

          sectionTitle("My Orders"),
          sectionCard([
            profileTile(Icons.shopping_bag_outlined, "My Orders", Colors.blueAccent),
            profileTile(Icons.local_shipping_outlined, "Track Orders", Colors.green),
            profileTile(Icons.autorenew_outlined, "Returns & Refunds", Colors.orangeAccent),
          ]),

          const SizedBox(height: 20),
          sectionTitle("Account Settings"),
          sectionCard([
            profileTile(Icons.favorite_border, "Wishlist", Colors.pinkAccent),
            profileTile(Icons.location_on_outlined, "Saved Addresses", Colors.teal),
            profileTile(Icons.payment_outlined, "Payments & Wallet", Colors.indigo),
            profileTile(Icons.card_giftcard, "Coupons & Offers", Colors.deepOrange),
          ]),

          const SizedBox(height: 20),
          sectionTitle("Help & Support"),
          sectionCard([
            profileTile(Icons.info_outline, "FAQs", Colors.blueAccent),
            profileTile(Icons.support_agent, "Customer Support", Colors.deepPurple),
            profileTile(Icons.lock_outline, "Privacy Policy", Colors.brown),
          ]),
          const SizedBox(height: 20),
          sectionCard([
            profileTile(Icons.logout, "Logout", Colors.red),
          ]),
        ],
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(title,style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black87),),
    );
  }
  Widget sectionCard(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
              color: Colors.black12.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2))
        ],
      ),
      child: Column(
        children: children,
      ),
    );
  }

  Widget profileTile(IconData icon, String title,Color color) {
    return ListTile(
      leading: Icon(icon, color: color, size: 24),
      title: Text(title,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w500, color: color)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: () {},
    );
  }
}
