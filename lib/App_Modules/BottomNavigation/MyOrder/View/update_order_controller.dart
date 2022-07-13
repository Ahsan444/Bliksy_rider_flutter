import 'package:bliksy/App_Modules/BottomNavigation/MyOrder/Model/Order_detail_model.dart';
import 'package:bliksy/App_Modules/BottomNavigation/MyOrder/Model/Update_order_status.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../Utils/Themes/AppColors.dart';
import '../../../../Utils/Widgets/app_loader.dart';

class UpdateOrderController extends GetxController{
  Dio dio = Dio();
  static const baseUrl = 'http://192.168.0.47:8000/api/update_order_status';
  var response;
  UpdateOrderStatusModel updateOrderStatusModel = UpdateOrderStatusModel();
  OrderDetailModel model = OrderDetailModel();

  Future<UpdateOrderStatusModel> acceptOrder(var id, BuildContext context,var status) async{

    appLoader(context, AppColors.PRIMARY_COLOR);
    final prefs = await SharedPreferences.getInstance();
    try{
      response = await dio.post(baseUrl,data: {
        'order_id': '${prefs.getString('orderIDD')}',
        'status': status,
        'driver_id': id,
      });
      if (response.statusCode == 200){
        Get.back();
        if (updateOrderStatusModel.message=='Order Accepted') {
          debugPrint('order has been accepted');
        }
        else if(updateOrderStatusModel.message == 'Driver is on the way'){
          debugPrint('deliver order is on the way');
        }else if (updateOrderStatusModel.message == 'Order completed') {
          debugPrint('Order has been completed');
        }
        else{
          debugPrint('Chigi chigi chigi chigi ');
        }
        return updateOrderStatusModel = UpdateOrderStatusModel.fromJson(response.data);
        //debugPrint('update order model data is ${response.data}');
      }

    } on DioError catch (e) {

      debugPrint('error while posting: $e');


    }
    return updateOrderStatusModel;
  }
}