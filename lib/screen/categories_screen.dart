import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  int activeIndex = 0;

  final List<String> sliderImages = [
    "images/mehdi.webp",
    "images/show.webp",
    "images/perfume.jpg",
    "images/water.jpg",
    "images/woman-7851024_1280.jpg",
  ];

  final List<String> categoryImages = [
    "images/pecans-1214703_1280.jpg",
    "images/lipstick-8587707_1280.jpg",
    "images/woman-7851024_1280.jpg",
    "images/show.webp",
    "images/lipstick-8587707_1280.jpg",
    "images/mehdi.webp",
    "images/istockphoto.jpg",
    "images/leptop.jpg",
    "images/book.jpg",
    "images/perfume.jpg",
    "images/water.jpg",
    "images/toy.jpg",
  ];

  final List<String> categoryNames = [ "Cloth", "Bag","Shoes", "Watch", "Hat",  "Sunglasses","Phone", "Laptop", "Book", "Perfume", "Bottle","Toy",  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        title: Row(
          children: [
            Expanded(
              child: Container(
                height: 42,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12, blurRadius: 5, offset: Offset(0, 2))
                  ],
                ),
                child: Row(
                  children: const [
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
            const SizedBox(width: 10),
            CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.mic, color: Colors.blue),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: CarouselSlider.builder(
                itemCount: sliderImages.length,
                itemBuilder: (context, index, realIndex) {
                  final image = sliderImages[index];
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(image, width: double.infinity, fit: BoxFit.cover),
                  );
                },
                options: CarouselOptions(
                  height: 170,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 4),
                  viewportFraction: 1,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      activeIndex = index;
                    });
                  },
                ),
              ),
            ),

            const SizedBox(height: 8),

            Center(
              child: AnimatedSmoothIndicator(
                activeIndex: activeIndex,
                count: sliderImages.length,
                effect: ExpandingDotsEffect(
                    dotHeight: 8,
                    dotWidth: 8,
                    activeDotColor: Colors.blue,
                    dotColor: Colors.grey.shade400),
              ),
            ),

            const SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Categories", style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold)),
                Text("See All",style: TextStyle(fontSize: 16, color: Colors.blue)),
              ],
            ),

            const SizedBox(height: 12),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: categoryImages.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 5,
                childAspectRatio: 0.92,
              ),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      height: 90,
                      width: 106,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(categoryImages[index], fit: BoxFit.cover),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(categoryNames[index], style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500))
                  ],
                );
              },
            ),

            const SizedBox(height: 20),

            const Text("Top Products", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  circle("images/pecans-1214703_1280.jpg",),
                  circle("images/lipstick-8587707_1280.jpg",),
                  circle("images/woman-7851024_1280.jpg",),
                  circle("images/show.webp",),
                  circle("images/mehdi.webp",),
                ],
              ),
            ),

            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [Text("New Items", style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold)),
                Text("See All",style: TextStyle(fontSize: 16, color: Colors.blue)),
              ],
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(  5,    (index) => Padding(
                    padding: const EdgeInsets.only(right: 2),
                    child: productCard("images/show.webp",
                        "Lorem ipsum dolor sit amet", "₹3000"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget circle(String path) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]),
      child: CircleAvatar(
        radius: 40,
        backgroundColor: Colors.white,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(70),
          child: Image.asset(path, fit: BoxFit.cover,width: 70,height: 70,),
        ),
      ),
    );
  }

  Widget productCard(String image, String title, String price) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          elevation: 3,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(image, height: 130, width: 130, fit: BoxFit.cover,)
            ),
          ),
        ),
        const SizedBox(height: 5),
        SizedBox(
          width: 150,
          child: Text(title,  maxLines: 2,overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          ),
        ),
        const SizedBox(height: 2),
        Text( price, style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

}
