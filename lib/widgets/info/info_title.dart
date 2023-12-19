import 'package:flutter/cupertino.dart';
import '../../util/colors.dart';

class InfoTitle extends StatelessWidget {

  const InfoTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: const Text(
        'Somos Espacio UNNO :D',
        textAlign: TextAlign.start,
        style: TextStyle(
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
          color: AppColors.appDark,
          fontSize: 32,
        ),
      ),
    );
  }
}
