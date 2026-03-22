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
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Add Mechanic'),
        backgroundColor: const Color(0xFF120A4D),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Mechanic Name'),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(labelText: 'Phone Number'),
                keyboardType: TextInputType.phone,
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
