import 'dart:async';
import 'package:descub_espaciounno/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../services/current_location_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();
  static const CameraPosition _positioncrt = CameraPosition(
    target: LatLng(-12.1493747, -77.0228592),
    zoom: 16,
  );
  Position? _currentPosition;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _positioncrt,
          myLocationEnabled: true,
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          }
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryUNNO,
        onPressed: () {
          _animateToCurrentLocation();
        },
        child: Icon(Icons.my_location),
      ),
    );
  }

  void _getCurrentLocation() async {
    try {
      Position position = await LocationService.determinePosition();
      setState(() {
        _currentPosition = position;
      });

      LocationService.getPositionStream().listen((Position? newPosition) {
        setState(() {
          _currentPosition = newPosition;
          if (_currentPosition != null) {
            print("Latitud: ${_currentPosition!.latitude}, Longitud: ${_currentPosition!.longitude}");
          }
        });
      });
    } catch (e) {
      print(e);
    }
  }

  void _animateToCurrentLocation() async {
    if (_currentPosition != null && _controller.isCompleted) {
      final GoogleMapController controller = await _controller.future;
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(
              _currentPosition!.latitude,
              _currentPosition!.longitude,
            ),
            zoom: 18.0,
          ),
        ),
      );
    }
  }
}