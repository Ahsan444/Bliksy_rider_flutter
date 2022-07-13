import 'package:bliksy/App_Modules/BottomNavigation/Profile/View/location_class.dart';
import 'package:bliksy/Localization/save_locale.dart';
import 'package:bliksy/Utils/Widgets/AppText.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Utils/Fonts/AppDimensions.dart';
import '../../../../Utils/Fonts/AppFonts.dart';
import '../../../../Utils/Paddings/AppPaddings.dart';
import '../../../../Utils/Themes/AppColors.dart';
import '../../../Login/View/LoginScreen.dart';
import '../../../WorkingAreas/ViewController/workinng_areas_screen.dart';
import '../View/profile_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: profileWidget(
                    box.read('userFName')??box.read('userName'),
                    box.read('userEmail')??'Sarawilliamson2306@gmail.com',
                    'https://www.google.com/search?q=ui+face&client=opera&hs=TU4&source=lnms&tbm=isch&sa=X&ved=2ahUKEwjYldS5hfT4AhWECewKHfJhB3EQ_AUoAXoECAIQAw&biw=1560&bih=790#imgrc=enxjBB0DD0MKOM'),
              ),
              Padding(
                padding: AppPaddings.horizontal,
                child: Divider(
                  height: 2,
                  thickness: 5,
                  color: AppColors.BLUE_COLOR.withOpacity(0.2),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              profileOptions(),
              Padding(
                padding: AppPaddings.horizontal,
                child: Divider(
                  height: 0,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          child: profileList(
                              'assets/images/cart.png', 'myOrder'.tr),
                          onTap: () {
                            Get.to(() => WorkingAreasScreen());
                          },
                        ),
                        SizedBox(
                          height: Get.height * 0.025,
                        ),
                        InkWell(
                          child: profileList(
                              'assets/images/my_earning.png', 'earning'),
                          onTap: () {
                            Get.to(() => LocationClass());
                          },
                        ),
                        SizedBox(
                          height: Get.height * 0.025,
                        ),
                        profileList('assets/images/bliksy_car.png',
                            'changeMyVehicle'.tr),
                        SizedBox(
                          height: Get.height * 0.025,
                        ),
                        InkWell(
                          child: profileList('assets/images/world_icon.png',
                              'changeMyLanguage'.tr),
                          onTap: () async {
                            showModalBottomSheet(
                                context: context,
                                builder: (BuildContext bc) {
                                  return SafeArea(
                                    child: Container(
                                      color: AppColors.WHITE_COLOR,
                                      child: Wrap(
                                        children: <Widget>[
                                          Padding(
                                            padding: AppPaddings.vertical,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                AppText(
                                                    text: 'chooseLanguage',
                                                    fontFamily: Weights.medium,
                                                    fontSize: AppDimensions
                                                        .FONT_SIZE_16)
                                              ],
                                            ),
                                          ),
                                          InkWell(
                                            child: ListTile(
                                              title: AppText(
                                                  text: 'englishLang',
                                                  fontFamily: Weights.bold),
                                              onTap: () {
                                                //fun here
                                                langController.changeLanguage(
                                                    'en', 'US');
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ),
                                          InkWell(
                                            child: ListTile(
                                              title: AppText(
                                                  text: 'dutchLang',
                                                  fontFamily: Weights.bold),
                                            ),
                                            onTap: () {
                                              //fun here
                                              langController.changeLanguage(
                                                  'nl', 'NL');
                                              Navigator.pop(context);
                                            },
                                          ),
                                          SizedBox(
                                            height: Get.height * 0.1,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                        ),
                        SizedBox(
                          height: Get.height * 0.025,
                        ),
                        profileList(
                            'assets/images/information.png', 'about'.tr),
                        SizedBox(
                          height: Get.height * 0.025,
                        ),
                        Divider(),
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        Padding(
                          padding: AppPaddings.horizontal,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                  text: 'sendfeedback',
                                  fontSize: AppDimensions.FONT_SIZE_16,
                                  fontWeight: FontWeights.regular,
                                  fontFamily: Weights.light),
                              SizedBox(
                                height: 10,
                              ),
                              AppText(
                                  text: 'rateus',
                                  fontSize: AppDimensions.FONT_SIZE_16,
                                  fontWeight: FontWeights.regular,
                                  fontFamily: Weights.light),
                              SizedBox(
                                height: 10,
                              ),
                              AppText(
                                  text: 'inviteFriend',
                                  fontSize: AppDimensions.FONT_SIZE_16,
                                  fontWeight: FontWeights.regular,
                                  fontFamily: Weights.light),
                              SizedBox(
                                height: 10,
                              ),
                              InkWell(
                                child: AppText(
                                    text: 'logout',
                                    fontSize: AppDimensions.FONT_SIZE_16,
                                    fontWeight: FontWeights.regular,
                                    fontFamily: Weights.light),
                                    onTap: ()async {
                                     await FirebaseAuth.instance.signOut();
                                    // box.erase();
                                      Get.offAll(() => LoginScreen());
                                    },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
