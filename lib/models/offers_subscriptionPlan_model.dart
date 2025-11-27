
class SubscriptionPlanModel{
  final int id;
  final String planType;
  final double price;
  final double?  pricePerMonth;
  final String billingType;
  final String? saveText;
  final String description;

  SubscriptionPlanModel({
    required this.id,
    required this.planType,
    required this.price,
    required this.pricePerMonth,
    required this.billingType,
    required this.saveText,
    required this.description
  });

  factory SubscriptionPlanModel.fromJson(Map<String,dynamic>json){
    return SubscriptionPlanModel(id: json['id'], planType: json['planType'], price: json['price'], pricePerMonth: json['pricePerMonth'], billingType: json['billingType'], saveText: json['saveText'], description: json['description']);

  }
}
