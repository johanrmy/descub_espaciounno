import 'package:descub_espaciounno/util/colors.dart';
import 'package:descub_espaciounno/widgets/general/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NotFoundPage extends StatelessWidget {
  final Map<String,dynamic> info;
  const NotFoundPage({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    final Color background = info['background'];
    final String message = info['message'];
    return AnnotatedRegion(
        value: SystemUiOverlayStyle(
            systemNavigationBarColor: background,
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.light
        ),
        child: Scaffold(
          backgroundColor: background,
          body: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.80,
                  margin: const EdgeInsets.only(top: 100.0),
                  child: Image.asset(
                      'assets/images/notfound.png',
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.80,
                  margin: const EdgeInsets.only(top: 100.0),
                  child: Text(
                    message,
                    style: const TextStyle(
                      color: AppColors.appLightS,
                      fontFamily: 'Noto Sans',
                      fontSize: 20.0,
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
              Align(

                alignment: Alignment.bottomCenter,
                child: Container(
                    margin: const EdgeInsets.only(bottom: 60),
                    child: CustomButton(buttonText: "Seguir descubriendo", onPressed: (){
                      Navigator.pop(context);
                    })
                ),
              )
            ],
          ),
        )
       );
  }
}