import 'package:descub_espaciounno/pages/author_page.dart';
import 'package:descub_espaciounno/pages/menu_page.dart';
import 'package:flutter/material.dart';
import 'package:descub_espaciounno/pages/bottom_nav_bar.dart';
import 'package:descub_espaciounno/pages/mural_page.dart';

class Routes {
  static const String home = '/';
  static const String bottomNavBar = '/navbar';
  static const String mural = '/navbar/mural';
  static const String author = '/navbar/mural/author';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const MenuPage());
      case bottomNavBar:
        return MaterialPageRoute(builder: (_) => const BottomNavBar());
      case mural:
        return MaterialPageRoute(builder: (_) => MuralPage(qrCodeValue: settings.arguments as Map<String, dynamic>));
      case author:
        return MaterialPageRoute(builder: (_) => AuthorPage(data: settings.arguments as Map<String, dynamic>));
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('Ruta desconocida: ${settings.name}'),
            ),
          ),
        );
    }
  }
}
