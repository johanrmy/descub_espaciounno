import 'package:descub_espaciounno/util/colors.dart';
import 'package:flutter/material.dart';

class MuralRewardButton extends StatelessWidget{
  final String buttonText;
  final VoidCallback onPressed;

  const MuralRewardButton({super.key, required this.buttonText, required this.onPressed});

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
              side: const BorderSide(
                color: AppColors.primaryUNNO,
              ),
              backgroundColor: AppColors.appLight,
              elevation: 5
            ),
            child: Text(
              buttonText,
              style: const TextStyle(
                fontSize: 16,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
                color: AppColors.primaryUNNO,
              ),
            ),
          ),
        )
    );
  }

}