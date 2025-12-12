class SuccessModel {
  final int id;
  final int userId;
  final String image;
  final String title;
  final String subtitle;
  final String productName;
  SuccessModel({required this.id,required this.userId, required this.image, required this.title, required this.subtitle, required this.productName});
  static SuccessModel jsonToModel(Map<String,dynamic> data){
    return SuccessModel(
        id: data['id'] ?? 0,
        userId: data['user_id'] ?? 0,
        image: data['image'] ?? "",
        title: data['title'] ?? "",
        subtitle: data['subtitle'] ?? "",
        productName: data['product_name'] ?? ""
    );
  }
}