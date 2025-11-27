

class OffersModel{
  final int id;
  final String title;
  final String description;
  final String image;
  final int discountPercentage;
  final DateTime startTime;
  final DateTime endTime;
  final int isActivel;
  final DateTime createAt;

  OffersModel({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.discountPercentage,
    required this.startTime,
    required this.endTime,
    required this.isActivel,
    required this.createAt
  });

  factory OffersModel.fromJson(Map<String,dynamic> json){
    return OffersModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      image: json['image'],
      discountPercentage: json['discount_Percentage'],
      startTime: DateTime.parse(json['start_time']),
      endTime: DateTime.parse(json['end_time']),
      isActivel: json['is_active'],
      createAt: DateTime.parse(json['created_at']),
    );
  }


}
