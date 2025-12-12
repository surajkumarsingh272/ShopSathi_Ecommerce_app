import 'package:flutter/material.dart';
import 'package:shop_sathi_app/Change_Delivery_Address/success_api_service.dart';
import 'package:shop_sathi_app/Change_Delivery_Address/success_model.dart';

class SuccessProvider with ChangeNotifier{
  List<SuccessModel> successList = [];
  getSuccessData()async{
    var successData = await SuccessApiService.getSuccessApiData();
    if(successData != null){
      successList = successData;
      notifyListeners();
    }
  }
}