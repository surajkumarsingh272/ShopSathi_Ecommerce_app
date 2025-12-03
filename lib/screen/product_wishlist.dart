import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductWishlist extends StatefulWidget {
  const ProductWishlist({super.key});

  @override
  State<ProductWishlist> createState() => _ProductWishlistState();
}

class _ProductWishlistState extends State<ProductWishlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        toolbarHeight: 65,
        titleSpacing: 16,
        title: Row(
          children: [
            Expanded(
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey.shade700),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search in wishlist",
                          hintStyle:
                          TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10),
            CircleAvatar(
              backgroundColor: Colors.blue,
              child: const Icon(Icons.filter_list, color: Colors.white),
            ),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Your Wishlist",style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),),
                  Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: const [
                        Icon(CupertinoIcons.heart_fill,color: Colors.red, size: 18),
                        SizedBox(width: 6),
                        Text("8 Items", style: TextStyle(color: Colors.red, fontSize: 14)),
                      ],
                    ),
                  )
                ],
              ),

              const SizedBox(height: 15),

              GridView.builder(
                itemCount: 8,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 290,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),

                itemBuilder: (_, index) {
                  bool isWishlisted = true;
                  return StatefulBuilder(
                    builder: (context, setLocalState) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 6,
                                offset: Offset(0, 4))
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(14)),
                                  child: Image.asset("assets/image/first_image.jpeg", height: 165, width: double.infinity,  fit: BoxFit.cover,),
                                ),
                                Positioned(
                                  left: 10,
                                  top: 10,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: Colors.red.shade600,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: const Text("20% OFF", style: TextStyle( color: Colors.white,fontSize: 11,fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),

                                Positioned(
                                  right: 10,
                                  top: 10,
                                  child: GestureDetector(
                                    onTap: () {
                                      setLocalState(() {
                                        isWishlisted = !isWishlisted;
                                      });
                                    },
                                    child: CircleAvatar(
                                      radius: 18,
                                      backgroundColor: Colors.white,
                                      child: Icon(
                                        isWishlisted? CupertinoIcons.heart_fill: CupertinoIcons.heart, color: isWishlisted ? Colors.red : Colors.black,    size: 20,),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 5),

                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Text("Premium 6-Layer Rack", maxLines: 2,overflow: TextOverflow.ellipsis,
                                style: TextStyle( fontWeight: FontWeight.w600, fontSize: 14),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              child: Row(
                                children: const [
                                  Text( "₹1400", style: TextStyle( color: Colors.blue,  fontWeight: FontWeight.bold, fontSize: 15),
                                  ),
                                  SizedBox(width: 6),
                                  Text( "₹2000", style: TextStyle(decoration:TextDecoration.lineThrough,color: Colors.grey, fontSize: 12),
                                  ),
                                ],
                              ),
                            ),

                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Text("Free Delivery", style: TextStyle( color: Colors.grey, fontSize: 12),
                              ),
                            ),
                             SizedBox(height: 4),
                            Padding(
                              padding: const EdgeInsets.symmetric( horizontal: 8),
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric( horizontal: 6, vertical: 3),
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius:
                                        BorderRadius.circular(6)),
                                    child: Row(
                                      children: const [
                                        Icon(Icons.star,size: 13, color: Colors.white),
                                        SizedBox(width: 2),
                                        Text( "4.5",  style: TextStyle( color: Colors.white, fontSize: 12),),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  const Text( "(523 reviews)", style: TextStyle( color: Colors.grey, fontSize: 11),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
