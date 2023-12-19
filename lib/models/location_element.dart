class LocationElement {
  String partnershipId;
  String muralId;
  LocationLocation location;
  String artistId;

  LocationElement({
    required this.partnershipId,
    required this.muralId,
    required this.location,
    required this.artistId,
  });

  factory LocationElement.fromJson(Map<String, dynamic> json) => LocationElement(
    partnershipId: json["partnership_id"],
    muralId: json["mural_id"],
    location: LocationLocation.fromJson(json["location"]),
    artistId: json["artist_id"],
  );

  Map<String, dynamic> toJson() => {
    "partnership_id": partnershipId,
    "mural_id": muralId,
    "location": location.toJson(),
    "artist_id": artistId,
  };
}

class LocationLocation {
  Crs crs;
  String type;
  List<double> coordinates;

  LocationLocation({
    required this.crs,
    required this.type,
    required this.coordinates,
  });

  factory LocationLocation.fromJson(Map<String, dynamic> json) => LocationLocation(
    crs: Crs.fromJson(json["crs"]),
    type: json["type"],
    coordinates: List<double>.from(json["coordinates"].map((x) => x?.toDouble())),
  );

  Map<String, dynamic> toJson() => {
    "crs": crs.toJson(),
    "type": type,
    "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
  };
}

class Crs {
  String type;
  Properties properties;

  Crs({
    required this.type,
    required this.properties,
  });

  factory Crs.fromJson(Map<String, dynamic> json) => Crs(
    type: json["type"],
    properties: Properties.fromJson(json["properties"]),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "properties": properties.toJson(),
  };
}

class Properties {
  String name;

  Properties({
    required this.name,
  });

  factory Properties.fromJson(Map<String, dynamic> json) => Properties(
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}
