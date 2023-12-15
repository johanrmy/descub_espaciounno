import 'package:flutter/cupertino.dart';
import '../../util/colors.dart';

class AuthorInfo extends StatelessWidget {
  final String information;

  const AuthorInfo({Key? key, required this.information}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> listInformation = information.split('|');

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: listInformation
            .map((info) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "• ${info.trim()}",
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontFamily: 'Noto Sans',
                fontWeight: FontWeight.w300,
                color: AppColors.appDark,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 5.0),
          ],
        ))
            .toList(),
      ),
    );
  }
}
