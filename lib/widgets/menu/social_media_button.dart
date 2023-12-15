import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../services/social_media_service.dart';

class SocialMediaButton extends StatelessWidget {
  final String username;
  final String socialMedia;
  final String urlIcon;
  final double svgHeight;
  final double svgWidth;
  final double Width;
  final double Height;
  final double padding;

  const SocialMediaButton({super.key,
    required this.username,
    required this.socialMedia,
    required this.urlIcon,
    this.svgHeight = 60.0,
    this.svgWidth = 60.0,
    this.padding = 10.0,
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
        bool isOpened = await openSocialMediaProfile(username, socialMedia);
        if (!isOpened) {
          const SnackBar(
            content: Text("No se pudo acceder al usuario"),
          );
        }
      },
    );
  }
}