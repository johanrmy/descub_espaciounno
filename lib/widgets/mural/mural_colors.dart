import 'package:descub_espaciounno/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MuralColors extends StatelessWidget {
  final List<String> hexColors;

  const MuralColors({Key? key, required this.hexColors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          hexColors.length,
              (index) {
            Color color = _hexToColor(hexColors[index]);
            return GestureDetector(
              onTap: () {
                _copyToClipboard(hexColors[index]);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Color ${hexColors[index]} copiado al portapapeless',
                      style: const TextStyle(color: AppColors.appDark),
                    ),
                    duration: const Duration(milliseconds: 1500),
                    backgroundColor: AppColors.secondaryDescub,
                  ),
                );
              },
              child: Container(
                height: 60,
                width: 60,
                margin: const EdgeInsets.only(right: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: color,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.appDark.withOpacity(0.25),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(2, 1),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Color _hexToColor(String hexColor) {
    return Color(int.parse(hexColor.substring(1, 7), radix: 16) + 0xFF000000);
  }

  void _copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
  }
}
