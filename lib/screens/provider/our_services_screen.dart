// lib/screens/provider/our_services_screen.dart

import 'package:flutter/material.dart';

class OurServicesScreen extends StatelessWidget {
  const OurServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Our Services'),
        backgroundColor: const Color(0xFF1B1B4B),
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text(
          'Our Services - Step 1',
          style: TextStyle(fontSize: 28, color: Colors.black),
        ),
      ),
    );
  }
}
