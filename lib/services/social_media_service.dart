import 'package:url_launcher/url_launcher.dart';

Future<bool> openSocialMediaProfile(String username, String socialMedia) async {
  Uri url;
  if (socialMedia == 'tiktok'){
    url = Uri.parse('https://www.$socialMedia.com/@$username');
  }else{
    url = Uri.parse('https://www.$socialMedia.com/$username');
  }
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
    return true;
  } else {
    throw Exception('No se pudo abrir la aplicacion');
  }
}