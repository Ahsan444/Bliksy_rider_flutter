import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

 appLoader (BuildContext context, Color myColors) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        content: SizedBox(
          height: 100,
          width: 100,
          child: SpinKitThreeBounce(
            color: myColors,
            size: 50.0,
          ),
        ),
      ));

}