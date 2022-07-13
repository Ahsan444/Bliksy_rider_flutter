import 'package:bliksy/Utils/Paddings/AppPaddings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Utils/Fonts/AppDimensions.dart';
import '../../../Utils/Fonts/AppFonts.dart';
import '../../../Utils/Themes/AppColors.dart';
import '../../../Utils/Widgets/AppText.dart';

Widget myEarningWidget() {
  return Positioned(
    top: Get.height * 0.46,
      left: 0,
      right: 0,
      child: Padding(
        padding: AppPaddings.defaultPadding,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.WHITE_COLOR,
            boxShadow: [
              BoxShadow(
                color: AppColors.BLACK_COLOR.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 1), // changes position of shadow
              ),
            ],
          ),
          height: Get.height * 0.19,
          child: Padding(
            padding: AppPaddings.defaultPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                        text: 'orderEarningsTxt',
                        fontFamily: Weights.light,
                        textColor: AppColors.LIGHT_GREY_COLOR,
                      fontSize: AppDimensions.FONT_SIZE_18,),
                    AppText(
                        text: '€100.90',

                        fontSize: AppDimensions.FONT_SIZE_18,
                      fontFamily: Weights.light,
                      textColor: AppColors.LIGHT_GREY_COLOR,),
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                        text: 'tpisTxt',
                        fontFamily: Weights.light,
                        textColor: AppColors.LIGHT_GREY_COLOR,
                        fontSize: AppDimensions.FONT_SIZE_18,),
                    AppText(
                        text: '€2.00',

                        fontSize: AppDimensions.FONT_SIZE_18,
                      fontFamily: Weights.light,
                      textColor: AppColors.LIGHT_GREY_COLOR,),
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                        text: 'totalEarningsTxt',
                        fontSize: AppDimensions.FONT_SIZE_18,
                      fontFamily: Weights.light,
                      textColor: AppColors.BLACK_COLOR,),
                    AppText(
                        text: '€102.90',
                        fontSize: AppDimensions.FONT_SIZE_18,
                      fontFamily: Weights.light,
                      textColor: AppColors.BLACK_COLOR,),
                  ],
                )
              ],
            ),
          ),
        ),
      ));
}
