class AuthorPageJson {
  final String nickname;
  final List<String> imageUrls;
  final String information;
  final int nMurals;
  final List<String> usersSocialMedia;
  final String email;
  final bool isPartner;

  AuthorPageJson({
    required this.nickname,
    required this.imageUrls,
    required this.information,
    required this.nMurals,
    required this.usersSocialMedia,
    required this.email,
    required this.isPartner,
  });

  Map<String, dynamic> toJson() {
    return {
      'nickname': nickname,
      'imageUrls': imageUrls,
      'information': information,
      'nMurals': nMurals,
      'usersSocialMedia': usersSocialMedia,
      'email': email,
      'isPartner': isPartner,
    };
  }
}
