import 'package:flutter/material.dart';
import 'package:descub_espaciounno/models/artist_model.dart';
import 'package:descub_espaciounno/models/mural_count.dart';
import 'package:descub_espaciounno/models/nearby_location_model.dart';
import 'package:descub_espaciounno/models/scan_model.dart';
import 'package:descub_espaciounno/util/colors.dart';
import 'package:descub_espaciounno/services/api_service.dart';
import 'package:descub_espaciounno/widgets/mural/carousel_slider.dart';
import 'package:descub_espaciounno/widgets/mural/mural_colors.dart';
import 'package:descub_espaciounno/widgets/mural/mural_info.dart';
import 'package:descub_espaciounno/widgets/general/custom_button.dart';

class MuralPage extends StatefulWidget {
  final Map<String, dynamic> dataFromApi;

  const MuralPage({Key? key, required this.dataFromApi}) : super(key: key);

  @override
  MuralPageState createState() => MuralPageState();
}

class MuralPageState extends State<MuralPage> {
  Future<void> sendScanDataToApi() async {
    try {
      String apiUrl = widget.dataFromApi['apiUrl'];
      Scan scanData = widget.dataFromApi['setScan'];

      await ApiService.postDataScan(apiUrl, scanData);

    } catch (e) {
      print('Error sending scan data: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    sendScanDataToApi();
  }

  @override
  Widget build(BuildContext context) {
    final NearbyLocation muralData = widget.dataFromApi['nearbyLocation'];
    final List<String> images = [muralData.mural.urlPhoto1, muralData.mural.urlPhoto2, muralData.mural.urlPhoto3];
    final String title = muralData.mural.name;
    final String description = muralData.mural.description;
    final String date = muralData.mural.creationDate;
    final List<String> colors = muralData.mural.colors;
    final Artist artist = muralData.artist;
    final MuralCount muralCount = widget.dataFromApi['count'];
    final String apiUrl = widget.dataFromApi['apiUrl'];


    double screenHeight = MediaQuery.of(context).size.width - 50;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appLight,
        elevation: 0,
        foregroundColor: AppColors.appDark,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: AppColors.appLight,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CarouselMural(size: screenHeight, urlImgs: images ),
                MuralInfo(
                  title: title,
                  description:
                  description,
                  author: artist.name,
                  muralDate: date,
                  artistData: artist,
                  muralCount: muralCount,
                ),
                MuralColors(
                  hexColors: colors,
                ),
                const Spacer(),
                CustomButton(buttonText: "Obtener Recompensa",color: AppColors.primaryUNNO ,
                    onPressed: () {
                  Navigator.pushReplacementNamed(context, '/coupon', arguments: apiUrl);
                }),
                const Spacer()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
