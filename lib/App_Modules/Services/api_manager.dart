import 'dart:convert';

import 'package:bliksy/App_Modules/BottomNavigation/MyOrder/Model/Order_detail_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


import 'api_constants.dart';

class ApiManger extends GetConnect {
  var isLodaing = false.obs;

  static var client = http.Client();

  static Uri uriPath({required String nameUrl}) {
    return Uri.parse(ApiConstants.baseURL + nameUrl);
  }

  // static Future<SignInResponse?> loginRes({var phone, var password,var token}) async {
  //   Map<String, dynamic> body = Map<String, dynamic>();
  //   body['phone'] = phone;
  //   body['password'] = password;
  //   body['token'] = token;
  //   var response =
  //       await client.post(uriPath(nameUrl: ApiConstants.loginURI), body: body);
  //   print(response.statusCode);
  //   print(response.body);
  //
  //   if (response.statusCode == 200) {
  //     var jsonString = response.body;
  //
  //     Get.offAll(HomeViewController());
  //     return signInResponseFromJson(jsonString);
  //   } else {
  //     print(response.statusCode);
  //     Get.snackbar("Error", "", messageText: AppText(text: "User Not Exist"));
  //     //show error message
  //     return null;
  //   }
  // }







  //

/*  static Future<OrderDetailModel?> orderDetail({var id}) async {
    Map<String, dynamic> body = Map<String, dynamic>();
    body['id'] = id;
    var response =
        await client.post(uriPath(nameUrl: ApiConstants.orderDetail), body: body);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      var jsonString = response.body;

      return //orderDetailModelFromJson(jsonString);
    } else {
      print(response.statusCode);

      //show error message
      return null;
    }
  }*/


}
