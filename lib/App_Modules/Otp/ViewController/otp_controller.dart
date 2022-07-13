import 'package:bliksy/App_Modules/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../Dialogs/View/custome_dialog.dart';

class OtpController extends GetxController {
  bool isShow = false;
  TextEditingController controller = TextEditingController();
  var status =  Permission.location.status;

  void showMethod() {
    isShow = true;
    update();
  }




  checkLocationPermission(BuildContext context) async {
    var status = await Permission.location.status;
    //status = await Geolocator.requestPermission();

    await Permission.location.request();
    await Permission.locationWhenInUse.request();
    if (status.isGranted) {
      debugPrint('permission is yes');
      Get.to(
        () =>  DashboardScreen(),
      );
      debugPrint('location granted: ${status.isGranted}');
    } else if (status.isDenied) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return MyDialog(
            isShow: true,
            title: 'Location Not Detected',
            subTitle:
                'Please enable your location services to give us your exact delivery address',
            filledButtonText: 'Enable Location',
            secondButtonText: 'Cancel',
            imagePath: 'assets/images/loc_not_detected.svg',
            btnOneFunction: () async {
              if (!status.isGranted) {
                await Geolocator.checkPermission();
                await Geolocator.requestPermission();
               // await Permission.location.request();
               // await Permission.locationWhenInUse.request();
                Navigator.pop(context);
                
                // Get.to(
                //   () => const DashboardScreen(),
                // );
                if (status.isGranted == false) {
                  openAppSettings();
                }
                // else{
                //   Get.to(
                //     () => const DashboardScreen(),
                //   );
                // }
                debugPrint('location granted: ${status.isGranted}');
              }
              else{
                openAppSettings();
              }
            },
            btnTwoFunction: () {
              Get.back();
            },
          );
        },
      );
      // openAppSettings();
      debugPrint('location denied: ${status.isDenied}');
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
      debugPrint('location denied Permanently: ${status.isPermanentlyDenied}');
    }else{
      openAppSettings();
    }
  }
}
