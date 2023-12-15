import 'package:descub_espaciounno/util/colors.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: null,
      backgroundColor: AppColors.primaryUNNO,
      body: Center(
        child: Text('Contenido de la pantalla de coupon', style: TextStyle(color: AppColors.appLight)),
      ),
    );
  }
}
