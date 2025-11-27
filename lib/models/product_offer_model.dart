class ProductOfferModel {
  final int id;
  final int productId;
  final String offerText;

  ProductOfferModel({
    required this.id,
    required this.productId,
    required this.offerText,
  });

  factory ProductOfferModel.fromJson(Map<String, dynamic> json) {
    return ProductOfferModel(
      id: json['id'],
      productId: json['product_id'],
      offerText: json['offer_text'],
    );
  }
}
