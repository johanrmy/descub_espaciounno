import 'package:flutter/material.dart';
import '../models/nearby_location_model.dart';

class NavigatorService {
  static void navigateToOtherView(BuildContext context, NearbyLocation data, String destinationRoute) {
    Navigator.pushNamed(context, destinationRoute, arguments: data);
  }
}
