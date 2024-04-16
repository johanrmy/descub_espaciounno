import 'package:descub_espaciounno/models/artist_model.dart';
import 'package:descub_espaciounno/models/ip_api_model.dart';
import 'package:flutter/material.dart';
import 'package:descub_espaciounno/util/colors.dart';
import 'package:descub_espaciounno/services/api_service.dart';
import 'package:descub_espaciounno/models/mural_count.dart';
import 'package:descub_espaciounno/util/env.dart';


class ProfileCard extends StatefulWidget {
  final String name;
  final String imageUrl;

  const ProfileCard({super.key, required this.name, required this.imageUrl});

  @override
  _ProfileCardState createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  MuralCount? muralCount;
  Artist? artistData;
  IpApi? ipAPI;
  String? ipApiUrl;

  @override

  void initState() {
    super.initState();
    getIpApi();
  }

  Future<void> getIpApi() async {
    ipAPI = await ApiService.getIpAPI(Env.url);
    setState(() {
      ipApiUrl = ipAPI?.url;
    });

  }

  Future<void> _getData() async {
    await getMuralCount();
    await getArtist();
    _navigateToNextPage();
  }

  Future<void> getMuralCount() async {
    muralCount = await ApiService.getMuralCount(ipAPI!.url, widget.name);
  }

  Future<void> getArtist() async {
    artistData = await ApiService.getArtist(ipAPI!.url, widget.name);
  }

  void _navigateToNextPage() {
    final Artist? dataArtist = artistData;
    final MuralCount? dataArtistCount = muralCount;
    final Map<String, dynamic> data = {
      'dataArtist': dataArtist,
      'dataArtistCount': dataArtistCount,
    };
    Navigator.pushNamed(context, '/navbar/mural/author', arguments: data);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _getData();
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.33,
              width: MediaQuery.of(context).size.width * 0.25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image(
                image: NetworkImage(widget.imageUrl),
                height: MediaQuery.of(context).size.height * 0.33,
                width: MediaQuery.of(context).size.width * 0.25,
                fit: BoxFit.cover,
                loadingBuilder: (BuildContext context,
                    Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryDescub,
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
                frameBuilder: (BuildContext context, Widget child,
                    int? frame, bool wasSynchronouslyLoaded) {
                  if (wasSynchronouslyLoaded) return child;
                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: child,
                  );
                },
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.appDark.withOpacity(0.1),
              ),
            ),
          ),
          Positioned.fill(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    widget.name,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto'
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}