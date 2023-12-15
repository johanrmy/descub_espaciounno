import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'bottom_nav_bar.dart';
import '../util/colors.dart';
import '../widgets/general/customLogo.dart';
import '../widgets/general/titleApp.dart';
import '../widgets/menu/menu_background.dart';
import '../widgets/menu/menu_redirect_button.dart';
import '../widgets/menu/social_media_button.dart';
import '../widgets/menu/location_geo_button.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.appDark,
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light
      ),
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            const MenuBackground(),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: const EdgeInsets.only(top: 65),
                padding: const EdgeInsets.only(top: 5),
                width: MediaQuery.of(context).size.width * 0.80,
                child: const TitleApp(
                  text: "Encuentra murales en colaboración con",
                  fontSize: 48,
                  fontColor: AppColors.appLight,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 100),
                      child: const CustomLogo(),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(top: 60),
                      decoration: BoxDecoration(
                        color: AppColors.appLightS.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 8,
                            blurRadius: 8,
                            offset: const Offset(4, 8),
                          ),
                        ],
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SocialMediaButton(username: "espaciounno", socialMedia: "instagram", urlIcon: "instagram_icon"),
                          LocationGeoButton(latitude: -12.1493747, longitude: -77.0228592, urlIcon: "marker_icon"),
                          SocialMediaButton(username: "espaciounno", socialMedia: "tiktok", urlIcon: "tiktok_icon"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                width: 150,
                height: 40,
                margin: const EdgeInsets.only(bottom: 70, right: 45),
                child: ButtonRedirect(
                  text: 'Descubre',
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const BottomNavBar()),
                          (Route<dynamic> route) => false,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
