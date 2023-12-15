class MuralModel {
  final String id;
  final String name;
  final String description;
  final List<double> coordinates;
  final String urlPhoto1;
  final String urlPhoto2;
  final String urlPhoto3;

  MuralModel({
    required this.id,
    required this.name,
    required this.description,
    required this.coordinates,
    required this.urlPhoto1,
    required this.urlPhoto2,
    required this.urlPhoto3,
  });

  factory MuralModel.fromJson(Map<String, dynamic> json) {
    return MuralModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      coordinates: List<double>.from(json['location']['coordinates']),
      urlPhoto1: json['url_photo_1'],
      urlPhoto2: json['url_photo_2'],
      urlPhoto3: json['url_photo_3'],
    );
  }
}