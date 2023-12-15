import 'package:url_launcher/url_launcher.dart';

Future<bool> openLocationGeo(double latitude, double longitude) async {
  Uri url;
  url = Uri.parse('geo:$latitude,$longitude?z=20');

  if (await canLaunchUrl(url)) {
    await launchUrl(url);
    return true;
  } else {
    throw Exception('No se pudo abrir la aplicacion');
  }
}