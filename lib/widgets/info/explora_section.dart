import 'package:carousel_slider/carousel_slider.dart';
import 'package:descub_espaciounno/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:descub_espaciounno/widgets/menu/social_media_button.dart';
import 'package:descub_espaciounno/widgets/menu/location_geo_button.dart';

class ExploraSection extends StatefulWidget {
  const ExploraSection({super.key});

  @override
  _ExploraSectionState createState() => _ExploraSectionState();
}

class _ExploraSectionState extends State<ExploraSection> {
  List<Map<String, dynamic>> imageData = [
    {
      'imageUrl':
          'https://descub-espaciounno.s3.amazonaws.com/artist/store/espaciounno_area1.jpg',
      'text': 'Apoya el arte local. Conoce espacio UNNO',
    },
    {
      'imageUrl':
          'https://descub-espaciounno.s3.amazonaws.com/artist/store/espaciounno_area2.jpg',
      'text': 'Cientos de productos hecho por artistas',
    },
    {
      'imageUrl':
          'https://descub-espaciounno.s3.amazonaws.com/artist/store/espaciounno_area3.jpg',
      'text': 'Ahora espacio UNNO en Cusco',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topCenter,
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05),
          height: MediaQuery.of(context).size.height * 0.55,
          decoration: BoxDecoration(
            color: AppColors.appPowder,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Material(
            elevation: 2.0,
            borderRadius: BorderRadius.circular(10),
            color: AppColors.appPowder,
            child: CarouselSlider(
              options: CarouselOptions(
                  height: MediaQuery.of(context).size.height * 0.55,
                  viewportFraction: 1.0,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  autoPlayAnimationDuration:
                      const Duration(milliseconds: 3000)),
              items: imageData.map((data) {
                return Builder(
                  builder: (BuildContext context) {
                    return Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.4,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            child: Image.network(
                              data['imageUrl'],
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.4,
                              fit: BoxFit.cover,
                              loadingBuilder: (BuildContext context,
                                  Widget child,
                                  ImageChunkEvent? loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.primaryDescub,
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                        : null,
                                  ),
                                );
                              },
                              frameBuilder: (BuildContext context, Widget child,
                                  int? frame, bool wasSynchronouslyLoaded) {
                                if (wasSynchronouslyLoaded) return child;
                                return AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 300),
                                  child: child,
                                );
                              },
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(12.0),
                          height: MediaQuery.of(context).size.height * 0.15,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10)),
                            color: AppColors.appPowder,
                          ),
                          child: Text(
                            data['text'],
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              color: AppColors.appDarkS,
                              fontSize: 34,
                              fontFamily: 'Noto Sans',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              }).toList(),
            ),
          ),
        ),
        Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
                vertical: 10
            ),
            height: MediaQuery.of(context).size.height * 0.1,
            decoration: BoxDecoration(
              color: AppColors.appPowder,
              borderRadius: BorderRadius.circular(10),
            ),
          child: Material(
            elevation: 2.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.1,
              decoration: BoxDecoration(
                color: AppColors.appPowder,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SocialMediaButton(username: "espaciounno", socialMedia: "instagram", urlIcon: "instagram_icon", color: AppColors.primaryUNNO),
                  LocationGeoButton(latitude: -12.1493747, longitude: -77.0228592, urlIcon: "marker_icon", color: AppColors.primaryDescub),
                  SocialMediaButton(username: "espaciounno", socialMedia: "tiktok", urlIcon: "tiktok_icon", color: AppColors.primaryUNNO),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
