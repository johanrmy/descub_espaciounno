import 'package:flutter/cupertino.dart';

class CustomLogo extends StatelessWidget {
  final double width;
  final double height;

  const CustomLogo({super.key, this.width = 175, this.height = 225.13});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/logo.png',
      height: height,
      width: width,
    );
  }
}