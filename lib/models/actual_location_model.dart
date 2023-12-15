class ActualLocation {
  final double long;
  final double lat;

  ActualLocation({
    required this.long,
    required this.lat,
  });

  factory ActualLocation.fromJson(Map<String, dynamic> json) {
    return ActualLocation(
      long: double.parse(json['long'].toString()),
      lat: double.parse(json['lat'].toString()),
    );
  }
}