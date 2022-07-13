import 'package:bliksy/App_Modules/Login/Model/login_model.dart';
import 'package:bliksy/App_Modules/dashboard_screen.dart';
import 'package:bliksy/Stepper/ViewController/stepper_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../../Utils/Themes/AppColors.dart';
import '../../../Utils/Widgets/app_loader.dart';
import 'otp_controller.dart';

class PasswordController extends GetxController {
  var isShow = false;
  var dio = Dio();
  var response;
  final controller = Get.put(OtpController());
  
  static const baseUrl = 'http://192.168.0.47:8000/api/login';
  TextEditingController passController = TextEditingController();
  LoginModel loginModel = LoginModel();

  void login(BuildContext context) async {
    appLoader(context, AppColors.BLUE_COLOR);
    try {
      response = await dio.post(baseUrl, data: {
        'phone_no': box.read('loginPhoneNumber'),
        'password': passController.text,
        'token': box.read('tokenFcm')
      });


      if (response.statusCode == 200) {
        Get.back();
        loginModel = LoginModel.fromJson(response.data);
        var name = loginModel.data?.name;
        var email1 = loginModel.data?.email;
        var userId = loginModel.data?.userId;

        box.write('userFName', name);
        box.write('userEmail', email1);
        box.write('userIDD', userId);

        debugPrint('login details is ${response.data}');
        controller.checkLocationPermission(context);
        Get.offAll(() => DashboardScreen());
      }
    } on DioError catch (e) {
      print('error is $e');
      // print('phone nnno: ${box.read('loginPhoneNumber')}');
      // print('paaaassss: ${passController.text}');
      // print('tokennnn: ${box.read('tokenFcm')}');
    }
  }
}
