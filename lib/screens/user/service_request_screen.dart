import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class ServiceRequestScreen extends StatefulWidget {
  final String initialQuery;

  const ServiceRequestScreen({super.key, required this.initialQuery});

  @override
  State<ServiceRequestScreen> createState() => _ServiceRequestScreenState();
}

class _ServiceRequestScreenState extends State<ServiceRequestScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();

  GoogleMapController? _mapController;
  Position? _userLocation;
  LatLng? _providerLocation;

  String? _providerName;
  String _eta = "";

  final Set<Marker> _markers = {};
  final Set<Polyline> _polylines = {};

  bool _requestAccepted = false;
  bool _isSearching = false;

  String? _currentRequestId;
  StreamSubscription? _requestListener;
  Timer? _timeoutTimer;

  final polylinePoints = PolylinePoints();

  late AnimationController _animationController;
  late Animation<double> _animation;

  final String googleApiKey = "AIzaSyDC-Vg3GG5uDyDb5JuIzPKeKEIeUXwoXho";
  @override
  void initState() {
    super.initState();
    _searchController.text = widget.initialQuery;
    _getUserLocation();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    _requestListener?.cancel();
    _timeoutTimer?.cancel();
    super.dispose();
  }

  // 📍 GET USER LOCATION
  Future<void> _getUserLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return;

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) return;

    _userLocation = await Geolocator.getCurrentPosition();

    _markers.clear();
    _markers.add(
      Marker(
        markerId: const MarkerId('user'),
        position: LatLng(_userLocation!.latitude, _userLocation!.longitude),
      ),
    );

    setState(() {});
  }

  // 🧠 ETA CALCULATION
  void calculateETA() {
    if (_userLocation == null || _providerLocation == null) return;

    double meters = Geolocator.distanceBetween(
      _providerLocation!.latitude,
      _providerLocation!.longitude,
      _userLocation!.latitude,
      _userLocation!.longitude,
    );

    double km = meters / 1000;

    double speed = 40; // km/h

    double hours = km / speed;
    int minutes = (hours * 60).round();

    setState(() {
      _eta = "$minutes min";
    });
  }

  // 🗺 DRAW ROUTE
  Future<void> _drawRoute() async {
    if (_userLocation == null || _providerLocation == null) return;

    final result = await polylinePoints.getRouteBetweenCoordinates(
      googleApiKey: googleApiKey,
      request: PolylineRequest(
        origin: PointLatLng(_userLocation!.latitude, _userLocation!.longitude),
        destination: PointLatLng(
          _providerLocation!.latitude,
          _providerLocation!.longitude,
        ),
        mode: TravelMode.driving,
      ),
    );

    if (result.points.isNotEmpty) {
      final points =
          result.points.map((e) => LatLng(e.latitude, e.longitude)).toList();

      _polylines.clear();
      _polylines.add(
        Polyline(
          polylineId: const PolylineId("route"),
          color: const Color(0xFFB388FF),
          width: 6,
          points: points,
        ),
      );

      setState(() {});
    }
  }
}
