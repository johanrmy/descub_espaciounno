import 'package:descub_espaciounno/util/colors.dart';
import 'package:descub_espaciounno/widgets/info/acerca_de_section.dart';
import 'package:descub_espaciounno/widgets/info/explora_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
          systemNavigationBarColor: AppColors.appLightS,
          statusBarColor: AppColors.primaryUNNO,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light
      ),
      child: Scaffold(
        backgroundColor: AppColors.appLightS,
        appBar: AppBar(
          backgroundColor: AppColors.primaryUNNO,
          elevation: 3,
          toolbarHeight: 100.00,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RichText(
                text: const TextSpan(
                  text: 'espacio ',
                  style: TextStyle(
                      color: AppColors.appLight,
                      fontSize: 14.0,
                      fontFamily: 'Noto Sans'
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'UNNO',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.appLight,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
              Image.asset('assets/images/espacio_unno_logo_light.png',
                  width: 100)
            ],
          ),
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: _currentIndex == 0 ? AppColors.primaryUNNO : Colors.transparent,
                        width: 2.0,
                      ),
                    ),
                  ),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        _currentIndex = 0;
                      });
                    },
                    style: TextButton.styleFrom(
                      primary: _currentIndex == 0 ? Colors.black : Colors.grey,
                      textStyle: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    child: const Text('Explora', style: TextStyle(fontSize: 18.0)),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: _currentIndex == 1 ? AppColors.primaryUNNO : Colors.transparent,
                        width: 2.0,
                      ),
                    ),
                  ),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        _currentIndex = 1;
                      });
                    },
                    style: TextButton.styleFrom(
                      primary: _currentIndex == 1 ? Colors.black : Colors.grey,
                      textStyle: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    child: const Text('Acerca de', style: TextStyle(fontSize: 18.0)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15.0),
            Expanded(
              child: IndexedStack(
                index: _currentIndex,
                children: const [
                  ExploraSection(),
                  AcercaDeSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}