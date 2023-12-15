class ArtistModel {
  final String id;
  final String name;
  final String lastName;
  final String nickname;
  final String email;
  final String userInstagram;
  final String userFacebook;
  final String userTikTok;
  final bool isPartner;
  final String description;
  final String employment;
  final String urlPhoto1;
  final String urlPhoto2;
  final String urlPhoto3;

  ArtistModel({
    required this.id,
    required this.name,
    required this.lastName,
    required this.nickname,
    required this.email,
    required this.userInstagram,
    required this.userFacebook,
    required this.userTikTok,
    required this.isPartner,
    required this.description,
    required this.employment,
    required this.urlPhoto1,
    required this.urlPhoto2,
    required this.urlPhoto3,
  });

  factory ArtistModel.fromJson(Map<String, dynamic> json) {
    return ArtistModel(
      id: json['id'],
      name: json['name'],
      lastName: json['last_name'],
      nickname: json['nickname'],
      email: json['email'],
      userInstagram: json['user_instagram'],
      userFacebook: json['user_facebook'],
      userTikTok: json['user_tiktok'],
      isPartner: json['is_partner'],
      description: json['description'],
      employment: json['employment'],
      urlPhoto1: json['url_photo1'],
      urlPhoto2: json['url_photo2'],
      urlPhoto3: json['url_photo3'],
    );
  }
}