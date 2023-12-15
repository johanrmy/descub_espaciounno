import 'package:flutter/material.dart';
import '../../util/colors.dart';

class BorderedContainer extends StatelessWidget {
  final double scanArea;

  const BorderedContainer({super.key, required this.scanArea});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(36.0)),
        border: Border.all(
          color: AppColors.primaryUNNO.withOpacity(0.40),
          width: scanArea * 0.211111,
        ),
      ),
      child: SizedBox(
        width: scanArea,
        height: scanArea,
      ),
    );
  }
}
