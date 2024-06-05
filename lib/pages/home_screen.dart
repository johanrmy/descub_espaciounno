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
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  List<Mural> _murals = [];
  static const CameraPosition _positioncrt = CameraPosition(
    target: LatLng(-12.1493747, -77.0228592),
    zoom: 16,
  );
  Position? _currentPosition;
  bool _locationPermissionGranted = false;
  Set<Marker> _markers = {};
  BitmapDescriptor? _customIcon;

  @override
  void initState() {
    super.initState();
    _loadCustomIcon();
    _checkLocationPermission();
    _getCurrentLocation();
    _fetchMurals();
  }

  Future<void> _loadCustomIcon() async {
    _customIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(96, 96)),
      'assets/images/unno_marker.png',
    );
    _addInitialMarker();
  }

  void _addInitialMarker() {
    final initialMarker = Marker(
      markerId: const MarkerId('Espacio UNNO'),
      position: const LatLng(-12.1493747, -77.0228592),
      icon: _customIcon ?? BitmapDescriptor.defaultMarker,
    );
    setState(() {
      _markers.add(initialMarker);
    });
  }

  Future<void> _fetchMurals() async {
    try {
      final ipApiData = await ApiService.getIpAPI(Env.url);
      print('Instancia: ${ipApiData.instancia}, ID: ${ipApiData.id}, URL: ${ipApiData.url}');
      List<Mural> murals = await ApiService.getAllMurals(ipApiData.url);
      setState(() {
        _murals = murals;
      });
      _addMuralMarkers();
    } catch (error) {
      print('Error fetching murals: $error');
    }
  }

  void _addMuralMarkers() {
    Set<Marker> markers = {
      Marker(
        markerId: const MarkerId("Espacio UNNO"),
        position: const LatLng(-12.1493747, -77.0228592),
        icon: _customIcon ?? BitmapDescriptor.defaultMarker,
      ),
    };

    for (Mural mural in _murals) {
      Marker marker = Marker(
        markerId: MarkerId(mural.id),
        position: LatLng(
          mural.location.coordinates[1], // Latitud
          mural.location.coordinates[0], // Longitud
        ),
        infoWindow: InfoWindow(
          title: mural.name,
          onTap: () {
            _showMarkerInfo(mural.name, mural.urlPhoto1);
          },
        ),
      );
      markers.add(marker);
    }

    setState(() {
      _markers.addAll(markers);
    });
  }

  void _showMarkerInfo(String title, String imageUrl) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Image.network(imageUrl),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
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
            print("Latitud: ${_currentPosition!.latitude}, Longitud: ${_currentPosition!.longitude}");
            ApiService.getNearbyLocations(
                Env.url,
                _currentPosition!.latitude, _currentPosition!.longitude)
                .then((value) {
              setState(() {
                _markers = {
                  Marker(
                    markerId: const MarkerId("Espacio UNNO"),
                    position: const LatLng(-12.1493747, -77.0228592),
                    icon: _customIcon ?? BitmapDescriptor.defaultMarker,
                  ),
                };
                _markers.addAll(value as Set<Marker>);
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
}
