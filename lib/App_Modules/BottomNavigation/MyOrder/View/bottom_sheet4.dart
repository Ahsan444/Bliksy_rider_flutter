import 'package:bliksy/App_Modules/dashboard_screen.dart';
import 'package:bliksy/Utils/Fonts/AppDimensions.dart';
import 'package:bliksy/Utils/Fonts/AppFonts.dart';
import 'package:bliksy/Utils/Paddings/AppPaddings.dart';
import 'package:bliksy/Utils/Themes/AppColors.dart';
import 'package:bliksy/Utils/Widgets/AppText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../../../Utils/Widgets/AppButton.dart';
import '../ViewController/order_screen.dart';

class BottomSheet4 extends StatelessWidget {
  const BottomSheet4({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: AppColors.WHITE_COLOR,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: AppPaddings.defaultPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  AppText(
                      text: 'rateYourExp',
                      fontSize: AppDimensions.FONT_SIZE_16,
                      fontFamily: Weights.medium),
                  RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: AppPaddings.defaultPadding,
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 0, bottom: 16),
              child: Column(
                children: [
                  TextField(
                    cursorColor: AppColors.DARK_GREY_COLOR,
                    decoration: InputDecoration(
                      contentPadding: AppPaddings.defaultPadding,
                      fillColor: Colors.white,
                      hintText: 'tapAddReview'.tr,
                      hintStyle: TextStyle(
                          fontFamily: Weights.medium,
                          color: AppColors.LIGHT_GREY_COLOR,
                          fontSize: AppDimensions.FONT_SIZE_12),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: AppColors.TEXT_FIELD_COLOR,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: AppColors.TEXT_FIELD_COLOR,
                          width: 0.7,
                        ),
                      ),
                    ),
                    maxLines: 6,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Get.height * 0.1,
            ),
            Padding(
              padding: AppPaddings.defaultPadding,
              child: AppButton(
                buttonName: 'addYourReviwe',
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DashboardScreen()));
                  orderController..showAppBar(false);
                },
              ),
            )
          ]),
        ),
      ],
    );
  }
}
