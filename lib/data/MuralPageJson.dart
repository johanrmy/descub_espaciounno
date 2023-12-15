import 'AuthorPageJson.dart';

class MuralPageJson {
  final List<String> muralImages;
  final String muralTitle;
  final String muralDescription;
  final String muralDate;
  final List<String> muralColors;
  final AuthorPageJson author;

  MuralPageJson({
    required this.muralImages,
    required this.muralTitle,
    required this.muralDescription,
    required this.muralDate,
    required this.muralColors,
    required this.author,
  });

  Map<String, dynamic> toJson() {
    return {
      'muralImages': muralImages,
      'muralTitle': muralTitle,
      'muralDescription': muralDescription,
      'muralDate': muralDate,
      'muralColors': muralColors,
      'author': author.toJson(),
    };
  }
}
