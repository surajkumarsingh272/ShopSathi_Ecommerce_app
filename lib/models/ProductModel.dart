
class ProductModel {
  final String id;
  final String title;
  final String price;
  final String discountPrice;
  final String image;
  final String productType;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.discountPrice,
    required this.image,
    required this.productType,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"].toString(),
      title: json["title"],
      price: json["price"] ,
      discountPrice: json["discount_price"] ,
      image: json["image"],
      productType: json["product_type"],
    );
  }
}
