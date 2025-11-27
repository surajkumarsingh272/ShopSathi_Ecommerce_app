
class ProductColorModel {
  final int id;
  final int productId;
  final String colorName;
  final String colorCode;

  ProductColorModel({
    required this.id,
    required this.productId,
    required this.colorName,
    required this.colorCode,
  });

  factory ProductColorModel.fromJson(Map<String, dynamic> json) {
    return ProductColorModel(
      id: json['id'],
      productId: json['product_id'],
      colorName: json['color_name'],
      colorCode: json['color_code'],
    );
  }
}
