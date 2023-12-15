import 'package:descub_espaciounno/widgets/author/author_cards.dart';
import 'package:descub_espaciounno/widgets/author/author_info.dart';
import 'package:descub_espaciounno/widgets/author/author_profile.dart';
import 'package:descub_espaciounno/widgets/author/author_title.dart';
import 'package:flutter/material.dart';

import '../util/colors.dart';

class AuthorPage extends StatelessWidget {
  final Map<String, dynamic> data;

  const AuthorPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final authorData = data;
    final String nickname = authorData['nickname'];
    final List<String> imageUrls = authorData['imageUrls'];
    final String information = authorData['information'];
    final int nMurals = authorData['nMurals'];
    final List<String> usersSocialMedia = authorData['usersSocialMedia'];
    final String email = authorData['email'];
    final bool isPartner = authorData['isPartner'];

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