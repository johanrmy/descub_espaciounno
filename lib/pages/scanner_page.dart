import 'package:descub_espaciounno/util/colors.dart';
import 'package:descub_espaciounno/widgets/scanner/qr_scanner.dart';
import 'package:descub_espaciounno/widgets/scanner/scanner_background.dart';
import 'package:flutter/material.dart';

class ScannerPage extends StatelessWidget {
  const ScannerPage({super.key});

  @override
  Widget build(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
        MediaQuery.of(context).size.height < 400)
        ? 200.0
        : 270.0;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Scaffold(
            body: Container(
              decoration: const BoxDecoration(
                color: AppColors.appDark,
              ),
            ),
          ),
          QrScanner(scanArea: scanArea),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BorderedContainer(scanArea: scanArea),
                Container(
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(0.0),
                        topRight: Radius.circular(0.0),
                        bottomLeft: Radius.circular(8.0),
                        bottomRight: Radius.circular(8.0)
                    ),
                    color: AppColors.primaryUNNO.withOpacity(0.45)
                  ),
                  child:
                  Image.asset(
                    'assets/images/logo_descub.png',
                    height: 36,
                    width: 120,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
