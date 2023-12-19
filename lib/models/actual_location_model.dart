class ActualLocation {
  String long;
  String lat;

  ActualLocation({
    required this.long,
    required this.lat,
  });

  factory ActualLocation.fromJson(Map<String, dynamic> json) => ActualLocation(
    long: json["long"],
    lat: json["lat"],
  );

  Map<String, dynamic> toJson() => {
    "long": long,
    "lat": lat,
  };
}