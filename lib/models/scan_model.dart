// To parse this JSON data, do
//
//     final scan = scanFromJson(jsonString);

import 'dart:convert';

Scan scanFromJson(String str) => Scan.fromJson(json.decode(str));

String scanToJson(Scan data) => json.encode(data.toJson());

class Scan {
  String partnershipId;
  String model;
  String brand;
  DateTime? scannedDatetime;

  Scan({
    required this.partnershipId,
    required this.model,
    required this.brand,
    this.scannedDatetime,
  });

  factory Scan.fromJson(Map<String, dynamic> json) => Scan(
    partnershipId: json["partnership_id"],
    model: json["model"],
    brand: json["brand"],
    scannedDatetime: DateTime.parse(json["scanned_datetime"]),
  );

  Map<String, dynamic> toJson() => {
    "partnership_id": partnershipId,
    "model": model,
    "brand": brand,
    "scanned_datetime": scannedDatetime?.toIso8601String(),
  };
}
