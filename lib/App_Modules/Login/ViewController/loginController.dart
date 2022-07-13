


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import '../../Otp/View/OtpScreen.dart';

class LoginController extends GetxController{
  TextEditingController controller = TextEditingController();
  
  // send otp ----------------------
    void sendOTP() async {
      //appLoader(context, AppColors.PRIMARY_COLOR);
      String phone = "+92" + controller.text.trim();
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phone,
        codeSent: (verificationId, resendToken) {
          Get.back();
          // Get.to(OtpScreen(
          //   varificatioId: verificationId,
          // ));
        },
        verificationCompleted: (credential) {},
        verificationFailed: (ex) {
          Get.back();
          // appSnakBar(
          //     tileText: "Login Error",
          //     descriptionText: ex.code.toString(),
          //     backgroundColor: AppColors.PRIMARY_COLOR);
         // log(ex.code.toString());
        },
        codeAutoRetrievalTimeout: (verificationId) {},
        timeout: const Duration(seconds: 30),
      );
    }
}