import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';

final box = GetStorage();
LangController langController = Get.put(LangController());

class LangController extends GetxController{
  void changeLanguage(var param1, var param2){
    var locate = Locale(param1, param2);
      Get.updateLocale(locate);
    
  }
}