import 'package:descub_espaciounno/models/artist_model.dart';
import 'package:descub_espaciounno/models/mural_count.dart';
import 'package:descub_espaciounno/widgets/author/author_cards.dart';
import 'package:descub_espaciounno/widgets/author/author_info.dart';
import 'package:descub_espaciounno/widgets/author/author_profile.dart';
import 'package:descub_espaciounno/widgets/author/author_title.dart';
import 'package:flutter/material.dart';

import '../util/colors.dart';

class AuthorPage extends StatelessWidget {
  final Map<String, dynamic> artistDataFromApi;

  const AuthorPage({super.key, required this.artistDataFromApi});

  @override
  Widget build(BuildContext context) {
    final Artist artistData = artistDataFromApi['dataArtist'];
    final MuralCount muralCount = artistDataFromApi['dataArtistCount'];
    final String nickname = artistData.nickname;
    final List<String> imageUrls = [artistData.urlPhoto1, artistData.urlPhoto2, artistData.urlPhoto3];
    final String information = artistData.description;
    final int nMurals = muralCount.count;
    final List<String> usersSocialMedia = [artistData.userInstagram, artistData.userFacebook, artistData.userTiktok];
    final String email = artistData.email;
    final bool isPartner = artistData.isPartner;

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
                  AuthorTitle(nickname: nickname,),
                  AuthorProfile(imageUrls: imageUrls),
                  AuthorInfo(information: information),
                  AuthorCards(nMuralS: nMurals, usersSocialMedia: usersSocialMedia, email: email, isPartner: isPartner)
                ],
              ),
            ),
          )
      )
    );
  }
}