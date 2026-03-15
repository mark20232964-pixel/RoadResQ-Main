import 'package:flutter/material.dart';

class VerifyVehicleScreen extends StatelessWidget {
  const VerifyVehicleScreen({super.key});

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
        "Verify Your Vehicle",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
    ),
      body: const Center(
        child: Text('Verify Vehicle Screen - Step 1', style: TextStyle(fontSize: 28)),
      ),
    );
  }
}