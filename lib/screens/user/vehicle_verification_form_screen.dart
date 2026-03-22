import 'package:flutter/material.dart';

class VehicleVerificationFormScreen extends StatelessWidget {
  final String brandName;
  final String logoUrl;

  const VehicleVerificationFormScreen({
    super.key,
    required this.brandName,
    required this.logoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Get Verified",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Vehicle Verification Form - Step 1', style: TextStyle(fontSize: 28)),
      ),
    );
  }
}