import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: FAQsScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class FAQsScreen extends StatefulWidget {
  const FAQsScreen({super.key});

  @override
  State<FAQsScreen> createState() => _FAQsScreenState();
}

class _FAQsScreenState extends State<FAQsScreen> {
  final List<Map<String, String>> faqs = [
    {
      "question": "How do I place an order?",
      "answer": "You can place an order by browsing products, adding them to your cart, and completing the checkout process."
    },
    {
      "question": "What payment methods are accepted?",
      "answer": "We accept credit/debit cards, UPI, net banking, and wallet payments."
    },
    {
      "question": "How can I track my order?",
      "answer": "Go to 'Track Orders' in your profile, enter your order ID, and see the live status of your order."
    },
    {
      "question": "How do I return a product?",
      "answer": "You can initiate a return from 'Returns & Refunds' section within 7 days of delivery."
    },
    {
      "question": "How can I apply a coupon?",
      "answer": "Select your products, go to checkout, and enter your coupon code in the 'Apply Coupon' section."
    },
  ];

  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    final filteredFaqs = faqs.where((faq) =>
    faq['question']!.toLowerCase().contains(searchQuery.toLowerCase()) ||
        faq['answer']!.toLowerCase().contains(searchQuery.toLowerCase())).toList();

    return Scaffold(
      backgroundColor: const Color(0xfff2f2f7),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "FAQs",
          style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Search Bar
            TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: "Search FAQs...",
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // FAQ List
            Expanded(
              child: filteredFaqs.isEmpty
                  ? const Center(child: Text("No FAQs found.", style: TextStyle(color: Colors.grey)))
                  : ListView.builder(
                itemCount: filteredFaqs.length,
                itemBuilder: (context, index) {
                  final faq = filteredFaqs[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: FAQCard(
                      question: faq['question']!,
                      answer: faq['answer']!,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class FAQCard extends StatefulWidget {
  final String question;
  final String answer;

  const FAQCard({super.key, required this.question, required this.answer});

  @override
  State<FAQCard> createState() => _FAQCardState();
}

class _FAQCardState extends State<FAQCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          childrenPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          title: Text(
            widget.question,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: _isExpanded ? Colors.deepPurple : Colors.black87,
            ),
          ),
          trailing: Icon(
            _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
            color: Colors.deepPurple,
          ),
          onExpansionChanged: (expanded) {
            setState(() {
              _isExpanded = expanded;
            });
          },
          children: [
            Text(
              widget.answer,
              style: const TextStyle(fontSize: 14, color: Colors.black54, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
