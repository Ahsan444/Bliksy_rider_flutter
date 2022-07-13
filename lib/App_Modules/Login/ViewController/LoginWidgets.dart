import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../Utils/Fonts/AppDimensions.dart';
import '../../../Utils/Fonts/AppFonts.dart';
import '../../../Utils/Paddings/AppBorderRadius.dart';
import '../../../Utils/Paddings/AppPaddings.dart';
import '../../../Utils/Themes/AppColors.dart';
import '../../../Utils/Widgets/AppButton.dart';
import '../../../Utils/Widgets/AppText.dart';
import '../../Otp/View/OtpScreen.dart';


Widget LoginPositionedWidget() {
  
  return Positioned(
      bottom: Get.height * 0.105,
      left: 0,
      right: 0,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.height * 0.01),
        child: Container(
          height: Get.height * 0.34,
          width: Get.width,
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
          child: Padding(
            padding: AppPaddings.defaultPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: 'loginRiderAccountTxt',
                  fontSize: AppDimensions.FONT_SIZE_24,
                  fontFamily: Weights.light,
                ),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                Container(
                  height: Get.height * 0.06,
                  width: Get.width,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: AppColors.BLACK_COLOR, width: .5),
                      borderRadius: AppBorderRadius.BORDER_RADIUS_10),
                  child: Row(
                    children: [
                      Container(
                          decoration: const BoxDecoration(
                              border: Border(bottom: BorderSide.none)),
                          child: Obx(
                            () {
                              return CountryCodePicker(
                                showFlag: false,
                                initialSelection: '+31',
                                onChanged: (value) {
                                
                                 // debugPrint('country code: $value1');
                                },
                                dialogTextStyle: const TextStyle(
                                  fontSize: AppDimensions.FONT_SIZE_16,
                                ),
                                textStyle: TextStyle(
                                  fontSize: AppDimensions.FONT_SIZE_15,
                                  color: AppColors.LIGHT_GREY_COLOR,
                                  fontFamily: Weights.bold,
                                ),
                                padding: EdgeInsets.zero,
                                showCountryOnly: false,
                                showOnlyCountryWhenClosed: false,
                                alignLeft: false,
                              );
                            },
                          )),
                      VerticalDivider(
                          thickness: .5, color: AppColors.BLACK_COLOR),
                      SizedBox(
                        width: Get.width * 0.01,
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                  top: BorderSide.none,
                                  bottom: BorderSide.none),
                            ),
                            child: TextField(
                              cursorColor: AppColors.DARK_GREY_COLOR,
                              decoration: InputDecoration(
                                hintText: 'phoneNumb'.tr,
                                hintStyle: TextStyle(
                                  color: AppColors.LIGHT_GREY_COLOR,
                                  fontFamily: Weights.bold,
                                ),
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                              ),
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.015,
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          text: 'termsConditionTxt'.tr,
                          style: TextStyle(
                              fontSize: AppDimensions.FONT_SIZE_14,
                              fontFamily: Weights.light)),
                      TextSpan(
                        text: 'terms'.tr,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: Weights.medium,
                            color: AppColors.BLUE_COLOR,
                            fontSize: AppDimensions.FONT_SIZE_14),
                      ),
                      TextSpan(
                          text: 'andSign'.tr,
                          style: TextStyle(fontFamily: Weights.light)),
                      TextSpan(
                        text: 'privacyPloicy'.tr,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: Weights.medium,
                            color: AppColors.BLUE_COLOR,
                            fontSize: AppDimensions.FONT_SIZE_14),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.01,
                ),
                AppButton(
                    buttonRadius: AppBorderRadius.BORDER_RADIUS_10,
                    buttonWidth: Get.width,
                    buttonName: 'continueTxt',
                    buttonColor: AppColors.BLUE_COLOR,
                    textColor: AppColors.WHITE_COLOR,
                    fontFamily: Weights.light,
                    onTap: () {
                      Get.to(() => OtpScreen());
                    })
              ],
            ),
          ),
        ),
      ));
}
