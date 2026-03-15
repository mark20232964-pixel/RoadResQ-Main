// lib/screens/provider/add_garage_screen.dart

import 'package:flutter/material.dart';

class AddGarageScreen extends StatelessWidget {
  const AddGarageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a Garage'),
        backgroundColor: const Color(0xFF1B1B4B),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Text('Add Garage screen - coming soon'),
        ),
      ),
    );
  }
}