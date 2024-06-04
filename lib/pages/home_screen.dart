import 'dart:async';
import 'package:descub_espaciounno/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/mural_model.dart';
import '../services/current_location_service.dart';
import '../services/api_service.dart';
import '../util/env.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();
  List<Mural> _murals = [];
  static const CameraPosition _positioncrt = CameraPosition(
    target: LatLng(-12.1493747, -77.0228592),
    zoom: 16,
  );
  Position? _currentPosition;
  bool _locationPermissionGranted = false;
  Set<Marker> _markers = {
    const Marker(
      markerId: MarkerId("Espacio UNNO"),
      position: LatLng(-12.1493747, -77.0228592),
    ),};

  @override
  void initState() {
    super.initState();
    _checkLocationPermission();
    _getCurrentLocation();
    _addCustomIcon();
    _fetchMurals();
  }

  Future<void> _fetchMurals() async {
    try {
      List<Mural> murals = await ApiService.getAllMurals(Env.url);
      setState(() {
        _murals = murals;
      });
      _addMuralMarkers();
    } catch (error) {
      print('Error fetching murals: $error');
    }
  }

  void _addMuralMarkers() {
    Set<Marker> markers = {};
    for (Mural mural in _murals) {
      Marker marker = Marker(
        markerId: MarkerId(mural.id),
        position: LatLng(
          mural.location.coordinates[1], // Latitud
          mural.location.coordinates[0], // Longitud
        ),
      );
      markers.add(marker);
    }
    setState(() {
      _markers = markers;
    });
  }

  Future<void> _checkLocationPermission() async {
    final status = await Geolocator.checkPermission();
    setState(() {
      _locationPermissionGranted = status == LocationPermission.always ||
          status == LocationPermission.whileInUse;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _positioncrt,
        myLocationButtonEnabled: false,
        myLocationEnabled: _locationPermissionGranted,
        zoomControlsEnabled: false,
        markers: _markers,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryUNNO,
        onPressed: () {
          _animateToCurrentLocation();
        },
        child: const Icon(Icons.my_location, color: AppColors.appLight),
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
          _locationPermissionGranted = true;
          _currentPosition = newPosition;
          if (_currentPosition != null) {
            print("Latitud: ${_currentPosition!
                .latitude}, Longitud: ${_currentPosition!.longitude}");
            ApiService.getNearbyLocations(
                Env.url,
                _currentPosition!.latitude, _currentPosition!.longitude)
                .then((value) {
              setState(() {
                _markers =
                value as Set<Marker>;
              });
            });
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

  void _addCustomIcon() {
    BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(60.0, 60.0)),
        "assets/images/espacio_unno_logo.png")
        .then(
          (icon) {
        setState(() {
          var markerIcon = icon;
        });
      },
    );
  }
}