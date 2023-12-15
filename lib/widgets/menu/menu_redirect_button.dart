import 'package:descub_espaciounno/util/colors.dart';
import 'package:flutter/material.dart';

class ButtonRedirect extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onPressed;
  final double fontSize;
  final FontWeight fontWeight;
  final double elevation;
  final BorderRadius borderRadius;

  const ButtonRedirect({super.key,
    required this.text,
    required this.onPressed,
    this.color = AppColors.primaryDescub,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w500,
    this.elevation = 5,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: AppColors.appLight,
          fontSize: fontSize,
          fontFamily: 'Roboto',
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}