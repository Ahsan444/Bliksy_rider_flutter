import 'package:bliksy/App_Modules/BottomNavigation/MyOrder/Model/Order_detail_model.dart';
import 'package:bliksy/App_Modules/BottomNavigation/MyOrder/View/update_order_controller.dart';
import 'package:bliksy/Utils/Fonts/AppDimensions.dart';
import 'package:bliksy/Utils/Fonts/AppFonts.dart';
import 'package:bliksy/Utils/Paddings/AppPaddings.dart';
import 'package:bliksy/Utils/Themes/AppColors.dart';
import 'package:bliksy/Utils/Widgets/AppText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../Localization/save_locale.dart';
import '../../../../Utils/Widgets/AppButton.dart';
import '../ViewController/order_screen.dart';
import 'order_detail_controller.dart';

//url launcher code
String homeLat = '48.8561';
String homelog = '2.2930';

final Uri _url = Uri.parse(
    'https://www.google.com/maps/search/?api=1&query=${homeLat},${homelog}');

void _launchUrl() async {
  if (!await launchUrl(_url)) throw 'Could not launch $_url';
}
class BottomSheet0 extends StatefulWidget {
   BottomSheet0({
    Key? key,

  }) : super(key: key);

  @override
  State<BottomSheet0> createState() => _BottomSheet0State();
}

class _BottomSheet0State extends State<BottomSheet0> with TickerProviderStateMixin {
  late AnimationController controller;

  final orderDetailController = Get.put(OrderDetailController());
 // final orderDetailModel = OrderDetailModel();

   @override
  void initState()  {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 60),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: false);
    super.initState();
  }


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Container(
          padding: AppPaddings.horizontal,
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  //fun body
                  _launchUrl();
                },
                child: Image.asset(
                  'assets/images/dir_right.png',
                  color: AppColors.BLUE_COLOR,
                  scale: 1.5,
                ),
              ),
            ],
          ),
        ),
        Container(
          color: AppColors.WHITE_COLOR,
          child: Column(children: [
            LinearProgressIndicator(
                color: AppColors.BLUE_COLOR,
                minHeight: 3,
                value: controller.value,
              ),
            Padding(
              padding: AppPaddings.defaultPadding,
              child: Column(children: [
                ListTile(
                  leading: Image.asset(
                    'assets/images/store_icon.png',
                    scale: 4.5,
                  ),
                  horizontalTitleGap: 0,
                  contentPadding: EdgeInsets.all(0),
                  title: AppText(
                      text: 'pickUpTxt',
                      textColor: AppColors.DARK_GREY_COLOR.withOpacity(0.6),
                      fontSize: AppDimensions.FONT_SIZE_14),
                  subtitle:  AppText(
                      text: '-',
                      fontSize: AppDimensions.FONT_SIZE_16,
                      textColor: AppColors.BLACK_COLOR,
                      fontFamily: Weights.medium),
                ),
                SizedBox(
                  height: Get.height * 0.01,
                ),
                ListTile(
                  leading:
                      Image.asset('assets/images/profilee.png', scale: 4.5),
                  horizontalTitleGap: 0,
                  contentPadding: EdgeInsets.all(0),
                  title: AppText(
                      text: 'deliveryto',
                      textColor: AppColors.DARK_GREY_COLOR.withOpacity(0.6),
                      fontSize: AppDimensions.FONT_SIZE_14),
                  subtitle: GetBuilder<OrderDetailController>(
                    builder: (context) {
                      return AppText(
                          text: '--',
                          //text: 'Staringstraat 7G\n1054 VM Amsterdam, Netherlands',
                          fontSize: AppDimensions.FONT_SIZE_16,
                          textColor: AppColors.BLACK_COLOR,
                          fontFamily: Weights.medium);
                    }

                  ),
                ),
              ]),
            ),
            Divider(
              color: AppColors.GREY_COLOR,
              thickness: 1,
            ),
            Padding(
              padding: AppPaddings.defaultPadding,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                      text: 'orderDetail',
                      textColor: AppColors.DARK_GREY_COLOR.withOpacity(0.6),
                      fontSize: AppDimensions.FONT_SIZE_14,
                      fontFamily: Weights.bold),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: AppPaddings.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText(
                                text: 'orderTypeTxt',
                                fontFamily: 'Avenir',
                                fontSize: AppDimensions.FONT_SIZE_18,
                                fontWeight: FontWeights.bold,
                                textColor: AppColors.DARK_GREY_COLOR),
                                GetBuilder<OrderDetailController>(
                                  builder: (context) {
                                    return AppText(
                                          text: '--',
                                        fontFamily: 'Avenir',
                                        fontSize: AppDimensions.FONT_SIZE_18,
                                        fontWeight: FontWeights.bold,
                                        textColor: AppColors.DARK_GREY_COLOR);
                                  }
                                ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      Padding(
                        padding: AppPaddings.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText(
                                text: 'orderAmountTxt',
                                fontFamily: 'Avenir',
                                fontSize: AppDimensions.FONT_SIZE_18,
                                fontWeight: FontWeights.bold,
                                textColor: AppColors.DARK_GREY_COLOR),

                                GetBuilder<OrderDetailController>(
                                  builder: (context) {
                                    return AppText(
                                    text: '€18',
                                    fontFamily: 'Avenir',
                                    fontSize: AppDimensions.FONT_SIZE_18,
                                    fontWeight: FontWeights.bold,
                                    textColor: AppColors.DARK_GREY_COLOR);
                                  }
                                ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      Padding(
                        padding: AppPaddings.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText(
                                text: 'earningAmount',
                                fontFamily: 'Avenir',
                                fontSize: AppDimensions.FONT_SIZE_18,
                                fontWeight: FontWeights.bold,
                                textColor: AppColors.BLACK_COLOR),
                            AppText(
                                text: '€ 08.05',
                                fontFamily: 'Avenir',
                                fontSize: AppDimensions.FONT_SIZE_18,
                                fontWeight: FontWeights.bold,
                                textColor: AppColors.BLACK_COLOR),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      AppButton(
                        buttonName: 'acceptOrderTxt',
                        fontFamily: Weights.light,
                        buttonColor: AppColors.BLUE_COLOR,
                        textColor: AppColors.WHITE_COLOR,
                        buttonWidth: Get.width,
                        buttonRadius: BorderRadius.all(Radius.circular(10)),
                        onTap: () async{
                          orderController.showAppBar(true);
                          orderController.incrementMethod(context);
                        },
                      )
                    ],
                  ),
                ],
              ),
            )
          ]),
        ),
      ],
    );
  }
}
