import 'package:bliksy/Utils/Fonts/AppDimensions.dart';
import 'package:bliksy/Utils/Paddings/AppPaddings.dart';
import 'package:bliksy/Utils/Themes/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../Utils/Fonts/AppFonts.dart';
import '../../../Utils/Widgets/AppText.dart';

Widget textField(TextEditingController controller, String lable,hintText,
    {bool isShow = false,var inputType}) {
  return TextField(
    controller: controller,
    cursorColor: Colors.black,
    keyboardType: inputType,
    decoration: InputDecoration(
      hintText: hintText,

      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
      ),
      suffixIcon: isShow
          ? IconButton(
              icon: Icon(
                Icons.highlight_remove,
                color: AppColors.GREY_COLOR,
              ),
              onPressed: () {
                //remove func
              },
            )
          : const SizedBox.shrink(),
    ),
  );
}



Widget textFields(TextEditingController controller, String title,hintText,

{bool isShow = false,var inputType,image,double? height,double? width,double? imgHeight,bool isReadOnly = false,VoidCallback? onTap}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          AppText(text: title,textColor: AppColors.BLACK_COLOR,
            fontSize: AppDimensions.FONT_SIZE_14,),
          SizedBox(width: Get.width *0.015,),
          Column(
            children: [
              AppText(text: '*',textColor: AppColors.RED_COLOR),
              SizedBox(height: Get.height * 0.01,),
            ],
          ),

        ],
      ),
      TextField(
        cursorColor: AppColors.DARK_GREY_COLOR,
        readOnly: isReadOnly?true:false,
        controller: controller,
        onTap:  onTap,
        decoration: InputDecoration(
          contentPadding: AppPaddings.defaultPadding,
          prefixIcon: Image.asset(image,scale: imgHeight??5,color: AppColors.LIGHT_GREY_COLOR,),
          fillColor: Colors.white,
          hintText: hintText,
          hintStyle: TextStyle(color: AppColors.LIGHT_GREY_COLOR,
              fontFamily: Weights.bold),
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
      ),
    ],
  );
}

//lable text

/*
AppText(
text: lable,
fontSize: AppDimensions.FONT_SIZE_14,
textColor: AppColors.BLACK_COLOR,
),*/

// Icon(Icons.person_rounded,color: AppColors.DARK_GREY_COLOR,)