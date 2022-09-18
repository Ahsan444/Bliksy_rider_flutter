import 'package:bliksy/App_Modules/MyEarnings/View/MyEarningWidget.dart';
import 'package:bliksy/App_Modules/MyEarnings/View/bar_chart.dart';
import 'package:bliksy/Utils/Fonts/AppDimensions.dart';
import 'package:bliksy/Utils/Fonts/AppFonts.dart';
import 'package:bliksy/Utils/Paddings/AppBorderRadius.dart';
import 'package:bliksy/Utils/Paddings/AppPaddings.dart';
import 'package:bliksy/Utils/Themes/AppColors.dart';
import 'package:bliksy/Utils/Widgets/AppButton.dart';
import 'package:bliksy/Utils/Widgets/AppText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyEarning extends StatelessWidget {
  const MyEarning({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    return Scaffold(
      backgroundColor: AppColors.BLUE_COLOR,
      appBar: AppBar(
        title: AppText(
            text: 'myEarningTxt',
            fontFamily: Weights.light,
            textColor: AppColors.WHITE_COLOR,
            fontSize: AppDimensions.FONT_SIZE_24,
            fontWeight: FontWeights.medium,),
        centerTitle: true,
        backgroundColor: AppColors.TRANSPARENT_COLOR,
        elevation: 0,
        iconTheme: IconThemeData(
          color: AppColors.TRANSPARENT_COLOR
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //Top Wallet Card
          Column(
          //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16,right: 16,top: 0,),
                child: Container(
                  height: Get.height * 0.11,
                  decoration: BoxDecoration(
                    color: AppColors.WHITE_COLOR,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.BLACK_COLOR.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset:
                            Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: AppPaddings.defaultPadding,
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                                text: 'walletBalanceTxt',
                                fontFamily: 'Avenir',
                                fontSize: AppDimensions.FONT_SIZE_14,
                                textColor: AppColors.DARK_GREY_COLOR,
                                fontWeight: FontWeights.regular),
                            SizedBox(height: Get.height*0.004,),
                            AppText(
                                text: '€102.90',
                                fontFamily: Weights.light,
                                fontSize: AppDimensions.FONT_SIZE_24,
                                textColor: AppColors.BLACK_COLOR,),
                          ],
                        ),
                        Spacer(),
                        AppButton(
                            buttonRadius:
                                AppBorderRadius.BORDER_RADIUS_10,
                            buttonName: 'withDrawTxt',
                            fontFamily: Weights.light,
                            fontWeight: FontWeight.w400,
                            textSize: AppDimensions.FONT_SIZE_16,
                            buttonColor: AppColors.BLUE_COLOR,
                            textColor: AppColors.WHITE_COLOR,
                            onTap: () {})
                      ],
                    ),
                  ),
                ),
              ),

            ],
          ),
          //Spacer(),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.WHITE_COLOR,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                  ),
              ),

              height: Get.height *0.2,
              margin: EdgeInsets.only(top: Get.height*0.01),
              child: Stack(
                children: [
                  Positioned(
                      bottom: Get.height * 0.22,
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
                          height: Get.height * 0.46,
                          width: Get.width,
                          child: Column(
                            children: [
                              Padding(
                                padding: AppPaddings.defaultPadding,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(Icons.chevron_left),
                                    Column(
                                      children: [
                                        AppText(
                                            text: '${now.day}/${now.month}',
                                            fontFamily: Weights.light,
                                            fontSize: AppDimensions.FONT_SIZE_14,
                                            textColor: AppColors.DARK_GREY_COLOR),
                                        AppText(
                                            text: '€102.90',
                                            fontFamily: Weights.light,
                                            fontSize: AppDimensions.FONT_SIZE_24,
                                            textAlign: TextAlign.center,
                                            textColor: AppColors.BLACK_COLOR),
                                      ],
                                    ),
                                    Icon(Icons.chevron_right),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Container(
                                height: Get.height * 0.25,
                                child: barChart(),
                              ),
                              Divider(
                                thickness: 1,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: Get.height * 0.01),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        AppText(
                                            text: 'totalOrder',
                                            fontFamily: Weights.light,
                                            fontSize: AppDimensions.FONT_SIZE_14,
                                            textColor: AppColors.LIGHT_GREY_COLOR),
                                        AppText(
                                            text: '45',
                                            fontFamily: Weights.light,
                                            fontSize: AppDimensions.FONT_SIZE_18,
                                            textColor: AppColors.BLACK_COLOR),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        AppText(
                                            text: 'totalOnlineTxt',
                                            fontFamily: Weights.light,
                                            fontSize: AppDimensions.FONT_SIZE_14,
                                            textColor: AppColors.LIGHT_GREY_COLOR),
                                        AppText(
                                            text: '45',
                                            fontFamily: Weights.light,
                                            fontSize: AppDimensions.FONT_SIZE_18,
                                            textColor: AppColors.BLACK_COLOR),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        AppText(
                                            text: 'totalDistanceTxt',
                                            fontFamily: Weights.light,
                                            fontSize: AppDimensions.FONT_SIZE_14,
                                            textColor: AppColors.LIGHT_GREY_COLOR),
                                        AppText(
                                            text: '45',
                                            fontFamily: Weights.light,
                                            fontSize: AppDimensions.FONT_SIZE_18,
                                            textColor: AppColors.BLACK_COLOR),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )),
                  myEarningWidget(),
                ],
              ),
            ),
          ),

        ],

      ),
    );
  }
}
