import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_sathi_app/screen/profile_screen/customer_support_screen.dart';
import 'package:shop_sathi_app/screen/profile_screen/edit_profile_screen.dart';
import 'package:shop_sathi_app/screen/profile_screen/faqs_screen.dart';
import 'package:shop_sathi_app/screen/profile_screen/my_order_screen.dart';
import 'package:shop_sathi_app/screen/profile_screen/payments_wallet_screen.dart';
import 'package:shop_sathi_app/screen/profile_screen/privacy_policy_screen.dart';
import 'package:shop_sathi_app/screen/product_wishlist.dart';
import 'package:shop_sathi_app/screen/profile_screen/returns_refunds_screen.dart';
import 'package:shop_sathi_app/screen/profile_screen/saved_addresses_screen.dart';
import 'package:shop_sathi_app/screen/profile_screen/track_order_screen.dart';
import '../../providers/auth_provider.dart';
import '../../providers/profile_provider/profile_provider.dart';
import 'coupons_offer_screen.dart';
import '../auth_screen/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => Provider.of<ProfileProvider>(context,listen: false).fetchProfile());
  }

  void logoutNow() async {
    bool? confirm = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Row(
          children: const [
            Icon(Icons.logout, color: Colors.red),
            SizedBox(width: 8),
            Text("Logout", style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        content: const Text("Are you sure you want to logout?"),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.grey,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            onPressed: () => Navigator.pop(context, false),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            onPressed: () => Navigator.pop(context, true),
            child: const Text("Logout", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );

    if (confirm != null && confirm) {
      var prefs = await SharedPreferences.getInstance();
      String? refreshToken = prefs.getString("refreshToken");
      if (refreshToken != null) {
        final auth = Provider.of<AuthProvider>(context, listen: false);
        auth.logout(refreshToken).then((_) {
          prefs.clear();
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const LoginScreen()),
                (route) => false,
          );
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(context);
    final user = profileProvider.user;
    return Scaffold(
      backgroundColor: const Color(0xfff2f2f7),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text("My Profile",  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        automaticallyImplyLeading: false,
      ),

      body: profileProvider.user==null?
      const Center(child: CircularProgressIndicator())
      : ListView(
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
                  child: Image.network(
                    "http://10.170.190.64:3000/uploads/${user?.profileImage}",
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        "assets/image/first_image.jpeg",
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(user?.name??"",style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(user?.email??"",style: const TextStyle(color: Colors.black54),),
                    ],
                  ),
                ),
                // Icon(Icons.edit, color: Colors.deepPurple),
                IconButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfileScreens(),));
                }, icon: Icon(Icons.edit,color: Colors.green,))
              ],
            ),
          ),

          const SizedBox(height: 20),

          sectionTitle("My Orders"),
          sectionCard([
            profileTile(Icons.shopping_bag_outlined, "My Orders", Colors.blueAccent,onTab: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const MyOrdersScreen()));
            },),
            profileTile(Icons.local_shipping_outlined, "Track Orders", Colors.green,onTab: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const TrackOrderScreen()));
            },),
            profileTile(Icons.autorenew_outlined, "Returns & Refunds", Colors.orangeAccent,onTab: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const ReturnsRefundsScreen()));
            },),
          ]),

          const SizedBox(height: 20),
          sectionTitle("Account Settings"),
          sectionCard([
            profileTile(Icons.favorite_border, "Wishlist", Colors.pinkAccent,onTab: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const ProductWishlist()));
            },),
            profileTile(Icons.location_on_outlined, "Saved Addresses", Colors.teal,onTab: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const SavedAddressesScreen()));
            },),
            profileTile(Icons.payment_outlined, "Payments & Wallet", Colors.indigo,onTab: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const PaymentsWalletScreen()));
            },),
            profileTile(Icons.card_giftcard, "Coupons & Offers", Colors.deepOrange,onTab: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const CouponsOffersScreen()));
            },),
          ]),

          const SizedBox(height: 20),
          sectionTitle("Help & Support"),
          sectionCard([
            profileTile(Icons.info_outline, "FAQs", Colors.blueAccent,onTab: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const FAQsScreen()));
            },),
            profileTile(Icons.support_agent, "Customer Support", Colors.deepPurple,onTab: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const CustomerSupportScreen()));
            },),
            profileTile(Icons.lock_outline, "Privacy Policy", Colors.brown,onTab: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const PrivacyPolicyScreen()));
            },),
          ]),
          const SizedBox(height: 20),

          sectionCard([
            profileTile(
              Icons.logout,
              "Logout",
              Colors.red,
              onTab: logoutNow
            ),
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

  Widget profileTile(IconData icon, String title,Color color,{VoidCallback? onTab}) {
    return ListTile(
      leading: Icon(icon, color: color, size: 24),
      title: Text(title,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w500, color: color)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: onTab,
    );
  }
}
