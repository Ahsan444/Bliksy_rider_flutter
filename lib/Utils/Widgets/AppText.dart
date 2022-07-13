import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget AppText(
    {required String text,
    Color textColor = Colors.black,
    TextDecoration underLine = TextDecoration.none,
    TextAlign textAlign = TextAlign.left,
     overflow,
      max,

    FontWeight fontWeight = FontWeight.w400,
    String fontFamily = "Avenir",
    double fontSize = 20}) {
  return Text(
    text.tr,
    maxLines: max,
    textAlign: textAlign,
    style: TextStyle(
      color: textColor,
      decoration: underLine,
      overflow: overflow,


      fontFamily: fontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight,
    ),
  );
}
