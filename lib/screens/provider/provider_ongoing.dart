import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

import 'provider_request_details.dart';

class ProviderOngoingScreen extends StatefulWidget {
  const ProviderOngoingScreen({super.key});

  @override
  State<ProviderOngoingScreen> createState() => _ProviderOngoingScreenState();
}

class _ProviderOngoingScreenState extends State<ProviderOngoingScreen> {
  final String providerId =
      FirebaseAuth.instance.currentUser?.uid ?? "provider";

  Position? _providerLocation;

  final int timeoutMinutes = 30;

  StreamSubscription<Position>? _positionStream;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ongoing Requests"),
      ),
      body: const Center(
        child: Text("Ongoing Requests Screen"),
      ),
    );
  }
}
