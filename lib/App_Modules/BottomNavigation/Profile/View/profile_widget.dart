import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Utils/Fonts/AppDimensions.dart';
import '../../../../Utils/Fonts/AppFonts.dart';
import '../../../../Utils/Paddings/AppBorderRadius.dart';
import '../../../../Utils/Paddings/AppPaddings.dart';
import '../../../../Utils/Themes/AppColors.dart';
import '../../../../Utils/Widgets/AppText.dart';

Widget profileWidget(String? name, String? mail, String profilePicture) {
  return Padding(
    padding: AppPaddings.defaultPadding,
    child: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppText(
                  text: name ??'Williamson',
                  fontSize: AppDimensions.FONT_SIZE_19,

                  fontFamily: Weights.medium),
              SizedBox(
                height: Get.height * 0.003,
              ),
              AppText(
                  text: mail??'Sarawilliamson2306@gmail.com',
                  fontSize: AppDimensions.FONT_SIZE_13,
                  fontWeight: FontWeights.regular,
                  fontFamily: Weights.light),
              SizedBox(
                height: Get.height * 0.015,
              ),
              Row(
                children: [
                  AppText(
                      text: 'viewProfile',
                      fontSize: AppDimensions.FONT_SIZE_12,
                      fontWeight: FontWeights.regular,
                      textColor: AppColors.BLUE_COLOR),
                  SizedBox(
                    width: Get.width * 0.012,
                  ),
                  Image(
                    image: AssetImage('assets/images/more.png',),
                    height: Get.height * 0.012,
                    width: Get.width * 0.013,
                    color: AppColors.BLUE_COLOR,
                  )
                ],
              ),
            ],
          ),
          CircleAvatar(
            radius: 33,
            backgroundImage: NetworkImage(profilePicture),
          )
        ],
      ),
    ),
  );
}

Widget profileOptions() {
  return Container(
    width: Get.width,
    decoration: BoxDecoration(),
    child: Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [

            Column(
              children: [
                Image.asset(
                  'assets/images/notifications.png',
                  height: 24,
                  width: 24,
                ),
                SizedBox(
                  height: 3,
                ),
                AppText(
                    text: 'notification',
                    fontSize: AppDimensions.FONT_SIZE_13,
                    fontWeight: FontWeights.regular,
                    fontFamily: Weights.light)
              ],
            ),
            Column(
              children: [
                Image.asset(
                  'assets/images/settings.png',
                  height: 24,
                  width: 24,
                ),
                SizedBox(
                  height: 3,
                ),
                AppText(
                    text: 'settings',
                    fontSize: AppDimensions.FONT_SIZE_13,
                    fontWeight: FontWeights.regular,
                    fontFamily: Weights.light)
              ],
            ),
            Column(
              children: [
                Image.asset(
                  'assets/images/card.png',
                  height: 24,
                  width: 24,
                ),
                SizedBox(
                  height: 3,
                ),
                AppText(
                    text: 'card', fontSize: AppDimensions.FONT_SIZE_13, fontWeight: FontWeights.regular,
                    fontFamily: Weights.light)
              ],
            ),
          ]),
    ),
  );
}

Widget profileList(String image, String title,) {
  return Padding(
    padding: AppPaddings.horizontal,
    child: Row(
      children: [
        Container(
          height: Get.height * 0.049,
          width: Get.width * 0.106,
          decoration: BoxDecoration(
            borderRadius: AppBorderRadius.BORDER_RADIUS_10,
            color: AppColors.EXTRA_LIGHT_GREY_COLOR,
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Image.asset(image),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        AppText(
            text: title,
            fontSize: AppDimensions.FONT_SIZE_16,
            fontWeight: FontWeights.regular,
        fontFamily: Weights.light),
      ],
    ),
  );
}
