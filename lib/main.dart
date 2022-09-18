import 'package:bliksy/App_Modules/BottomNavigation/MyOrder/Model/Order_detail_model.dart';
import 'package:bliksy/App_Modules/BottomNavigation/MyOrder/ViewController/order_screen.dart';
import 'package:bliksy/App_Modules/Splash/ViewController/splash_screen.dart';
import 'package:bliksy/FirebaseMessinging/firebase_push_notification.dart';
import 'package:bliksy/Utils/Themes/AppColors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Localization/localization_bliksy.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light),
    );
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      locale: Get.deviceLocale,
      translations: LocLizationClass(),
      fallbackLocale: const Locale(
        'en',
        'US',
      ),
      title: 'Bliksy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        bottomSheetTheme:
            BottomSheetThemeData(backgroundColor: AppColors.TRANSPARENT_COLOR),
      ),
      home: SplashScreen(),
      //const LoginScreen(),
    );
  }
}