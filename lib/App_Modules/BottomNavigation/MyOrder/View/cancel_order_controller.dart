import 'package:bliksy/App_Modules/BottomNavigation/MyOrder/Model/Cancel_order_model.dart';
import 'package:bliksy/Utils/Paddings/AppPaddings.dart';
import 'package:bliksy/Utils/Widgets/AppText.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Localization/save_locale.dart';
import '../../../../Utils/Fonts/AppDimensions.dart';
import '../../../../Utils/Themes/AppColors.dart';
import '../../../../Utils/Widgets/app_loader.dart';

enum ReferenceCharacter { socialMedia, website, viaacquaitances, other }

class CancelOrderController extends GetxController{
  Dio dio = Dio();
  static const baseUrl = 'http://192.168.0.47:8000/api/cancelOrderData';
  CancelOrderModel cancelOrderModel = CancelOrderModel();
  var response;
  var list = [];
  var index1;


  void cancelOrder(BuildContext context ) async{
    appLoader(context, AppColors.PRIMARY_COLOR);
    try{
      response = await dio.post(baseUrl, data: {
        'order_id':  '${box.read('orderIDD')}',
        'driver_id': '${box.read('userIDD')}',
      });
      if (response.statusCode == 200){
        Get.back();
        cancelOrderModel = CancelOrderModel.fromJson(response.data);
        cancelOrderModel.data?.cancelData?.first.id;
        list.add(response.data);
        debugPrint('update order model data is ${response.data}');
        showDialog(
            context: context,
            builder: (BuildContext context){
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 0.0,
                backgroundColor: Colors.white,
                insetPadding:
                EdgeInsets.symmetric(horizontal: 40, vertical: Get.height / 4),
                child: GetBuilder<CancelOrderController>(
                    builder: (context) {
                      return Container(
                          width: Get.width,
                          height: Get.height *0.4,
                          child: ListView.builder(
                            itemCount: cancelOrderModel.data?.cancelData?.length,
                            itemBuilder: (context, int index){
                              return Padding(
                                padding: AppPaddings.defaultPadding,
                                child: ListTile(
                                  title: Container(
                                    height: Get.height * 0.07,
                                    decoration: BoxDecoration(
                                        color: index1 == index ? AppColors.BLUE_COLOR.withOpacity(0.2) : AppColors.TRANSPARENT_COLOR,
                                      borderRadius: BorderRadius.all(Radius.circular(10))
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: AppPaddings.defaultPadding,
                                          child: AppText(text: '${cancelOrderModel.data?.cancelData?[index].name}',
                                              fontSize: AppDimensions.FONT_SIZE_16,),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // leading: AppText(text: '${cancelOrderModel.data?.cancelData?[index].id}',
                                  //     fontSize: AppDimensions.FONT_SIZE_13),
                                  contentPadding: EdgeInsets.all(0),
                                  horizontalTitleGap: 0,
                                  minLeadingWidth: 30,
                                  onTap: (){
                                    index1 = index;
                                    debugPrint('indexx is ${index}');
                                    update();
                                  },


                                ),
                              );
                            },)
                      );
                    }
                ),
              );
            });
      }

    } on DioError catch(e){
      debugPrint('error while posting the data $e');
    }
  }

}