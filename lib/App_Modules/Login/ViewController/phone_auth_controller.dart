import 'package:bliksy/App_Modules/Otp/View/OtpScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../Localization/save_locale.dart';
import '../../../Utils/Themes/AppColors.dart';
import '../../../Utils/Widgets/app_loader.dart';

class PhoneAuthController extends GetxController {
  var countryCode;
  TextEditingController phoneNumberController = TextEditingController();
  var phoneNumber;
  final String phoneNumberPattern = 'no num';

  void sendOTP(BuildContext context) async {
    appLoader(context, AppColors.PRIMARY_COLOR);
    String phone = phoneNumberPattern + phoneNumberController.text.trim();
    Future.delayed(Duration(seconds: 1), () {
      Get.back();
      Get.to(OtpScreen());
    });
    /*await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phone,
      codeSent: (verificationId, resendToken) {
        Get.back();
        Get.to(OtpScreen(
          otpId: verificationId,
        ));
      },
      verificationCompleted: (credential) {},
      verificationFailed: (ex) {
        Get.back();
        debugPrint('login error');

      },
      codeAutoRetrievalTimeout: (verificationId) {},
      timeout: const Duration(seconds: 30),
    );*/
  }

  /*void getToken() {
    try {
      FirebaseMessaging.instance.getToken().then((value) {
        String? token = value;
        box.write('tokenFcm', token);
        debugPrint('login token is : $token');
      });
    } catch (e) {
      debugPrint('error is : $e');
    }
  }*/

  @override
  void onInit() {
   // getToken();
    super.onInit();
  }

}
