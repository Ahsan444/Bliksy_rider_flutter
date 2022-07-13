import 'package:flutter/material.dart';

class AppCircleImageButton extends StatelessWidget {
  final Color iconColor;
  final Color buttonColor;
  final double height;
  final double width;
  final double padding;
  final String imageUrl;
  final VoidCallback onTap;
  const AppCircleImageButton(
      {Key? key,
        this.buttonColor = const Color(0xffE5E5E5),
        this.height = 36,
        this.width = 36,
        required this.imageUrl,
        required this.onTap,
        required this.iconColor, this.padding=5})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(color: buttonColor, shape: BoxShape.circle),
        child: Padding(
            padding:  EdgeInsets.all(padding),
            child: Image(
              image: AssetImage(imageUrl),
              color: iconColor,
            )),
      ),
    );
  }
}