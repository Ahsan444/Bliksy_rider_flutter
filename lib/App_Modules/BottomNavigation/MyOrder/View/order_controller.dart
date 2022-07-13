import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../Utils/Themes/AppColors.dart';
import '../../../../Utils/Widgets/app_loader.dart';

class OrderController extends GetxController {
  var isShow = false.obs;
  var checkBox = false.obs;
  var indexValue = 0.obs;
  var percent = 0.0.obs;
  var setImage;
  var selectedImagePath = ''.obs;
  var selectedImagePath2 = ''.obs;
  

  final ImagePicker picker = ImagePicker();
   final ImagePicker picker2 = ImagePicker();
  XFile? image;
  File? imageFile;


  launchURL() async {
    const url = 'tel:+1 555 010 999';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void getImage(ImageSource imageSource) async {
    final pickedFile = await picker.pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
    

    } else {
      debugPrint('null comming');
    }
  }
  void getImage2(ImageSource imageSource) async {
    final pickedFile = await picker2.pickImage(source: imageSource);
    if (pickedFile != null) {
      
      selectedImagePath2.value = pickedFile.path;

    } else {
      debugPrint('null comming');
    }
  }

  @override
  void onInit() {
    // called immediately after the widget is allocated memory
    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (percent == 1) {
        timer.cancel();
      } else {
        percent + 0.1;
      }
    });

    super.onInit();
  }

  showAppBar(var value) {
    isShow.value = value;
    update();
  }

  showCheckBoxVal() {
    checkBox.value = !checkBox.value;
    update();
  }

  incrementMethod(BuildContext context) {
    appLoader(context, AppColors.PRIMARY_COLOR);
    Future.delayed(Duration(seconds: 2), () {
      Get.back();
      indexValue.value++;
      update();
    });
  }
  initialValueMethod() {
    indexValue.value == 0;
  }
}
