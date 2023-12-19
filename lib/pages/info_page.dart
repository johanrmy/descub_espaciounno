import 'package:descub_espaciounno/util/colors.dart';
import 'package:descub_espaciounno/widgets/info/info_profile.dart';
import 'package:descub_espaciounno/widgets/info/info_text.dart';
import 'package:descub_espaciounno/widgets/info/info_title.dart';
import 'package:descub_espaciounno/widgets/menu/location_geo_button.dart';
import 'package:descub_espaciounno/widgets/menu/social_media_button.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    const InfoTitle(),
                    const InfoProfile(),
                    const InfoText(),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20.0),
                      height: 160,
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/logo_descub.png',
                          width: 120),
                          Icon(Icons.favorite, color: Colors.pink, size: 100),
                          Image.asset('assets/images/espacio_unno_logo.png',
                              width: 120)
                        ],
                      ),
                    ),
                    const Spacer(),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(bottom: 40.0),
                      decoration: BoxDecoration(
                        color: AppColors.appLight,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SocialMediaButton(username: "espaciounno", socialMedia: "instagram", urlIcon: "instagram_icon", color: AppColors.appDark,),
                          LocationGeoButton(latitude: -12.1493747, longitude: -77.0228592, urlIcon: "marker_icon", color: AppColors.appDark,),
                          SocialMediaButton(username: "espaciounno", socialMedia: "tiktok", urlIcon: "tiktok_icon", color: AppColors.appDark,),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
        )
    );
  }
}
