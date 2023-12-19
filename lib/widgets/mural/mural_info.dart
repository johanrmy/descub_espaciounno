import 'package:descub_espaciounno/models/artist_model.dart';
import 'package:descub_espaciounno/models/mural_count.dart';
import 'package:flutter/material.dart';

class MuralInfo extends StatelessWidget {
  final String title;
  final String description;
  final String author;
  final String muralDate;
  final Artist artistData;
  final MuralCount muralCount;

  const MuralInfo({
    Key? key,
    required this.title,
    required this.description,
    required this.author,
    required this.muralDate,
    required this.artistData,
    required this.muralCount
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double lineHeight = 12.0;
    const TextStyle infoTextStyle = TextStyle(
      fontFamily: "Noto Sans",
      fontSize: 16.0,
      fontWeight: FontWeight.w300,
      color: Colors.black,
    );
    Map<String, dynamic> data = {};
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 28,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.start,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: lineHeight),
            Text(
              description,
              style: infoTextStyle,
              textAlign: TextAlign.justify,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: lineHeight),
            LayoutBuilder(
              builder: (context, constraints) {
                if (author.length > 22) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/navbar/mural/author');
                        },
                        child: RichText(
                          text: TextSpan(
                            text: "Hecho por ",
                            style: infoTextStyle,
                            children: <TextSpan>[
                              TextSpan(
                                text: author,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text(muralDate, style: infoTextStyle),
                    ],
                  );
                } else {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          final Artist dataArtist = artistData;
                          final MuralCount  dataArtistCount = muralCount;

                          data['dataArtist'] = dataArtist;
                          data['dataArtistCount'] = dataArtistCount;
                          Navigator.pushNamed(context, '/navbar/mural/author', arguments: data);
                        },
                        child: RichText(
                          text: TextSpan(
                            text: "Hecho por ",
                            style: infoTextStyle,
                            children: <TextSpan>[
                              TextSpan(
                                text: author,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text(muralDate, style: infoTextStyle),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
