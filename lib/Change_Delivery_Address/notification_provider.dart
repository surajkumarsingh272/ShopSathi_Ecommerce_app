import 'package:flutter/material.dart';
import 'package:shop_sathi_app/Change_Delivery_Address/notification_api_service.dart';
import 'package:shop_sathi_app/Change_Delivery_Address/notification_model.dart';

class NotificationProvider with ChangeNotifier{
  List<NotificationModel> notificationList = [];
  getAllNotificationData()async{
    var notificationData = await NotificationApiService.getNotificationApiData();
    if(notificationData != null){
      notificationList = notificationData;
      notifyListeners();
    }
  }
}