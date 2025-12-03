class ProductModel {
  int?id;
  String? name;
  String? image;
  double? rating;
  double? oldPrice;
  double? newPrice;
  int? discount;
  int?ratingCount;

  ProductModel({
    this.id,
    required this.name,
    required this.image,
    required this.rating,
    required this.oldPrice,
    required this.newPrice,
    required this.discount,
    this.ratingCount,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: int.tryParse(json['id'].toString()),
      name: json['name'],
      image: json['image'],
      rating: double.tryParse(json['rating'].toString()) ?? 0.0,
      oldPrice: double.tryParse(json['old_price'].toString()) ?? 0.0,
      newPrice: double.tryParse(json['new_price'].toString()) ?? 0.0,
      discount: int.tryParse(json['discount'].toString()) ?? 0,
      ratingCount: json["ratings_count"],
    );
  }
}
