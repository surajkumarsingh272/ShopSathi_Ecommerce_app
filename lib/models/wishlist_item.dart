class WishlistItem {
  final int wishlistId;
  final int userId;
  final int productId;
  final String name;
  final String image;
  final String newPrice;
  final String oldPrice;
  final String rating;
  final int reviewsCount;

  WishlistItem({
    required this.wishlistId,
    required this.userId,
    required this.productId,
    required this.name,
    required this.image,
    required this.newPrice,
    required this.oldPrice,
    required this.rating,
    required this.reviewsCount,
  });

  factory WishlistItem.fromJson(Map<String, dynamic> json) {
    return WishlistItem(
      wishlistId: json['wishlist_id'] ?? 0,
      userId: json['user_id'] ?? 0,
      productId: json['product_id'] ?? 0,
      name: json['name'] ?? "",
      image: json['image'] ?? "",
      newPrice: json['new_price'].toString(),
      oldPrice: json['old_price'].toString(),
      rating: json['rating'].toString(),
      reviewsCount: json['reviews_count'] ?? 0,
    );
  }
}
