import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main(){
  runApp(MaterialApp(home: CustomerSupportScreen(),debugShowCheckedModeBanner: false,));
}
class CustomerSupportScreen extends StatelessWidget {
  const CustomerSupportScreen({super.key});

  // Phone, email, and chat URLs
  final String phoneNumber = "+7970843850";
  final String email = "nagmaTeamt@shopsathi.com";
  final String chatUrl = "https://wa.me/911234567890"; // Example WhatsApp link

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2f2f7),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Customer Support",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(height: 10),
          const Text(
            "How can we help you?",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
          ),
          const SizedBox(height: 8),
          const Text(
            "Choose one of the options below to reach our support team.",
            style: TextStyle(fontSize: 14, color: Colors.black54),
          ),
          const SizedBox(height: 20),

          // Call Support
          supportCard(
            icon: Icons.phone_in_talk,
            title: "Call Us",
            subtitle: phoneNumber,
            color: Colors.green,
            onTap: () => _launchURL("tel:$phoneNumber"),
          ),

          // Email Support
          // Email Support
          supportCard(
            icon: Icons.email_outlined,
            title: "Email Us",
            subtitle: email,
            color: Colors.indigo,
            onTap: () => _launchURL("mailto:$email?subject=Support%20Request"),
          ),

// Live Chat Support
          supportCard(
            icon: Icons.chat_bubble_outline,
            title: "Live Chat",
            subtitle: "Chat with our support agent",
            color: Colors.orange,
            onTap: () => _launchURL(chatUrl),
          ),


          const SizedBox(height: 30),

          // FAQs Button
          ElevatedButton.icon(
            onPressed: () {
              // Navigate to FAQs
            },
            icon: const Icon(Icons.help_outline,color: Colors.white,),
            label: const Text("View FAQs",style: TextStyle(color: Colors.white),),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget supportCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        tileColor: Colors.white,
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.1),
          child: Icon(icon, color: color),
        ),
        title: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(fontSize: 14, color: Colors.black54),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      ),
    );
  }

  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }
}
