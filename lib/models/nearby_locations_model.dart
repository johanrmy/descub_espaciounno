import 'dart:convert';

import 'actual_location_model.dart';
import 'location_element.dart';

NearbyLocations nearbyLocationsFromJson(String str) => NearbyLocations.fromJson(json.decode(str));

String nearbyLocationsToJson(NearbyLocations data) => json.encode(data.toJson());

class NearbyLocations {
  ActualLocation actualLocation;
  List<LocationElement> locations;

  NearbyLocations({
    required this.actualLocation,
    required this.locations,
  });

  factory NearbyLocations.fromJson(Map<String, dynamic> json) => NearbyLocations(
    actualLocation: ActualLocation.fromJson(json["actualLocation"]),
    locations: List<LocationElement>.from(json["locations"].map((x) => LocationElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "actualLocation": actualLocation.toJson(),
    "locations": List<dynamic>.from(locations.map((x) => x.toJson())),
  };
}
