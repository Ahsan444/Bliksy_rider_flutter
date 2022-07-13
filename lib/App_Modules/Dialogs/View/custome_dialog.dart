import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../Utils/Fonts/AppDimensions.dart';
import '../../../Utils/Fonts/AppFonts.dart';
import '../../../Utils/Themes/AppColors.dart';
import '../../../Utils/Widgets/AppText.dart';

class MyDialog extends StatelessWidget {
  final String? title, subTitle, filledButtonText, secondButtonText, imagePath;
  final bool isShow;
 final VoidCallback? btnOneFunction;
  final VoidCallback? btnTwoFunction;

  const MyDialog(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.filledButtonText,
      required this.secondButtonText,
      required this.imagePath,
      this.isShow = false,
      this.btnOneFunction,
      this.btnTwoFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
        insetPadding:
            EdgeInsets.symmetric(horizontal: 40, vertical: Get.height / 4),
        child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                     Positioned(
                            right: -2,
                            top: -1,
                            child: InkWell(
                              child: Container(
                                decoration:
                                    const BoxDecoration(shape: BoxShape.circle),
                                height: 24,
                                width: 24,
                                child: const Icon(
                                  Icons.cancel,
                                  color: Color(0xfff0cd95),
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(
                            imagePath ?? 'assets/images/cancelPopup.svg'),
                        const SizedBox(
                          height: 10,
                        ),
                        AppText(
                            text: title ?? 'Are you sure want\nto cancel?',
                            fontSize: AppDimensions.FONT_SIZE_18,
                            fontWeight: FontWeights.semiBold,
                            textAlign: TextAlign.center),
                        const SizedBox(
                          height: 5,
                        ),
                        AppText(
                            text: subTitle ??
                                'If you cancel 5 minutes after requesting\na fee may apply',
                            fontSize: AppDimensions.FONT_SIZE_12,
                            fontWeight: FontWeights.regular,
                            textAlign: TextAlign.center,
                            textColor: AppColors.GREY_COLOR),
                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                            onPressed: btnOneFunction,
                            style: ElevatedButton.styleFrom(
                              primary: AppColors.PRIMARY_COLOR,
                              minimumSize: Size(300, 40),
                            ),
                            child: AppText(
                                text: filledButtonText ?? 'Cancel Order',
                                fontSize: AppDimensions.FONT_SIZE_16,
                                fontWeight: FontWeights.medium,
                                textAlign: TextAlign.center,
                                textColor: AppColors.WHITE_COLOR)),
                        const SizedBox(height: 10),
                        isShow
                            ? ElevatedButton(
                                onPressed: btnTwoFunction,
                                style: ElevatedButton.styleFrom(
                                    side: BorderSide(
                                        color: AppColors.PRIMARY_COLOR),
                                    minimumSize: Size(300, 40),
                                    primary: AppColors.TRANSPARENT_COLOR,
                                    elevation: 0,
                                    shadowColor: AppColors.PRIMARY_COLOR),
                                child: AppText(
                                    text: secondButtonText ??
                                        'Call to Customer Care',
                                    fontSize: AppDimensions.FONT_SIZE_12,
                                    fontWeight: FontWeights.medium,
                                    textColor: AppColors.PRIMARY_COLOR,
                                    underLine: isShow
                                        ? TextDecoration.none
                                        : TextDecoration.underline),
                              )
                            : Container(),
                      ],
                    ),
                  ],
                ),
              ],
            )));
  }
}

