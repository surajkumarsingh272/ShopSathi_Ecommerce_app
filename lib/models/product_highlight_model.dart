class ProductHighlightModel {
  final int id;
  final int productId;
  final String highlightText;

  ProductHighlightModel({
    required this.id,
    required this.productId,
    required this.highlightText,
  });

  factory ProductHighlightModel.fromJson(Map<String, dynamic> json) {
    return ProductHighlightModel(
      id: json['id'],
      productId: json['product_id'],
      highlightText: json['highlight_text'],
    );
  }
}
