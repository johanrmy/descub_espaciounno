import 'dart:io';
import 'package:descub_espaciounno/data/data.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScanner extends StatefulWidget {
  final double scanArea;

  const QrScanner({Key? key, required this.scanArea}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewState();
}

class _QRViewState extends State<QrScanner> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  late Barcode? result;
  late QRViewController? controller;
  bool isDisposed = false;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller?.pauseCamera();
    } else if (Platform.isIOS) {
      controller?.resumeCamera();
    }
  }

  @override
  void initState() {
    super.initState();
    if (isDisposed) {
      isDisposed = false;
      controller?.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 5,
          child: QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
            overlay: QrScannerOverlayShape(
              borderColor: Colors.transparent,
              cutOutSize: widget.scanArea,
            ),
          ),
        ),
      ],
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });

      if (result != null && result!.code != null) {
        controller.pauseCamera();
        final Map<String, dynamic> muralData = muralPageJson;
        Navigator.pushNamed(context, '/navbar/mural', arguments: muralData)
            .then((_) {
              controller.resumeCamera();
        });
      }
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    isDisposed = true;
    super.dispose();
  }
}
