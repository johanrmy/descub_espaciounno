import 'dart:io';
import 'package:descub_espaciounno/models/mural_count.dart';
import 'package:descub_espaciounno/models/nearby_location_model.dart';
import 'package:descub_espaciounno/models/scan_model.dart';
import 'package:descub_espaciounno/services/current_location_service.dart';
import 'package:descub_espaciounno/services/device_info_service.dart';
import 'package:descub_espaciounno/services/api_service.dart';
import 'package:descub_espaciounno/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScanner extends StatefulWidget {
  final double scanArea;

  const QrScanner({Key? key, required this.scanArea}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewState();
}

class _QRViewState extends State<QrScanner> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  bool isDisposed = false;
  Position? _currentPosition;
  Map<String, dynamic> data = {};
  String deviceModel = 'unknown';
  String deviceBrand = 'unknown';

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
    _getDeviceInfo();
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

    controller.scannedDataStream.listen((scanData) async {
      setState(() {
        result = scanData;
      });

      if (result != null && result!.code != null) {
        controller.pauseCamera();
        final apiUrl = result!.code;
        try {
          final newPosition = await LocationService.determinePosition();

          setState(() {
            _currentPosition = newPosition;
          });
          print(_currentPosition!.latitude);
          print(_currentPosition!.longitude);

          try {
            NearbyLocation dataFromApi1 = await ApiService.fetchData(apiUrl!, _currentPosition!.latitude, _currentPosition!.longitude);
            MuralCount dataFromApi2 = await ApiService.getMuralCount(apiUrl, dataFromApi1.artist.nickname);

            Scan scan = Scan(partnershipId: dataFromApi1.partnership.id, model: deviceModel, brand: deviceBrand);

            data['nearbyLocation'] = dataFromApi1;
            data['count'] = dataFromApi2;
            data['setScan'] = scan;
            data['apiUrl'] = apiUrl;

            if (!context.mounted) return;
            Navigator.pushNamed(context, '/navbar/mural', arguments: data).then((_) {
              controller.resumeCamera();
            });
          } catch (e) {
            print('Error fetching data from API: $e');
            _handleApiError(context, controller);
          }
        } catch (e) {
          print('Error determining position: $e');
          _handleApiError(context, controller);
        }
      }
    });
  }

  void _handleApiError(BuildContext context, QRViewController? controller) {
    Map<String, dynamic> info = {
      'message': 'Al parecer no hay asociaciones cerca o el código QR es inválido :(',
      'background': AppColors.appLightS,
      'colortext': AppColors.primaryDescub
    };
    Navigator.pushNamed(context, '/navbar/notFound', arguments: info).then((_) {
      controller?.resumeCamera();
    });
  }

  Future<void> _getDeviceInfo() async {
    deviceModel = await DeviceInfoService.getDeviceModel();
    deviceBrand = await DeviceInfoService.getDeviceBrand();
  }

  @override
  void dispose() {
    controller?.dispose();
    isDisposed = true;
    super.dispose();
  }
}
