import 'dart:convert';
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
}

