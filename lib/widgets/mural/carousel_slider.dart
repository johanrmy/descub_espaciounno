import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../util/colors.dart';

class CarouselMural extends StatelessWidget {
  final double size;
  final List<String> urlImgs;

  const CarouselMural({Key? key, required this.size, required this.urlImgs})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 4,
            offset: const Offset(1, 2),
          ),
        ],
      ),
      child: CarouselSlider(
        options: CarouselOptions(
          height: size,
          viewportFraction: 1.0,
        ),
        items: urlImgs.map((url) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: size,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                    color: AppColors.appDarkS,
                    borderRadius: BorderRadius.circular(16.0)
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.network(
                    url,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
