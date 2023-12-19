import 'package:descub_espaciounno/util/colors.dart';
import 'package:flutter/material.dart';

class InfoProfile extends StatelessWidget {

  const InfoProfile({
    Key? key,
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
              borderRadius: const BorderRadius.all(Radius.circular(16.0)),
              child: Image.network(
                'https://descub-espaciounno.s3.amazonaws.com/artist/team.jpg',
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
