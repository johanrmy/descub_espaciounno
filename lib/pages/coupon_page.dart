import 'package:descub_espaciounno/pages/not_found_page.dart';
import 'package:descub_espaciounno/util/colors.dart';
import 'package:descub_espaciounno/services/api_service.dart';
import 'package:descub_espaciounno/models/coupon_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:screenshot/screenshot.dart';

class CouponPage extends StatefulWidget {
  final String inputDataFromApi;

  const CouponPage({super.key, required this.inputDataFromApi});

  @override
  CouponPageState createState() => CouponPageState();
}

class CouponPageState extends State<CouponPage> {
  Coupon? _coupon;
  bool _loading = true;
  ScreenshotController screenshotController = ScreenshotController();

  Future<void> getCouponDataFromApi() async {
    try {
      String apiUrl = widget.inputDataFromApi;

      final coupon = await ApiService.getCoupon(apiUrl);

      setState(() {
        _coupon = coupon;
        _loading = false;
      });
    } catch (e) {
      print('Error obtaining coupon data: $e');
      setState(() {
        _coupon = null;
        _loading = false;
      });
    }
  }

  SaveToGallery(){
    screenshotController.capture().then((Uint8List? image){
      SaveScreenshotGallery(image!);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
          content: Text("Cupón guardado en la galería"),
      )
    );
  }

  SaveScreenshotGallery(Uint8List bytes)async{
    String id = _coupon!.id;
    await ImageGallerySaver.saveImage(bytes, name: 'espaciounnoCP$id');
  }

  @override
  void initState() {
    super.initState();
    getCouponDataFromApi();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.primaryUNNO,
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Screenshot(
        controller: screenshotController,
        child: Scaffold(
          backgroundColor: AppColors.primaryUNNO,
          body: _buildContent(),
        ),
      )
    );
  }

  Widget _buildContent() {
    if (_loading) {
      return _buildLoadingContent();
    } else if (_coupon != null) {
      return _buildCouponContent();
    } else {
      Map<String, dynamic> info = {'message': 'Al paracer no hay cupones activos o tuvimos un problema con la red :(', 'background': AppColors.secondaryDescub, 'colortext': AppColors.appDark};
      return NotFoundPage(info: info);
    }
  }

  Widget _buildLoadingContent() {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.primaryDescub,
      ),
    );
  }

  Widget _buildCouponContent() {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: const EdgeInsets.only(top: 100.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo_descub.png',
                  width: 150,
                ),
                Image.asset(
                  'assets/images/espacio_unno_logo_light.png',
                  width: 120,
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${(double.parse(_coupon!.discount) * 100).round()}%',
                style: const TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  fontSize: 128,
                  color: AppColors.appLight,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                margin: const EdgeInsets.only(bottom: 150.0),
                child: const Text(
                  'de descuento en productos seleccionados',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                    color: AppColors.appLight,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: const EdgeInsets.only(bottom: 130.0),
            child: BarcodeWidget(
              barcode: Barcode.code128(),
              data: _coupon!.id,
              width: 300,
              height: 110,
              style: const TextStyle(fontSize: 24, color: AppColors.secondaryDescub),
              color: AppColors.appLightS,
            ),
          )
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width*0.9,
            height: MediaQuery.of(context).size.height*0.9,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.secondaryDescub,
                width: 3.0,
              ),
            ),
          ),
        ),
        Align(
            alignment: Alignment.bottomRight,
            child: Container(
                margin: const EdgeInsets.only(bottom: 60.0, right: 40.0),
                child: IconButton(
                  icon: const Icon(
                    Icons.download,
                    size: 40,
                    color: AppColors.secondaryDescub,
                  ),
                  onPressed: () {
                    SaveToGallery();
                  },
                )
            )
        ),
      ],
    );
  }
}
