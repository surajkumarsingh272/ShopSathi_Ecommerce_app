class ProductStatusModel {
  final int id;
  final String name;
  final String imageUrl;
  final double price;
  final double salePrice;
  final int discountPercent;
  final double rating;

  ProductStatusModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.salePrice,
    required this.discountPercent,
    required this.rating,
  });

  factory ProductStatusModel.fromJson(Map<String, dynamic> json) {
    return ProductStatusModel(
      id: int.tryParse(json['id'].toString()) ?? 0,
      name: json['name'] ?? "",
      imageUrl: json['image_url'] ?? "",
      price: double.tryParse(json['price'].toString()) ?? 0.0,
      salePrice: double.tryParse(json['sale_price'].toString()) ?? 0.0,
      discountPercent: int.tryParse(json['discount'].toString()) ?? 0,
      rating: double.tryParse(json['rating'].toString()) ?? 0.0,
    );
  }
}
