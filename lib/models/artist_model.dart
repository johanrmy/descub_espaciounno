class Artist {
  String id;
  String name;
  String lastName;
  String nickname;
  String email;
  String userInstagram;
  String userFacebook;
  String userTiktok;
  bool isPartner;
  String description;
  String employment;
  String urlPhoto1;
  String urlPhoto2;
  String urlPhoto3;
  DateTime createDatetime;
  DateTime updateDatetime;

  Artist({
    required this.id,
    required this.name,
    required this.lastName,
    required this.nickname,
    required this.email,
    required this.userInstagram,
    required this.userFacebook,
    required this.userTiktok,
    required this.isPartner,
    required this.description,
    required this.employment,
    required this.urlPhoto1,
    required this.urlPhoto2,
    required this.urlPhoto3,
    required this.createDatetime,
    required this.updateDatetime,
  });

  factory Artist.fromJson(Map<String, dynamic> json) => Artist(
    id: json["id"],
    name: json["name"],
    lastName: json["last_name"],
    nickname: json["nickname"],
    email: json["email"],
    userInstagram: json["user_instagram"],
    userFacebook: json["user_facebook"],
    userTiktok: json["user_tiktok"],
    isPartner: json["is_partner"],
    description: json["description"],
    employment: json["employment"],
    urlPhoto1: json["url_photo1"],
    urlPhoto2: json["url_photo2"],
    urlPhoto3: json["url_photo3"],
    createDatetime: DateTime.parse(json["create_datetime"]),
    updateDatetime: DateTime.parse(json["update_datetime"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "last_name": lastName,
    "nickname": nickname,
    "email": email,
    "user_instagram": userInstagram,
    "user_facebook": userFacebook,
    "user_tiktok": userTiktok,
    "is_partner": isPartner,
    "description": description,
    "employment": employment,
    "url_photo1": urlPhoto1,
    "url_photo2": urlPhoto2,
    "url_photo3": urlPhoto3,
    "create_datetime": createDatetime.toIso8601String(),
    "update_datetime": updateDatetime.toIso8601String(),
  };
}