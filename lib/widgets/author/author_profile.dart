import 'package:descub_espaciounno/util/colors.dart';
import 'package:flutter/material.dart';

class AuthorProfile extends StatelessWidget {
  final List<String> imageUrls;

  const AuthorProfile({
    Key? key,
    required this.imageUrls,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0)
      ),
      margin: const EdgeInsets.only(top: 15.0),
      elevation: 5,
      child: Row(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
              child: Image.network(
                imageUrls[0],
                fit: BoxFit.cover,
                height: 160,
              ),
            ),
          ),
          Expanded(
            child: Image.network(
              imageUrls[1],
              fit: BoxFit.cover,
              height: 160,
            ),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              child: Image.network(
                imageUrls[2],
                fit: BoxFit.cover,
                height: 160,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
