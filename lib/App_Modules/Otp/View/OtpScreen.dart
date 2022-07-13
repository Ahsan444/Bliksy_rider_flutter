import 'package:bliksy/App_Modules/Otp/View/Password_Screen.dart';
import 'package:bliksy/App_Modules/Otp/ViewController/otp_controller.dart';
import 'package:bliksy/App_Modules/dashboard_screen.dart';
import 'package:bliksy/Utils/Fonts/AppDimensions.dart';
import 'package:bliksy/Utils/Fonts/AppFonts.dart';
import 'package:bliksy/Utils/Paddings/AppBorderRadius.dart';
import 'package:bliksy/Utils/Paddings/AppPaddings.dart';
import 'package:bliksy/Utils/Themes/AppColors.dart';
import 'package:bliksy/Utils/Widgets/AppButton.dart';
import 'package:bliksy/Utils/Widgets/AppText.dart';
import 'package:bliksy/Utils/Widgets/app_loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

class OtpScreen extends StatefulWidget {
 final otpId;
  OtpScreen({Key? key, this.otpId}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final controller = Get.put(OtpController());
  var verificationId;
  var otpTextField;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: Get.height,
      width: Get.width,
      color: AppColors.WHITE_COLOR,
      child: Column(
        children: [
          Container(
            height: Get.height / 6,
            padding: AppPaddings.defaultPadding,
            decoration: BoxDecoration(color: AppColors.WHITE_COLOR),
            // padding: AppPaddings.defaultPadding,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                    child: CircleAvatar(
                      radius: 18,
                      backgroundColor: AppColors.BLUE_COLOR.withOpacity(0.5),
                      child: Icon(
                        Icons.chevron_left,
                        color: AppColors.BLACK_COLOR,
                      ),
                    ),
                    onTap: () {
                      Get.back();
                    }),
                SizedBox(
                  width: Get.width * 0.2,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: AppText(
                    text: 'otpCode',
                    fontFamily: Weights.light,
                    fontSize: AppDimensions.FONT_SIZE_26,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Padding(
            padding: AppPaddings.defaultPadding,
            child: GetBuilder<OtpController>(builder: (_) {
              return Column(
                children: [
                  AppText(
                    text: 'enterOtpTxt',
                    fontFamily: Weights.bold,
                    fontSize: AppDimensions.FONT_SIZE_14,
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Container(
                    width: Get.width / 1.1,
                    child: OTPTextField(
                      length: 6,
                      otpFieldStyle: OtpFieldStyle(
                          borderColor: AppColors.GREY_COLOR,
                          focusBorderColor: AppColors.GREY_COLOR),
                      width: MediaQuery.of(context).size.width,
                      fieldWidth: 50,
                      style: const TextStyle(fontSize: 20),
                      outlineBorderRadius: 10,
                      textFieldAlignment: MainAxisAlignment.spaceAround,
                      fieldStyle: FieldStyle.box,
                      onCompleted: (pin) {
                      //  print("Completed: " + pin);
                        controller.showMethod();
                      },
                      onChanged: (val) {
                        otpTextField = val;
                        print("OTP is: " + otpTextField);
                      },
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText(
                          text: 'didNotGetOtp',
                          fontFamily: Weights.bold,
                          fontSize: AppDimensions.FONT_SIZE_16,
                          fontWeight: FontWeights.regular),
                      SizedBox(
                        width: Get.width * 0.015,
                      ),
                      AppText(
                          text: 'resend',
                          fontFamily: Weights.bold,
                          fontSize: AppDimensions.FONT_SIZE_16,
                          textColor: AppColors.BLUE_COLOR,
                          fontWeight: FontWeights.regular),
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.08,
                  ),
                  Padding(
                    padding: AppPaddings.horizontal,
                    child: AppButton(
                        buttonWidth: Get.width,
                        buttonRadius: AppBorderRadius.BORDER_RADIUS_10,
                        buttonName: 'continueTxt',
                        textSize: AppDimensions.FONT_SIZE_16,
                        fontFamily: Weights.bold,
                        fontWeight: FontWeights.medium,
                        buttonColor: controller.isShow
                            ? AppColors.BLUE_COLOR
                            : AppColors.DISABLE_COLOR,
                        textColor: controller.isShow
                            ? AppColors.WHITE_COLOR
                            : AppColors.DARK_GREY_COLOR.withOpacity(0.8),
                        onTap: () async {
                          appLoader(context, AppColors.PRIMARY_COLOR);
                          Future.delayed(Duration(seconds: 2), () {
                            Get.back();
                            controller.checkLocationPermission(context);
                            Get.offAll(() => DashboardScreen());
                          });



                          /*PhoneAuthCredential credential =
                              PhoneAuthProvider.credential(
                                  verificationId: widget.otpId, smsCode: otpTextField);
                          try {
                            UserCredential userCredential = await FirebaseAuth
                                .instance
                                .signInWithCredential(credential);

                           // Get.offAll(() => PasswordScreen());
                            // if (userCredential.user != null) {
                            //   Get.back();
                            //  // Get.offAll(() => DashboardScreen());
                            //
                            //   debugPrint('OTP verified ${widget.otpId}');
                            // }else{
                            //   Get.offAll(() => PasswordScreen());
                            // }
                          } on FirebaseAuthException catch (ex) {
                            Get.back();
                            Get.snackbar('Alert', 'Invalid OTP',
                                backgroundColor: AppColors.BLACK_COLOR,
                                colorText: AppColors.WHITE_COLOR

                            );
                            debugPrint('otp wrong ${ex.code}');

                          }*/
                          // Get.to(() => DashboardScreen());
                        }),
                  ),
                ],
              );
            }),
          )),
        ],
      ),
    ));
  }
}





