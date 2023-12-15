class LocationItem {
  final String partnershipId;
  final String muralId;
  final String location;
  final String artistId;

  LocationItem({
    required this.partnershipId,
    required this.muralId,
    required this.location,
    required this.artistId,
  });

  factory LocationItem.fromJson(Map<String, dynamic> json) {
    return LocationItem(
      partnershipId: json['partnership_id'],
      muralId: json['mural_id'],
      location: json['location'],
      artistId: json['artist_id'],
    );
  }
}