import 'package:bliksy/App_Modules/BottomNavigation/MyOrder/View/order_detail_controller.dart';
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
import '../Model/Order_detail_model.dart';
import '../ViewController/order_screen.dart';
import 'bottomSheet_0.dart';

//url launcher code
String homeLat = '48.8561';
String homelog = '2.2930';

final Uri _url = Uri.parse(
    'https://www.google.com/maps/search/?api=1&query=${homeLat},${homelog}');

void _launchUrl() async {
  if (!await launchUrl(_url)) throw 'Could not launch $_url';
}


class BottomSheet1 extends StatelessWidget {
   BottomSheet1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Container(
          padding: AppPaddings.horizontal,
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
            Padding(
              padding: AppPaddings.defaultPadding,
              child: Column(children: [
                Padding(
                  padding: AppPaddings.horizontal,
                  child: ListTile(
                    leading: Image.asset(
                      'assets/images/store_icon.png',
                      scale: 3,
                    ),
                    horizontalTitleGap: 10,
                    contentPadding: EdgeInsets.all(0),
                    title: AppText(
                        text: 'Atilla Turkish food',
                        fontSize: AppDimensions.FONT_SIZE_16,
                        textColor: AppColors.BLACK_COLOR,
                        fontFamily: Weights.medium),
                    subtitle: AppText(
                      text: '-',
                        // text:
                        //     'Straingstraat 7G\n1054 VM Amsterdam, Netherlands',
                        textColor: AppColors.DARK_GREY_COLOR.withOpacity(0.6),
                        fontSize: AppDimensions.FONT_SIZE_14),
                  ),
                ),
              ]),
            ),
            Divider(
              color: AppColors.GREY_COLOR,
              thickness: 1,
            ),
            Obx(() {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: AppPaddings.horizontal,
                    child: ListTile(
                      contentPadding: AppPaddings.horizontal,
                      title: AppText(
                          text: 'storeIns',
                          fontSize: AppDimensions.FONT_SIZE_16,
                          textColor: AppColors.BLACK_COLOR,
                          fontFamily: Weights.medium),
                      subtitle: GetBuilder<OrderDetailController>(
                        builder: (context) {
                          return AppText(
                              text: 'pickUpfrom',
                              textColor: AppColors.DARK_GREY_COLOR.withOpacity(0.6),
                              fontSize: AppDimensions.FONT_SIZE_14);
                        }
                      ),
                    ),
                  ),
                  Divider(
                    color: AppColors.GREY_COLOR,
                    thickness: 1,
                  ),
                  Padding(
                    padding: AppPaddings.horizontal,
                    child: ListTile(
                      title: Padding(
                        padding: AppPaddings.vertical,
                        child: AppText(
                            text: 'orderDe',
                            fontSize: AppDimensions.FONT_SIZE_14,
                            textColor: AppColors.BLACK_COLOR,
                            fontWeight: FontWeights.semiBold,
                            fontFamily: Weights.light),
                      ),
                      subtitle: GetBuilder<OrderDetailController>(
                        builder: (context) {
                          return AppText(
                              text: 'Order# 19',
                              textColor: AppColors.BLACK_COLOR,
                              fontFamily: Weights.medium,
                              fontSize: AppDimensions.FONT_SIZE_18);
                        }
                      ),
                      trailing: Checkbox(
                        value: orderController.checkBox.value,
                        checkColor: AppColors.WHITE_COLOR,
                        side: BorderSide(color: AppColors.GREY_COLOR),
                        activeColor: AppColors.PRIMARY_COLOR,
                        onChanged: (value) {
                         // orderController.checkBox.value = value!;
                          orderController.showCheckBoxVal();
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.042,
                  ),
                  Padding(
                    padding: AppPaddings.defaultPadding,
                    child: AppButton(
                      buttonName: 'tickToContinueBtnTxt',
                      fontFamily: Weights.light,
                      buttonColor: orderController.checkBox.value
                          ? AppColors.BLUE_COLOR
                          : AppColors.DISABLE_COLOR,
                      textColor: orderController.checkBox.value
                          ? AppColors.WHITE_COLOR
                          : AppColors.LIGHT_GREY_COLOR,
                      buttonWidth: Get.width,
                      buttonRadius: BorderRadius.all(Radius.circular(10)),
                      onTap: () {
                      //  updateController.acceptOrder(box.read('userIDD'),context,3);
                        orderController.incrementMethod(context);
                      },
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                ],
              );
            })
          ]),
        ),
      ],
    );
  }
}
