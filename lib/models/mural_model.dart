class Mural {
  String id;
  String name;
  String description;
  Location location;
  String addressId;
  String urlPhoto1;
  String urlPhoto2;
  String urlPhoto3;
  List<String> colors;
  String creationDate;
  DateTime createDatetime;
  DateTime updateDatetime;
  Address address;

  Mural({
    required this.id,
    required this.name,
    required this.description,
    required this.location,
    required this.addressId,
    required this.urlPhoto1,
    required this.urlPhoto2,
    required this.urlPhoto3,
    required this.colors,
    required this.creationDate,
    required this.createDatetime,
    required this.updateDatetime,
    required this.address,
  });

  factory Mural.fromJson(Map<String, dynamic> json) => Mural(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    location: Location.fromJson(json["location"]),
    addressId: json["address_id"],
    urlPhoto1: json["url_photo_1"],
    urlPhoto2: json["url_photo_2"],
    urlPhoto3: json["url_photo_3"],
    colors: List<String>.from(json["colors"].map((x) => x)),
    creationDate: json['creation_date'],
    createDatetime: DateTime.parse(json["create_datetime"]),
    updateDatetime: DateTime.parse(json["update_datetime"]),
    address: Address.fromJson(json["ADDRESS"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "location": location.toJson(),
    "address_id": addressId,
    "url_photo_1": urlPhoto1,
    "url_photo_2": urlPhoto2,
    "url_photo_3": urlPhoto3,
    "colors": List<dynamic>.from(colors.map((x) => x)),
    "creation_date": creationDate,
    "create_datetime": createDatetime.toIso8601String(),
    "update_datetime": updateDatetime.toIso8601String(),
    "ADDRESS": address.toJson(),
  };
}

class Address {
  String id;
  String name;
  DateTime createDatetime;
  DateTime updateDatetime;
  String districtId;

  Address({
    required this.id,
    required this.name,
    required this.createDatetime,
    required this.updateDatetime,
    required this.districtId,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    id: json["id"],
    name: json["name"],
    createDatetime: DateTime.parse(json["create_datetime"]),
    updateDatetime: DateTime.parse(json["update_datetime"]),
    districtId: json["district_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "create_datetime": createDatetime.toIso8601String(),
    "update_datetime": updateDatetime.toIso8601String(),
    "district_id": districtId,
  };
}

class Location {
  Crs crs;
  String type;
  List<double> coordinates;

  Location({
    required this.crs,
    required this.type,
    required this.coordinates,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
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
