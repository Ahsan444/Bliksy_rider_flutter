import 'package:bliksy/App_Modules/BottomNavigation/Profile/ViewController/profile_screen.dart';
import 'package:bliksy/Utils/Paddings/AppPaddings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../../Utils/Constants/AppImages.dart';
import '../../../../Utils/Fonts/AppDimensions.dart';
import '../../../../Utils/Fonts/AppFonts.dart';
import '../../../../Utils/Themes/AppColors.dart';
import '../../../../Utils/Widgets/AppText.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late GoogleMapController _controller;
  String? _mapStyle;
  String googleApikey = "AIzaSyCpv6Gof2kZtntXXkzVslAz-40RcYP3Vbo";
  // late BitmapDescriptor myIcon;
  // String location = "";
  // String loc = "";
  // late BitmapDescriptor shopIcon;
  CameraPosition? cameraPosition;
  late Position currentLocation;
  // var geoLocator = Geolocator();
  bool isChange = true;
  int value = 0;

  void locationPosition() async {
     //await Geolocator.checkPermission();
    // await Geolocator.requestPermission();
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location services are disabled again.');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      openAppSettings();
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentLocation = position;
    LatLng latlatPostion = LatLng(position.latitude, position.longitude);

    CameraPosition cameraPositin =
        new CameraPosition(target: latlatPostion, zoom: 14);
    _controller.animateCamera(CameraUpdate.newCameraPosition(cameraPositin));
  }

  @override
  void initState() {
    locationPosition();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Column(
          children: [
            Container(
              height: Get.height / 8,
              color: AppColors.TRANSPARENT_COLOR,
              padding: AppPaddings.defaultPadding,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: CircleAvatar(
                      radius: 23,
                      backgroundColor:
                          AppColors.LIGHT_BLUE_COLOR.withOpacity(0.5),
                      child: CircleAvatar(
                        radius: 19,
                        backgroundColor: AppColors.BLUE_COLOR.withOpacity(0.5),
                        child: CircleAvatar(
                          radius: 16,
                          child: Image.asset('assets/images/avtar.png'),
                        ),
                      ),
                    ),
                    onTap: () {
                      Get.to(() => ProfileScreen());
                    },
                  ),
                  //right side icon
                  isChange
                      ? InkWell(
                          child: Container(
                            width: Get.width * 0.28,
                            height: Get.height * 0.045,
                            decoration: BoxDecoration(
                              color: AppColors.PRIMARY_COLOR,
                              borderRadius: BorderRadius.all(
                                Radius.circular(40),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 8, right: 0, top: 3, bottom: 3),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AppText(
                                      text: 'onlineTxt',
                                      fontSize: AppDimensions.FONT_SIZE_16,
                                      fontFamily: 'Avenir',
                                      textColor: AppColors.WHITE_COLOR,
                                      fontWeight: FontWeights.regular),
                                  CircleAvatar(
                                    child: SvgPicture.asset(
                                        AppImages.Bliksy_car_compact),
                                    backgroundColor: AppColors.SECONDRY_COLOR,
                                    radius: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              isChange = false;
                            });
                          },
                        )
                      //left Side icon
                      : InkWell(
                          child: Container(
                            width: Get.width * 0.28,
                            height: Get.height * 0.045,
                            decoration: BoxDecoration(
                              color: AppColors.PRIMARY_COLOR,
                              borderRadius: BorderRadius.all(
                                Radius.circular(40),
                              ),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsets.only(right: 8, top: 3, bottom: 3),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    child: SvgPicture.asset(
                                        AppImages.Bliksy_car_compact),
                                    backgroundColor: AppColors.SECONDRY_COLOR,
                                    radius: 20,
                                  ),
                                  AppText(
                                      text: 'offline',
                                      fontSize: AppDimensions.FONT_SIZE_16,
                                      fontFamily: 'Avenir',
                                      textColor: AppColors.WHITE_COLOR,
                                      fontWeight: FontWeights.regular),
                                ],
                              ),
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              isChange = true;
                            });
                          },
                        ),

                  //notification icon

                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: SvgPicture.asset(
                      AppImages.Bliksy_Notification,
                      height: 25,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  SizedBox(
                    width: size.width,
                    height: size.height,
                    child: GoogleMap(
                      zoomControlsEnabled: false,
                      initialCameraPosition: const CameraPosition(
                        target: LatLng(48.8561, 2.2930),
                        zoom: 11.0,
                      ),
                      myLocationEnabled: true,
                      zoomGesturesEnabled: true,
                      mapToolbarEnabled: false,
                      myLocationButtonEnabled: false,
                      onMapCreated: (GoogleMapController controller) {
                        _controller = controller;
                        _controller.setMapStyle(_mapStyle);
                        locationPosition();
                      },
                      onCameraMove: (CameraPosition cameraPositiona) {
                        cameraPosition = cameraPositiona; //when map is dragging
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
