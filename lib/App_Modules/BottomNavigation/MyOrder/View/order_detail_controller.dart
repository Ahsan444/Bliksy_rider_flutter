import 'package:bliksy/App_Modules/BottomNavigation/MyOrder/Model/Order_detail_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class OrderDetailController extends GetxController{
  Dio dio = Dio();
  static const baseUrl = 'http://192.168.0.47:8000/api/orderdetails';
  OrderDetailModel orderDetailModel = OrderDetailModel();
  var response;

  //OrderDetailModel? modelData;


 /* @override
  void onInit() {
    // TODO: implement onInit
      orderDetailMethod(this.context);
    super.onInit();
  }
*/

  Future<OrderDetailModel> orderDetailMethod({var id}) async{
    
   // appLoader(context, AppColors.PRIMARY_COLOR);
    try{
      response = await dio.post(baseUrl, data: {
        'id': id,
      });
      if (response.statusCode == 200){
        //Get.back();

       return OrderDetailModel.fromJson(response.data);

        //modelData = orderDetailModel;
      }

    } on DioError catch(e){
      debugPrint('error while posting OrderDetail data $e');
    }

    return orderDetailModel;
  }

}