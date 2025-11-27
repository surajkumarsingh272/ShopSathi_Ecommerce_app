class ProductSizeModel {
  final int id;
  final int productId;
  final String size;

  ProductSizeModel({
    required this.id,
    required this.productId,
    required this.size,
  });

  factory ProductSizeModel.fromJson(Map<String, dynamic> json) {
    return ProductSizeModel(
      id: json['id'],
      productId: json['product_id'],
      size: json['size'],
    );
  }
}
