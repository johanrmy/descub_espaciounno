import 'package:flutter/cupertino.dart';
import '../../util/colors.dart';

class MenuBackground extends StatelessWidget {
  const MenuBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bg_menu.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        color: AppColors.appDarkS.withOpacity(0.8),
      ),
    );
  }
}