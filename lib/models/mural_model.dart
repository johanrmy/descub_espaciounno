class Mural {
  String id;
  String name;
  String description;
  Location location;
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
    urlPhoto1: json["url_photo_1"],
    urlPhoto2: json["url_photo_2"],
    urlPhoto3: json["url_photo_3"],
    colors: List<String>.from(json["colors"].map((x) => x)),
    creationDate: json['creation_date'],
    createDatetime: DateTime.parse(json["create_datetime"]),
    updateDatetime: DateTime.parse(json["update_datetime"]),
    address: Address.fromJson(json["address"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "location": location.toJson(),
    "url_photo_1": urlPhoto1,
    "url_photo_2": urlPhoto2,
    "url_photo_3": urlPhoto3,
    "colors": List<dynamic>.from(colors.map((x) => x)),
    "creation_date": creationDate,
    "create_datetime": createDatetime.toIso8601String(),
    "update_datetime": updateDatetime.toIso8601String(),
    "address": address.toJson(),
  };
}

class Address {
  String id;
  String name;
  DateTime createDatetime;
  DateTime updateDatetime;
  District district;

  Address({
    required this.id,
    required this.name,
    required this.createDatetime,
    required this.updateDatetime,
    required this.district,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    id: json["id"],
    name: json["name"],
    createDatetime: DateTime.parse(json["create_datetime"]),
    updateDatetime: DateTime.parse(json["update_datetime"]),
    district: District.fromJson(json['district']),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "create_datetime": createDatetime.toIso8601String(),
    "update_datetime": updateDatetime.toIso8601String(),
    "district": district,
  };
}

class District {
  String id;
  String name;
  DateTime createDatetime;
  DateTime updateDatetime;
  City city;

  District({
    required this.id,
    required this.name,
    required this.createDatetime,
    required this.updateDatetime,
    required this.city,
  });

  factory District.fromJson(Map<String, dynamic> json) => District(
    id: json["id"],
    name: json["name"],
    createDatetime: DateTime.parse(json["create_datetime"]),
    updateDatetime: DateTime.parse(json["update_datetime"]),
    city: City.fromJson(json["city"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "create_datetime": createDatetime.toIso8601String(),
    "update_datetime": updateDatetime.toIso8601String(),
    "city": city.toJson(),
  };
}

class City {
  String id;
  String name;
  DateTime createDatetime;
  DateTime updateDatetime;

  City({
    required this.id,
    required this.name,
    required this.createDatetime,
    required this.updateDatetime,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
    id: json["id"],
    name: json["name"],
    createDatetime: DateTime.parse(json["create_datetime"]),
    updateDatetime: DateTime.parse(json["update_datetime"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "create_datetime": createDatetime.toIso8601String(),
    "update_datetime": updateDatetime.toIso8601String(),
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
