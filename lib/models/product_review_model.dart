class ProductReviewModel {
  final int id;
  final int productId;
  final String userName;
  final int rating;
  final String reviewText;
  final String createdAt;

  ProductReviewModel({
    required this.id,
    required this.productId,
    required this.userName,
    required this.rating,
    required this.reviewText,
    required this.createdAt,
  });

  factory ProductReviewModel.fromJson(Map<String, dynamic> json) {
    return ProductReviewModel(
      id: json['id'],
      productId: json['product_id'],
      userName: json['user_name'],
      rating: json['rating'],
      reviewText: json['review_text'],
      createdAt: json['created_at'],
    );
  }
}
