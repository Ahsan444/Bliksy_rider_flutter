import 'package:bliksy/App_Modules/Otp/ViewController/password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../Utils/Fonts/AppDimensions.dart';
import '../../../Utils/Fonts/AppFonts.dart';
import '../../../Utils/Paddings/AppBorderRadius.dart';
import '../../../Utils/Paddings/AppPaddings.dart';
import '../../../Utils/Themes/AppColors.dart';
import '../../../Utils/Widgets/AppButton.dart';
import '../../../Utils/Widgets/AppText.dart';
import '../../../Utils/Widgets/app_loader.dart';
import '../../Signup/View/text_form_field.dart';
import '../../dashboard_screen.dart';
import '../ViewController/otp_controller.dart';

class PasswordScreen extends StatelessWidget {
  const PasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   // TextEditingController passController = TextEditingController();
    var controller = Get.put(PasswordController());
    final controller1 = Get.put(OtpController());

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
                // InkWell(
                //     child: CircleAvatar(
                //       radius: 18,
                //       backgroundColor: AppColors.BLUE_COLOR.withOpacity(0.5),
                //       child: Icon(
                //         Icons.chevron_left,
                //         color: AppColors.BLACK_COLOR,
                //       ),
                //     ),
                //     onTap: () {
                //       Get.back();
                //     }),
                SizedBox(
                  width: Get.width * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: AppText(
                    text: 'Password Screen',
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
            child: GetBuilder<PasswordController>(builder: (_) {
              return Column(
                children: [
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Container(
                    width: Get.width / 1.1,
                    child: Padding(
                      padding: AppPaddings.vertical,
                      child: textFields(
                        controller.passController,
                        'password'.tr,
                        'Enter your password'.tr,
                        image: "assets/images/pass_one.png",
                      ),
                    ),
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
                          if (controller.passController.text.isEmpty) {
                            Get.snackbar(
                                'Error',
                                'Please enter your password',
                                backgroundColor: AppColors.BLACK_COLOR,colorText: AppColors.WHITE_COLOR);
                          } else {
                            if (controller1.status.isGranted == false) {
                              await controller1.checkLocationPermission(context);
                            }
                              else {
                              controller.login(context);
                              }
                            }
                          }


                          // if (controller1.status.isGranted == false) {
                          //   controller1.checkLocationPermission(context);
                          // }else if(controller1.status.isGranted == true){
                          //
                          //   controller.login(context);
                          // }
                          // else{
                          //   controller1.checkLocationPermission(context);
                          //   controller.login(context);
                          // }

                          //  appLoader(context, AppColors.PRIMARY_COLOR);

                         // Get.to(() => DashboardScreen());
                        ),
                  )
                ],
              );
            }),
          )),
        ],
      ),
    ));
  }
}
