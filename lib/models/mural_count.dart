import 'dart:convert';

MuralCount muralCountFromJson(String str) => MuralCount.fromJson(json.decode(str));

String muralCountToJson(MuralCount data) => json.encode(data.toJson());

class MuralCount {
  int count;

  MuralCount({
    required this.count,
  });

  factory MuralCount.fromJson(Map<String, dynamic> json) => MuralCount(
    count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "count": count,
  };
}
