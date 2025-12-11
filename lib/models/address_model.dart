// class AddressModel {
//   final int id;
//   final int userId;
//   final String name;
//   final String mobile;
//   final String pincode;
//   final String state;
//   final String city;
//   final String houseNo;
//   final String roadName;
//   final String addressType;
//   final int isDefault;
//
//   AddressModel({
//     required this.id,
//     required this.userId,
//     required this.name,
//     required this.mobile,
//     required this.pincode,
//     required this.state,
//     required this.city,
//     required this.houseNo,
//     required this.roadName,
//     required this.addressType,
//     required this.isDefault,
//   });
//
//   factory AddressModel.fromJson(Map<String, dynamic> json) {
//     return AddressModel(
//       id: json['id'],
//       userId: json['user_id'],
//       name: json['name'],
//       mobile: json['mobile'],
//       pincode: json['pincode'],
//       state: json['state'],
//       city: json['city'],
//       houseNo: json['house_no'],
//       roadName: json['road_name'],
//       addressType: json['address_type'],
//       isDefault: json['is_default'],
//     );
//   }
// }

class AddressModel {
  final int id;
  final int userId;
  final String name;
  final String mobile;
  final String pincode;
  final String state;
  final String city;
  final String houseNo;
  final String roadName;
  final String addressType;
  final int isDefault;

  AddressModel({
    required this.id,
    required this.userId,
    required this.name,
    required this.mobile,
    required this.pincode,
    required this.state,
    required this.city,
    required this.houseNo,
    required this.roadName,
    required this.addressType,
    required this.isDefault,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      id: json['id'] ?? 0,
      userId: json['user_id'] ?? 0,
      name: json['name'] ?? "",
      mobile: json['mobile'] ?? "",
      pincode: json['pincode'] ?? "",
      state: json['state'] ?? "",
      city: json['city'] ?? "",
      houseNo: json['house_no'] ?? "",
      roadName: json['road_name'] ?? "",
      addressType: json['address_type'] ?? "",
      isDefault: json['is_default'] ?? 0,
    );
  }
}
