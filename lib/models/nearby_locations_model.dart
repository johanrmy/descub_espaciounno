import 'actual_location_model.dart';
import 'location_item.dart';

class LocationModel {
  final ActualLocation actualLocation;
  final List<LocationItem> locations;

  LocationModel({
    required this.actualLocation,
    required this.locations,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    final actualLocationJson = json['actualLocation'];
    final locationsJson = json['locations'] as List;

    return LocationModel(
      actualLocation: ActualLocation.fromJson(actualLocationJson),
      locations: locationsJson.map((locationItem) {
        return LocationItem.fromJson(locationItem);
      }).toList(),
    );
  }
}