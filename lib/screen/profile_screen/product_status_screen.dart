import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/order_model.dart';
import '../../models/product_status_model.dart';
import '../../providers/product_provider.dart';
import '../../providers/order_provider.dart';

class ProductStatusScreen extends StatefulWidget {
  const ProductStatusScreen({super.key});

  @override
  State<ProductStatusScreen> createState() => _ProductStatusScreenState();
}

class _ProductStatusScreenState extends State<ProductStatusScreen> {
  @override
  void initState() {
    super.initState();
    final productProvider =
    Provider.of<ProductProvider>(context, listen: false);
    final orderProvider = Provider.of<OrderProvider>(context, listen: false);

    productProvider.loadProductStatus();
    orderProvider.loadOrders();
  }

  Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case "success":
      case "delivered":
        return Colors.green;
      case "pending":
      case "processing":
        return Colors.orange;
      case "cancelled":
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  String getOrderStatusForProduct(ProductStatusModel product, List<OrderModel> orders) {
    final order = orders.firstWhere(
          (o) => o.id == product.id,
      orElse: () => OrderModel(
        id: 0,
        totalAmount: 0,
        orderStatus: "success",
        paymentStatus: "",
        paymentMethod: "",
        orderDate: "",
      ),
    );
    return order.orderStatus;
  }



  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final orderProvider = Provider.of<OrderProvider>(context);

    if (productProvider.productStatus.isEmpty || orderProvider.isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF3F5F7),
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: _buildSearchBar(),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: productProvider.productStatus.length,
        itemBuilder: (context, index) {
          var p = productProvider.productStatus[index];
          var orderStatus =
          getOrderStatusForProduct(p, orderProvider.orders);

          return _productTile(
            p.name,
            "http://10.175.170.64:3000/uploads/${p.imageUrl}",
            p.discountPercent,
            p.price,
            p.salePrice,
            p.rating,
            orderStatus,
          );
        },
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 42,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search, size: 18),
          hintText: "Search product...",
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _productTile(String name, String img, int discount, double oldPrice,
      double newPrice, double rating, String orderStatus) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.network(
              img,
              height: 90,
              width: 90,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey.shade200,
                  height: 90,
                  width: 90,
                  child: const Icon(Icons.image, color: Colors.grey),
                );
              },
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 15.5,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 6),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Discount line
                    Row(
                      children: [
                        const Icon(Icons.discount, color: Colors.green, size: 16),
                        const SizedBox(width: 4),
                        Flexible(
                          child: Text(
                            "$discount% OFF",
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            "₹$oldPrice",
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Flexible(
                          child: Text(
                            "₹$newPrice",
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: List.generate(5, (index) {
                        if (rating >= index + 1) {
                          return const Icon(Icons.star, color: Colors.amber, size: 17);
                        } else if (rating > index && rating < index + 1) {
                          return const Icon(Icons.star_half, color: Colors.amber, size: 17);
                        } else {
                          return const Icon(Icons.star_border, color: Colors.amber, size: 17);
                        }
                      }),
                    ),

                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: getStatusColor(orderStatus).withOpacity(0.15),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        orderStatus,
                        style: TextStyle(
                          color: getStatusColor(orderStatus),
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
