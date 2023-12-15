import 'artist_model.dart';
import 'mural_model.dart';

class PartnershipModel {
  final String id;
  final ArtistModel artist;
  final MuralModel mural;

  PartnershipModel({required this.artist, required this.mural, required this.id});

  factory PartnershipModel.fromJson(Map<String, dynamic> json) {
    final artistJson = json['artist'];
    final muralJson = json['mural'];

    return PartnershipModel(
      id: json['partnership']['id'],
      artist: ArtistModel.fromJson(artistJson),
      mural : MuralModel.fromJson(muralJson)
    );
  }
}
