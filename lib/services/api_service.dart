import 'dart:convert';
import 'package:descub_espaciounno/models/artist_model.dart';
import 'package:descub_espaciounno/models/ip_api_model.dart';
import 'package:descub_espaciounno/models/mural_model.dart';
import 'package:descub_espaciounno/models/nearby_locations_model.dart';
import 'package:dio/dio.dart';
import 'package:descub_espaciounno/models/mural_count.dart';
import 'package:descub_espaciounno/models/nearby_location_model.dart';
import 'package:descub_espaciounno/models/scan_model.dart';
import 'package:descub_espaciounno/models/coupon_model.dart';

class ApiService {
  static Dio dio = Dio();

  static Future<NearbyLocation> fetchData(String apiUrl, double latitude, double longitude) async {
    try {
      final response = await dio.get(
        '$apiUrl/partnerships/byMuralLocation/$longitude/$latitude',
      );

      if (response.statusCode == 200) {
        return NearbyLocation.fromJson(response.data);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }

  static Future<NearbyLocations> getNearbyLocations(String apiUrl, double latitude, double longitude) async{
    try {
      final response = await dio.get(
        '$apiUrl/partnerships/byNearbyMurals/$longitude/$latitude',
      );

      if (response.statusCode == 200) {
        return NearbyLocations.fromJson(response.data);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }

  static Future<MuralCount> getMuralCount(String apiUrl, String nickname) async {
    try {
      final response = await dio.get(
        '$apiUrl/murals/countByNickname/$nickname',
      );

      if (response.statusCode == 200) {
        return MuralCount.fromJson(response.data);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }

  static Future<Artist> getArtist(String apiUrl, String nickname) async {
    try {
      final response = await dio.get(
        '$apiUrl/artists/byNickname/$nickname',
      );

      if (response.statusCode == 200) {
        return Artist.fromJson(response.data);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }

  static Future<void> postDataScan(String apiUrl, Scan scan) async {
    try {
      DateTime now = DateTime.now();
      scan.scannedDatetime = now;
      final String jsonData = jsonEncode(scan.toJson());

      final Response response = await dio.post(
        '$apiUrl/scans',
        options: Options(
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
        ),
        data: jsonData,
      );

      if (response.statusCode == 200) {
        print('Data sent to API successfully');
      } else {
        print('Failed to send data to API. Status code: ${response.statusCode}');
        print('Response data: ${response.data}');
      }
    } catch (e) {
      print('Error sending data to API: $e');
    }
  }

  static Future<Coupon> getCoupon(String apiUrl) async {
    try {
      final response = await dio.get('$apiUrl/coupons/randomCoupon');

      if (response.statusCode == 200) {
        return Coupon.fromJson(response.data);
      } else {
        throw Exception('Error al obtener los cupones: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error de red: $error');
    }
  }

  static Future<List<Mural>> getAllMurals(String apiUrl) async {
    try {
      final response = await dio.get(
        '$apiUrl/murals',
      );

      if (response.statusCode == 200) {
        List<dynamic> muralJsonList = response.data;
        List<Mural> murals = muralJsonList.map((json) => Mural.fromJson(json)).toList();
        return murals;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }

  static Future<IpApi> getIpAPI(String envurl) async {
    try {
      final response = await dio.get(envurl);

      if (response.statusCode == 200) {
        if (response.data is String) {
          final Map<String, dynamic> jsonData = jsonDecode(response.data);
          return IpApi.fromJson(jsonData);
        } else {
          throw Exception('Error: response data is not a String');
        }
      } else {
        throw Exception('Error: failed to load IpAPI data');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }
}

