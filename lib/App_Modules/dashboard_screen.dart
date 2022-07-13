import 'package:bliksy/App_Modules/BottomNavigation/Home/ViewController/home_screen.dart';
import 'package:bliksy/App_Modules/BottomNavigation/MyOrder/ViewController/order_screen_one.dart';
import 'package:bliksy/App_Modules/MyEarnings/ViewController/MyEarningScreen.dart';
import 'package:bliksy/App_Modules/Otp/ViewController/otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import '../Utils/Themes/AppColors.dart';
import 'BottomNavigation/MyOrder/Model/Order_detail_model.dart';

class DashboardScreen extends StatefulWidget {

   DashboardScreen({Key? key, }) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  final controller = Get.put(OtpController());



  List widgetOptions = [
    const HomeScreen(),
    // const OrderScreen(),
    OrderScreenOne(),
    const MyEarning(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }




  @override
  void initState() {


    //controller.checkLocationPermission(context);
  // getLocation();
   // controller.checkLocationPermission(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/homee.svg',
              width: Get.width * 0.03,
              height: Get.height * 0.03,
            ),
            label: 'home'.tr,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/orderee.svg',
              width: Get.width * 0.03,
              height: Get.height * 0.03,
            ),
            label: 'orderHome'.tr,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/wallett.svg',
              width: Get.width * 0.03,
              height: Get.height * 0.03,
            ),
            label: 'earning'.tr,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.PRIMARY_COLOR,
        onTap: _onItemTapped,
      ),
    );
  }
}
