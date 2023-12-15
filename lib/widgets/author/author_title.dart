import 'package:flutter/cupertino.dart';

import '../../util/colors.dart';

class AuthorTitle extends StatelessWidget {
  final String nickname;

  const AuthorTitle({
    Key? key,
    required this.nickname,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        nickname,
        textAlign: TextAlign.start,
        style: const TextStyle(
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
          color: AppColors.appDark,
          fontSize: 32,
        ),
      ),
    );
  }
}
