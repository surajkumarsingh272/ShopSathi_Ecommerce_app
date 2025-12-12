import 'dart:convert';

import 'package:shop_sathi_app/Change_Delivery_Address/notification_model.dart';
import 'package:http/http.dart' as http;

class NotificationApiService {
  static Future<List<NotificationModel>?> getNotificationApiData()async{
    var response = await http.get(Uri.parse("http://192.168.31.190:2001/get_notifications"));
    if(response.statusCode == 200){
      var resBody = jsonDecode(response.body);
      List<dynamic> jsonBody = resBody['data'];
      var convertToModel = jsonBody.map((e)=> NotificationModel.jsonToModel(e)).toList();
      return convertToModel;
    }
    return null;
  }
}