class AddressModel {
  final int id;
  final int userId;
  final String name;
  final String lastName;
  final String addressLine;
  final String city;
  final String state;
  final String pincode;
  final String houseNo;
  final String contactNo;

  AddressModel({
    required this.id,
    required this.userId,
    required this.name,
    required this.lastName,
    required this.addressLine,
    required this.city,
    required this.state,
    required this.pincode,
    required this.houseNo,
    required this.contactNo,
  });

  static AddressModel jsonToModel(Map<String, dynamic> data) {
    return AddressModel(
      id: data['id'] ?? 0,
      userId: data['user_id'] ?? 0,
      name: data['name'] ?? "",
      lastName: data['last_name'] ?? "",
      addressLine: data['address_line'] ?? "",
      city: data['city'] ?? "",
      state: data['state'] ?? "",
      pincode: data['pincode'] ?? "",
      houseNo: data['house_no'] ?? "",
      contactNo: data['contact'] ?? "",
    );
  }
}
