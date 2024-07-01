import 'package:descub_espaciounno/services/send_email_service.dart';
import 'package:descub_espaciounno/services/social_media_service.dart';
import 'package:descub_espaciounno/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthorCards extends StatelessWidget {
  final double heightCard;
  final int nMuralS;
  final List<String> usersSocialMedia;
  final String email;
  final bool isPartner;

  const AuthorCards({
    Key? key,
    this.heightCard = 170.0, required this.nMuralS, required this.usersSocialMedia, required this.email, required this.isPartner,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Card(
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: heightCard,
                      child: Center(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: nMuralS.toString(),
                                style: const TextStyle(
                                  fontSize: 56,
                                  color: AppColors.primaryUNNO,
                                  fontFamily: 'Noto Sans',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const TextSpan(
                                text: ' murales registrados',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: AppColors.appDark,
                                  fontFamily: 'Noto Sans',
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Card(
                  elevation: 3,
                  child: SizedBox(
                    width: double.infinity,
                    height: heightCard,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () => openSocialMediaProfile(usersSocialMedia[0], 'instagram'),
                                child: SvgPicture.asset(
                                  'assets/images/instagram_color_icon.svg',
                                  width: 60,
                                  height: 60,
                                ),
                              ),
                              InkWell(
                                onTap: () => openSocialMediaProfile(usersSocialMedia[1], 'facebook'),
                                child: SvgPicture.asset(
                                  'assets/images/facebook_color_icon.svg',
                                  width: 60,
                                  height: 60,
                                ),
                              ),
                              InkWell(
                                onTap: () => openSocialMediaProfile(usersSocialMedia[2], 'tiktok'),
                                child: SvgPicture.asset(
                                  'assets/images/tiktok_color_icon.svg',
                                  width: 60,
                                  height: 60,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            height: 50,
                            child: OutlinedButton(
                              onPressed: () async {
                                bool isOpened = await sendEmail(email);
                                if (!isOpened) {
                                  const SnackBar(
                                    content: Text("No se pudo acceder al usuario"),
                                  );
                                }
                              },
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(color: AppColors.primaryUNNO),
                              ),
                              child: const Text(
                                "Contactar",
                                style: TextStyle(
                                  color: AppColors.primaryUNNO,
                                  fontSize: 16,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10.0),
          Expanded(
            flex: 2,
            child: Card(
              elevation: 3,
              child: SizedBox(
                width: double.infinity,
                height: heightCard * 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (isPartner)
                      Image.asset(
                        'assets/images/espacio_unno_logo.png',
                        width: heightCard * 0.9,
                        height: heightCard * 0.9,
                        fit: BoxFit.cover,
                      )
                    else
                      Image.asset(
                        'assets/images/artista_verificado.png',
                        width: heightCard * 0.9,
                        height: heightCard * 0.9,
                        fit: BoxFit.cover,
                      ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: [
                            if (isPartner)
                              const TextSpan(
                                text: 'Artista en colaboración con ',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: 'Noto Sans',
                                  color: AppColors.appDark,
                                ),
                              )
                            else
                              const TextSpan(
                                text: 'Artista verificado por ',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: 'Noto Sans',
                                  color: AppColors.appDark,
                                ),
                              ),
                            TextSpan(
                              text: isPartner ? 'espacio UNNO' : 'Descub',
                              style: const TextStyle(
                                fontSize: 20,
                                fontFamily: 'Noto Sans',
                                fontWeight: FontWeight.bold,
                                color: AppColors.appDark,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
