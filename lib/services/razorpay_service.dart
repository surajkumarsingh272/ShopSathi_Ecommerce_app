import 'dart:convert';

import 'package:http/http.dart' as http;
class RazorpayService {
  static Future<String> createOrderId(int amount)async{
    String basicAuth = 'Basic ${base64.encode(utf8.encode('rzp_test_RD0BiIvkAPO6jt:rPzFNq6hJlZpoqrWJNmXheLV'))}';
    var requestBody =jsonEncode({
      "amount": "$amount",
      "currency": "INR",
      "receipt": "Payment for bag",
      "notes": {
        "notes_key_1": "Tea, Earl Grey, Hot",
        "notes_key_2": "Tea, Earl Grey… decaf."
      }
    });
    var response =await http.post(Uri.parse("https://api.razorpay.com/v1/orders"),body:requestBody, headers: {"authorization": basicAuth} );
    if(response.statusCode == 200){
      var json = jsonDecode(response.body);
      var id = json["id"];
      return id;
    }
    return "";
  }

}