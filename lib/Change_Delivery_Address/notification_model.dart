class NotificationModel {
  final int id;
  final int userId;
  final String dayStatus;
  final String image;
  final String title;
  final String subtitle;
  final String createdAt;
  NotificationModel({required this.id, required this.userId, required this.dayStatus, required this.image, required this.title, required this.subtitle, required this.createdAt});
  static NotificationModel jsonToModel(Map<String,dynamic> data){
    return NotificationModel(
        id: data['id'] ?? 0,
        userId: data['user_id'] ?? 0,
        dayStatus: data['day_status'] ?? "",
        image: data['image'] ?? "",
        title: data['title'] ?? "",
        subtitle: data['subtitle'] ?? "",
        createdAt: data['created_at'] ?? "",
    );
  }
}