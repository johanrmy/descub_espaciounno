import 'package:descub_espaciounno/services/location_geo_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LocationGeoButton extends StatelessWidget {
  final double latitude;
  final double longitude;
  final String urlIcon;
  final double svgHeight;
  final double svgWidth;
  final double Width;
  final double Height;
  final double padding;

  const LocationGeoButton({super.key,
    required this.latitude,
    required this.longitude,
    required this.urlIcon,
    this.svgHeight = 80.0,
    this.svgWidth = 80.0,
    this.padding = 0,
    this.Width = 50.0,
    this.Height = 50.0,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          minimumSize: Size(Width, Height),
          padding: EdgeInsets.all(padding),
          shadowColor: Colors.transparent
      ),
      child: ColorFiltered(
        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcATop),
        child: SvgPicture.asset(
          'assets/images/$urlIcon.svg',
          height: svgHeight,
          width: svgWidth,
        ),
      ),
      onPressed: () async {
        bool isOpened = await openLocationGeo(latitude, longitude);
        if (!isOpened) {
          const SnackBar(
            content: Text("No se pudo acceder al usuario"),
          );
        }
      },
    );
  }
}