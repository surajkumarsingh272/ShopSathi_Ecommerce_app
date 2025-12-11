class OrderTrackingModel {
  final int id;
  final int orderId;
  final String status;   
  final String message;
  final String updatedAt;

  OrderTrackingModel({
    required this.id,
    required this.orderId,
    required this.status,
    required this.message,
    required this.updatedAt,
  });

  factory OrderTrackingModel.fromJson(Map<String, dynamic> json) {
    return OrderTrackingModel(
      id: json['id'],
      orderId: json['order_id'],
      status: json['status'],
      message: json['message'],
      updatedAt: json['updated_at'],
    );
  }
}
