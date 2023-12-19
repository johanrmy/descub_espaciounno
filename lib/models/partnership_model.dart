class Partnership {
  String id;

  Partnership({
    required this.id,
  });

  factory Partnership.fromJson(Map<String, dynamic> json) => Partnership(
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
  };
}