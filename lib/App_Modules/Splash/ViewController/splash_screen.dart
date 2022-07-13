import 'dart:async';
import 'package:bliksy/App_Modules/Login/View/LoginScreen.dart';
import 'package:bliksy/App_Modules/dashboard_screen.dart';
import 'package:bliksy/Stepper/ViewController/stepper_screen.dart';
import 'package:bliksy/Utils/Constants/AppImages.dart';
import 'package:bliksy/Utils/Fonts/AppDimensions.dart';
import 'package:bliksy/Utils/Fonts/AppFonts.dart';
import 'package:bliksy/Utils/Themes/AppColors.dart';
import 'package:bliksy/Utils/Widgets/AppText.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final String assetName = 'assets/images/iconpdf.svg';
 /* FirebaseAuth.instance.currentUser != null
  ? Get.offAll(DashboardScreen()) :*/

//TODO setting the splash timer
  startTime() async {
    var _duration = const Duration(seconds: 3);
    return Timer(_duration, () {

       Navigator.pushReplacement(
        context,
        MaterialPageRoute(
         // builder: (context) => const SignUpScreen(),

          //builder: (context) => const DashboardScreen(),
         // builder: (context) => const StepsWidgetClass(),
        //  builder: (context) => const HomeScreen(),
          builder: (context) =>  LoginScreen(),
        ),
      );
    });
  }
/*  void getToken() {
    try {
      FirebaseMessaging.instance.getToken().then((value) {
        String? token = value;
        box.write('tokenFcm', token);
        debugPrint('token is : $token');
      });
    } catch (e) {
      debugPrint('error is : $e');
    }
  }*/


  @override
  void initState() {
   // getToken();
    startTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.BLUE_COLOR,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppImages.Bliksy),
            AppText(text: 'bliksy',
            fontFamily: 'Avenir',
            textColor: AppColors.WHITE_COLOR,
            fontSize: AppDimensions.FONT_SIZE_60,
              fontWeight: FontWeights.semiBold
            ),
          ],
        )
      ),
    );
  }
}
