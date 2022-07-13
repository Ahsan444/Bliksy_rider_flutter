import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Fonts/AppFonts.dart';
import 'AppText.dart';

Widget appBarWidget({
  required String title,
   VoidCallback? prefixOnTap,
  bool isCenter = false,
  Icon? icon
}) {
  return Column(
    children: [
      Container(
        width: Get.width,
        height: Get.height / 8,
        child: Column(
          children: [
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap:prefixOnTap??(){},
                    child: Icon(
                      Icons.arrow_back_sharp,
                      color: Colors.black,
                    ),
                  ),
                  isCenter
                      ? Spacer()
                      : SizedBox(
                          width: 16,
                        ),
                  Center(
                    child: AppText(text: title,fontSize: 21,fontWeight: FontWeights.semiBold),
                  ),
                  Spacer(),
                icon ??  Icon(
                    Icons.arrow_back_sharp,
                    color: Colors.transparent,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      Divider(
        height: 0,
      ),
    ],
  );
}
