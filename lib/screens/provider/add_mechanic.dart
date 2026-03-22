// lib/screens/provider/add_mechanic.dart

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // for current user
import 'package:cloud_firestore/cloud_firestore.dart'; // for saving mechanic data
import 'package:google_maps_flutter/google_maps_flutter.dart'; // for map widget
import 'package:geolocator/geolocator.dart'; // for live location & permissions
import 'package:http/http.dart' as http; // for Google Places autocomplete API

class AddMechanicScreen extends StatefulWidget {
  const AddMechanicScreen({super.key});

  @override
  State<AddMechanicScreen> createState() => _AddMechanicScreenState();
}

class _AddMechanicScreenState extends State<AddMechanicScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
