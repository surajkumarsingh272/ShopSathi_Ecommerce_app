class RecentSearchModel {
  final String keyword;
  final int? count;

  RecentSearchModel({
    required this.keyword,
    this.count,
  });

  factory RecentSearchModel.fromJson(Map<String, dynamic> json) {
    return RecentSearchModel(
      keyword: json['keyword'],
      count: json['count'],
    );
  }
}
