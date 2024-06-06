import 'dart:convert';

import 'package:descub_espaciounno/models/artist_model.dart';
import 'package:descub_espaciounno/models/mural_model.dart';
import 'package:descub_espaciounno/models/partnership_model.dart';

NearbyLocation nearbyLocationFromJson(String str) => NearbyLocation.fromJson(json.decode(str));

String nearbyLocation(NearbyLocation data) => json.encode(data.toJson());

class NearbyLocation {
  Partnership partnership;
  Artist artist;
  Mural mural;

  NearbyLocation({
    required this.partnership,
    required this.artist,
    required this.mural,
  });

  factory NearbyLocation.fromJson(Map<String, dynamic> json) => NearbyLocation(
    partnership: Partnership.fromJson(json["partnership"]),
    artist: Artist.fromJson(json["artistJson"]),
    mural: Mural.fromJson(json["muralJson"]),
  );

  Map<String, dynamic> toJson() => {
    "partnership": partnership.toJson(),
    "artist": artist.toJson(),
    "mural": mural.toJson(),
  };
}


