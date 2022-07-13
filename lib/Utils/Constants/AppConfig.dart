import 'package:flutter/material.dart';

class AppConfig {
  BuildContext context;
  double height = 0;
  double width = 0;
  AppConfig(this.context) {
    MediaQueryData _queryData = MediaQuery.of(context);
    height = _queryData.size.height;
    width = _queryData.size.width;
  }
}