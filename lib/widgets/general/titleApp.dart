import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitleApp extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color fontColor;
  final String fontFamily;
  final FontWeight fontWeight;
  final double fontHeight;

  const TitleApp({super.key,
    required this.text,
    required this.fontSize,
    required this.fontColor,
    this.fontFamily = 'Roboto',
    this.fontWeight = FontWeight.w500,
    this.fontHeight = 1.2
  });

  @override
  Widget build(BuildContext context) {
    return Text(
        text,
        style: TextStyle(
            fontSize: fontSize,
            color: fontColor,
            fontFamily: fontFamily,
            fontWeight: fontWeight,
            height: fontHeight
        ),
        textAlign: TextAlign.left,
      );
  }
}