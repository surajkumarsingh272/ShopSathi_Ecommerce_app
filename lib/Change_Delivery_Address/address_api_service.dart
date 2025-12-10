import 'dart:convert';
import 'package:http/http.dart' as http;
import 'address_model.dart';

class AddressApiService {
  static Future<List<AddressModel>?> getAddressApiData()async{
    var response = await http.get(Uri.parse("http://10.240.210.228:2001/address"));
    if(response.statusCode == 200){
      var resBody = jsonDecode(response.body);
      List<dynamic> jsonBody = resBody['data'];
      var convertToModel = jsonBody.map((e)=> AddressModel.jsonToModel(e),).toList();
      return convertToModel;
    }
    return null;
  }



  static Future<AddressModel?> postAddressApiData(Map<String,dynamic> data)async{
    var response = await http.post(Uri.parse("http://10.240.210.228:2001/add_address"),headers: {"Content-Type":"application/json"},body: jsonEncode(data));
    if(response.statusCode == 200 || response.statusCode == 201){
      var resBody = jsonDecode(response.body);
      // dynamic jsonBody = jsonDecode(resBody);
      var convertToModel = AddressModel.jsonToModel(resBody);
      return convertToModel;
    }
    return null;
  }

  static Future<AddressModel?> updateAddressApiData(int id, Map<String,dynamic> data) async {
    var response = await http.put(Uri.parse("http://10.240.210.228:2001/update_address/$id"), headers: {"Content-Type": "application/json"}, body: jsonEncode(data),);
    if (response.statusCode == 200 || response.statusCode == 201) {
      var resBody = jsonDecode(response.body);
      var convertToModel = AddressModel.jsonToModel(resBody);
      return convertToModel;
    }
    return null;
  }
}
