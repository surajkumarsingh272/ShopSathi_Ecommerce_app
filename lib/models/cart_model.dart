class CartItem {
  final int cartId;
  final int productId;
  final String name;
  final String image;
  final double newPrice;
  final double oldPrice;
  final double rating;
  final int quantity;
  final int? colorId;
  final String? colorName;
  final double price;
  final double totalPrice;
  final int reviewsCount;

  CartItem({
    required this.cartId,
    required this.productId,
    required this.name,
    required this.image,
    required this.newPrice,
    required this.oldPrice,
    required this.rating,
    required this.quantity,
    this.colorId,
    this.colorName,
    required this.price,
    required this.totalPrice,
    required this.reviewsCount,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      cartId: json['cart_id'],
      productId: json['product_id'],
      name: json['name'],
      image: json['image'],
      newPrice: double.parse(json['new_price'].toString()),
      oldPrice: double.parse(json['old_price'].toString()),
      rating: double.parse(json['rating'].toString()),
      quantity: json['quantity'],
      colorId: json['color_id'],
      colorName: json['color_name'],
      price: double.parse(json['price'].toString()),
      totalPrice: double.parse(json['total_price'].toString()),
      reviewsCount: json['reviews_count'],
    );
  }
}
