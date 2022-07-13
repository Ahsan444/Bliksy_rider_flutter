// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';

class AppPaddings {
  static const EdgeInsets defaultPadding = EdgeInsets.all(16);
  static const EdgeInsets topOnly = EdgeInsets.only(top: 16);
  static const EdgeInsets bottomOnly = EdgeInsets.only(bottom: 16);
  static const EdgeInsets leftOnly = EdgeInsets.only(left: 16);
  static const EdgeInsets rightOnly = EdgeInsets.only(right: 16);
  static const EdgeInsets vertical = EdgeInsets.symmetric(vertical: 16);
  static const EdgeInsets horizontal = EdgeInsets.symmetric(horizontal: 16);
  static const EdgeInsets maxHorizontal = EdgeInsets.symmetric(horizontal: 30);
}
