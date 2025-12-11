class PurchaseHistoryModel {
  final int id;
  final String product;
  final String img;
  final double price;
  final double rating;
  final String date;

  PurchaseHistoryModel({
    required this.id,
    required this.product,
    required this.img,
    required this.price,
    required this.rating,
    required this.date,
  });

  factory PurchaseHistoryModel.fromJson(Map<String, dynamic> json) {
    return PurchaseHistoryModel(
      id: int.tryParse(json['id'].toString()) ?? 0,
      product: json['product'] ?? "",
      img: json['img'] ?? "",
      price: double.tryParse(json['price'].toString()) ?? 0.0,
      rating: double.tryParse(json['rating'].toString()) ?? 0.0,
      date: json['date'] ?? "",
    );
  }
}
