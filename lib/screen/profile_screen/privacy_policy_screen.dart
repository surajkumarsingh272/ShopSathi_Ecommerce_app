import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  final List<Map<String, String>> privacySections = const [
    {
      "title": "Information Collection",
      "content":
      "We collect information you provide directly, such as name, email, and payment details, as well as data automatically collected via your use of the app."
    },
    {
      "title": "Use of Information",
      "content":
      "Your data is used to provide, improve, and personalize our services. We may also send important updates and promotional messages (you can opt out)."
    },
    {
      "title": "Data Sharing",
      "content":
      "We do not sell your personal information. We may share data with trusted partners for order fulfillment and payment processing."
    },
    {
      "title": "Security",
      "content":
      "We implement industry-standard measures to protect your information. However, no method of transmission over the Internet is 100% secure."
    },
    {
      "title": "User Rights",
      "content":
      "You can request access to, correction of, or deletion of your personal information by contacting our support team."
    },
    {
      "title": "Changes to Privacy Policy",
      "content":
      "We may update this policy from time to time. Updates will be posted in the app and take effect immediately."
    },
  ];

  final String supportEmail = "support@shopsathi.com";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2f2f7),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Privacy Policy",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(height: 8),
          const Text(
            "Your privacy is important to us. Read our policy below:",
            style: TextStyle(fontSize: 15, color: Colors.black54),
          ),
          const SizedBox(height: 16),
          ...privacySections.map((section) => _sectionCard(section)),
          const SizedBox(height: 20),
          _contactCard(context),
        ],
      ),
    );
  }

  Widget _sectionCard(Map<String, String> section) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xffffffff),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            section["title"] ?? "",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            section["content"] ?? "",
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _contactCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xffffffff),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Contact Support:",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          ElevatedButton.icon(
            onPressed: () {
              Clipboard.setData(const ClipboardData(text: "support@shopsathi.com"));
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Email copied to clipboard")),
              );
            },
            icon: const Icon(Icons.copy),
            label: const Text("Copy Email"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
            ),
          )
        ],
      ),
    );
  }
}
