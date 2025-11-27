class RatingModal {
  final double ratingValue;
  final int ratingCount;

  RatingModal({required this.ratingValue, required this.ratingCount});

  factory RatingModal.fromJson(Map<String, dynamic> json) {
    return RatingModal(
      ratingValue: (json['rating_value'] ?? 0).toDouble(),
      ratingCount: json['rating_count'] ?? 0,
    );
  }
}
