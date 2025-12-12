import 'dart:convert';

import 'package:shop_sathi_app/Change_Delivery_Address/success_model.dart';
import 'package:http/http.dart' as http;

class SuccessApiService {
  static Future<List<SuccessModel>?> getSuccessApiData()async{
    var response = await http.get(Uri.parse("http://192.168.31.190:2001/get_success"));
    print("Response Error: ${response.body}");
    print("Status Code: ${response.statusCode}");
    if(response.statusCode == 200){
      print("Response Error: ${response.body}");
      var resBody = jsonDecode(response.body);
      List<dynamic> jsonBody = resBody['data'];
      var convertToModel = jsonBody.map((e)=> SuccessModel.jsonToModel(e)).toList();
      return convertToModel;
    }
    return null;
  }
}