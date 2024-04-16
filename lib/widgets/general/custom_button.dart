import 'dart:ffi';

import 'package:descub_espaciounno/util/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget{
  final String buttonText;
  final VoidCallback onPressed;
  final Color color;
  final double size;
  final Color background;

  const CustomButton({super.key, required this.buttonText, required this.onPressed, this.color = AppColors.appDark, this.size = 16.00, this.background = AppColors.appLight});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width*0.15,
          child: OutlinedButton(
            onPressed: onPressed,
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              backgroundColor: background,
              elevation: 5
            ),
            child: Text(
              buttonText,
              style: TextStyle(
                fontSize: size,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
                color: color,
              ),
            ),
          ),
        )
    );}
  }