class OrderModel {
  final int id;
  final double totalAmount;
  final String orderStatus;
  final String paymentStatus;
  final String paymentMethod;
  final String orderDate;

  OrderModel({
    required this.id,
    required this.totalAmount,
    required this.orderStatus,
    required this.paymentStatus,
    required this.paymentMethod,
    required this.orderDate,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      totalAmount: double.tryParse(json['total_amount'].toString()) ?? 0,
      orderStatus: json['order_status'] ?? "",
      paymentStatus: json['payment_status'] ?? "",
      paymentMethod: json['payment_method'] ?? "",
      orderDate: json['order_date'] ?? "",
    );
  }
}
