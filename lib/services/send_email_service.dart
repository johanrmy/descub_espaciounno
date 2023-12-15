import 'package:url_launcher/url_launcher.dart';

Future<bool> sendEmail(String toEmail) async {
  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: toEmail,
  );

  if (await canLaunchUrl(emailLaunchUri)) {
    await launchUrl(emailLaunchUri);
    return true;
  } else {
    throw 'Could not launch $emailLaunchUri';
  }
}