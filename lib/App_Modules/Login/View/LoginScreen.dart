import 'package:bliksy/Stepper/ViewController/stepper_screen.dart';
import 'package:bliksy/Utils/Widgets/app_loader.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../Utils/Constants/AppImages.dart';
import '../../../Utils/Fonts/AppDimensions.dart';
import '../../../Utils/Fonts/AppFonts.dart';
import '../../../Utils/Paddings/AppBorderRadius.dart';
import '../../../Utils/Paddings/AppPaddings.dart';
import '../../../Utils/Themes/AppColors.dart';
import '../../../Utils/Widgets/AppButton.dart';
import '../../../Utils/Widgets/AppText.dart';
import '../../Otp/View/OtpScreen.dart';
import '../ViewController/phone_auth_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final phoneAuthcontroller = Get.put(PhoneAuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.BLUE_COLOR,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: 0,
              top: 16,
            ),
            child: Stack(
              children: [
                Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: SvgPicture.asset(AppImages.Bliksy)),
                    Padding(
                      padding: AppPaddings.defaultPadding,
                      child: Row(
                        children: [
                          SizedBox(
                            height: Get.height * 0.05,
                          ),
                          AppText(
                            text: 'welcomeText',
                            fontFamily: Weights.light,
                            fontSize: AppDimensions.FONT_SIZE_24,
                            fontWeight: FontWeights.medium,
                            textColor: AppColors.LIGHT_WHITE,
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Image.asset(
                      'assets/images/bg_login_screen.png',
                      fit: BoxFit.cover,
                    ),
                    /*SvgPicture.asset(
                      AppImages.LOGIN_SCREEN_IMAGE,
                      fit: BoxFit.cover,
                    ),*/
                    Spacer(),
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.LIGHT_WHITE,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50))),
                      width: Get.width,
                      height: Get.height / 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: Get.height * 0.04),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AppText(
                                    text: 'notRiderTxt',
                                    fontSize: AppDimensions.FONT_SIZE_18,
                                    fontFamily: Weights.light),
                                InkWell(
                                  child: AppText(
                                      text: ' becomePartner',
                                      fontSize: AppDimensions.FONT_SIZE_18,
                                      textColor: AppColors.BLUE_COLOR,
                                      fontFamily: Weights.light),
                                  onTap: () {
                                    Get.to(() => StepperScreen());
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),

                //LoginPositionedWidget()
                //login card code
                Positioned(
                    bottom: Get.height * 0.105,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: Get.height * 0.01),
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
                              offset:
                                  Offset(0, 1), // changes position of shadow
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
                                    border: Border.all(
                                        color: AppColors.BLACK_COLOR,
                                        width: .5),
                                    borderRadius:
                                        AppBorderRadius.BORDER_RADIUS_10),
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: const BoxDecoration(
                                          border:
                                              Border(bottom: BorderSide.none)),
                                      child: GetBuilder<PhoneAuthController>(
                                          builder: (context) {
                                        return CountryCodePicker(
                                          showFlag: false,
                                          initialSelection: '+31',
                                          onChanged: (value) {
                                            phoneAuthcontroller.countryCode =
                                                value;
                                            debugPrint(
                                                'country code: ${phoneAuthcontroller.countryCode}');
                                          },
                                          dialogTextStyle: const TextStyle(
                                            fontSize:
                                                AppDimensions.FONT_SIZE_16,
                                          ),
                                          textStyle: TextStyle(
                                            fontSize:
                                                AppDimensions.FONT_SIZE_15,
                                            color: AppColors.LIGHT_GREY_COLOR,
                                            fontFamily: Weights.bold,
                                          ),
                                          padding: EdgeInsets.zero,
                                          showCountryOnly: false,
                                          showOnlyCountryWhenClosed: false,
                                          alignLeft: false,
                                        );
                                      }),
                                    ),
                                    VerticalDivider(
                                        thickness: .5,
                                        color: AppColors.BLACK_COLOR),
                                    SizedBox(
                                      width: Get.width * 0.01,
                                    ),
                                    Flexible(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 16),
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            border: Border(
                                                top: BorderSide.none,
                                                bottom: BorderSide.none),
                                          ),
                                          child: TextField(
                                            cursorColor:
                                                AppColors.DARK_GREY_COLOR,
                                            controller: phoneAuthcontroller
                                                .phoneNumberController,
                                            onChanged: (value) {
                                              // phoneAuthcontroller.phoneNumber = value;
                                              // debugPrint('phone number: ${phoneAuthcontroller.phoneNumber}');
                                            },
                                            decoration: InputDecoration(
                                              hintText: 'phoneNumb'.tr,
                                              hintStyle: TextStyle(
                                                color:
                                                    AppColors.LIGHT_GREY_COLOR,
                                                fontFamily: Weights.bold,
                                              ),
                                              border: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              enabledBorder: InputBorder.none,
                                              errorBorder: InputBorder.none,
                                              disabledBorder: InputBorder.none,
                                            ),
                                            keyboardType: TextInputType.number,
                                            inputFormatters: <
                                                TextInputFormatter>[
                                              FilteringTextInputFormatter
                                                  .digitsOnly
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
                                            fontSize:
                                                AppDimensions.FONT_SIZE_14,
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
                                        style: TextStyle(
                                            fontFamily: Weights.light)),
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
                                  buttonRadius:
                                      AppBorderRadius.BORDER_RADIUS_10,
                                  buttonWidth: Get.width,
                                  buttonName: 'continueTxt',
                                  buttonColor: AppColors.BLUE_COLOR,
                                  textColor: AppColors.WHITE_COLOR,
                                  fontFamily: Weights.light,
                                  onTap: () async {
                                    appLoader(context, AppColors.PRIMARY_COLOR);
                                    phoneAuthcontroller.phoneNumber =
                                        '${phoneAuthcontroller.countryCode}${phoneAuthcontroller.phoneNumberController.text}';
                                    Future.delayed(Duration(seconds: 2), () {
                                      Get.back();
                                      Get.to(OtpScreen());
                                    });

                                    // String phone = phoneNumberPattern + phoneNumberController.text.trim();
                                    /*await FirebaseAuth.instance
                                        .verifyPhoneNumber(
                                      phoneNumber:
                                          phoneAuthcontroller.phoneNumber,
                                      codeSent: (verificationId, resendToken) {
                                        
                                        Get.back();
                                        Get.to(OtpScreen(
                                          otpId: verificationId,
                                        ));
                                      },
                                      verificationCompleted: (PhoneAuthCredential credential)async {
                                        
                                        
                                        debugPrint('code send');
                                      },
                                      verificationFailed: (ex) {
                                        Get.back();
                                        debugPrint('login error');
                                        Get.snackbar('Alert', 'Invalid number',
                                          backgroundColor: AppColors.BLACK_COLOR,
                                          colorText: AppColors.WHITE_COLOR

                                        );

                                      },
                                      codeAutoRetrievalTimeout:
                                          (verificationId) {},
                                      timeout: const Duration(seconds: 60),
                                    );*/
                                    debugPrint('phone number: ${phoneAuthcontroller.phoneNumber}');

                                    //Get.to(() => OtpScreen());
                                  })
                            ],
                          ),
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ));
  }
}
