import 'package:descub_espaciounno/util/colors.dart';
import 'package:flutter/material.dart';
import '../widgets/mural/carousel_slider.dart';
import '../widgets/mural/mural_colors.dart';
import '../widgets/mural/mural_info.dart';
import '../widgets/mural/mural_reward_button.dart';

class MuralPage extends StatefulWidget {
  final Map<String, dynamic> qrCodeValue;

  const MuralPage({Key? key, required this.qrCodeValue}) : super(key: key);

  @override
  MuralPageState createState() => MuralPageState();
}

class MuralPageState extends State<MuralPage> {
  @override
  Widget build(BuildContext context) {
    final muraldata = widget.qrCodeValue;
    final List<String> images = muraldata['muralImages'];
    final String title = muraldata['muralTitle'];
    final String description = muraldata['muralDescription'];
    final String date = muraldata['muralDate'];
    final Map<String, dynamic> author = muraldata['author'];
    final List<String> colors = muraldata['muralColors'];

    double screenHeight = MediaQuery.of(context).size.width - 50;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appLight,
        elevation: 0,
        foregroundColor: AppColors.appDark,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
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
                  author: author['nickname'],
                  muralDate: date,
                  authorInfo: author,
                ),
                MuralColors(
                  hexColors: colors,
                ),
                const Spacer(),
                MuralRewardButton(buttonText: "Obtener Recompensa", onPressed: () {}),
                const Spacer()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
