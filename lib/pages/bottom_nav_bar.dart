import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home_screen.dart';
import 'scanner_page.dart';
import 'profile_screen.dart';
import 'package:descub_espaciounno/util/colors.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  BottomNavBarState createState() => BottomNavBarState();
}

class BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = [
    const HomeScreen(),
    const ScannerPage(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
          systemNavigationBarColor: AppColors.appLightS,
          statusBarColor: AppColors.appDarkS.withOpacity(0.15),
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light
      ),
      child: Scaffold(
        appBar: null,
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.map_rounded),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.camera_alt_rounded),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.article_rounded),
              label: '',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: AppColors.primaryUNNO,
          onTap: _onItemTapped,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          iconSize: 42,
          elevation: 10,
          backgroundColor: AppColors.appLightS,
        ),
      ),
    );
  }
}
