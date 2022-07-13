import 'package:bliksy/Utils/Paddings/AppPaddings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Utils/Fonts/AppDimensions.dart';
import '../../../../Utils/Fonts/AppFonts.dart';
import '../../../../Utils/Themes/AppColors.dart';
import '../../../../Utils/Widgets/AppText.dart';
import '../Model/Order_detail_model.dart';

class CompletedTab extends StatelessWidget {

   CompletedTab({Key? key,}) : super(key: key);
   final String image =
       'https://images.pexels.com/photos/11660966/pexels-photo-11660966.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2';
   final String orderNum = 'Order complete';
   final String orderDate = 'June 7, 2022 12:50PM';


   @override
   Widget build(BuildContext context) {
     return  Container(
       alignment: Alignment.center,
       child: Stack(
         children: [
           Container(
             height: Get.height,
             width: Get.width,
             margin: EdgeInsets.only(top: Get.height * 0.1),
             decoration: BoxDecoration(
               color: AppColors.WHITE_COLOR,
               borderRadius: BorderRadius.only(
                 topLeft: Radius.circular(50),
                 topRight: Radius.circular(50),
               ),
             ),
           ),
           Positioned(
               left: 0,
               right: 0,
               top: 10,
               child: Padding(
                 padding: EdgeInsets.all(0),
                 child: Padding(
                   padding: AppPaddings.defaultPadding,
                   child: Card(
                     child: Column(
                       children: [
                         Padding(
                           padding: EdgeInsets.symmetric(
                               horizontal: Get.width * 0.02,
                               vertical: Get.height * 0.01),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.start,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               CircleAvatar(
                                 radius: Get.height * 0.05,
                                 backgroundImage: NetworkImage('$image'),
                               ),
                               SizedBox(
                                 width: Get.width * 0.03,
                               ),
                               Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   AppText(
                                       text:'$orderNum',
                                       fontSize: AppDimensions.FONT_SIZE_16,
                                       fontFamily: Weights.light,
                                       fontWeight: FontWeights.bold),
                                   SizedBox(
                                     height: Get.height * 0.004,
                                   ),
                                   AppText(
                                       text: '$orderDate',
                                       fontSize: AppDimensions.FONT_SIZE_12,
                                       fontFamily: Weights.medium,
                                       textColor: AppColors.DARK_GREY_COLOR
                                           .withOpacity(0.6)),
                                   SizedBox(
                                     height: Get.height * 0.002,
                                   ),
                                   SizedBox(
                                     width: Get.width * 0.61,
                                     child: Divider(
                                       color: AppColors.DARK_GREY_COLOR
                                           .withOpacity(0.8),
                                     ),
                                   ),
                                 ],
                               )
                             ],
                           ),
                         ),
                         Divider(
                           color: AppColors.SECONDRY_COLOR,
                           thickness: 5,
                         ),
                         Padding(
                           padding: EdgeInsets.symmetric(
                               horizontal: Get.width * 0.02,
                               vertical: Get.height * 0.01),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Image.asset(
                                 'assets/images/delivery-bike.png',
                                 height: Get.height * 0.05,
                               ),
                               CircleAvatar(
                                  radius: Get.height * 0.02,
                                 child: Icon(Icons.check,
                                     color: AppColors.WHITE_COLOR),
                                ),

                             ],
                           ),
                         )
                       ],
                     ),
                   ),
                 ),
               )),
         ],
       ),
     ) ;
   }
}
