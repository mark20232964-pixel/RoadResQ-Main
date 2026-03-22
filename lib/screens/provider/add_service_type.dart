// lib/screens/provider/add_service_type.dart

import 'package:flutter/material.dart';

class AddServiceTypeScreen extends StatefulWidget {
  const AddServiceTypeScreen({super.key});

  @override
  State<AddServiceTypeScreen> createState() => _AddServiceTypeScreenState();
}

class _AddServiceTypeScreenState extends State<AddServiceTypeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Add Your Service'),
        backgroundColor: const Color(0xFF120A4D), // dark navy
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: const Center(
        child: Text(
          'Coming soon - service type selection',
          style: TextStyle(fontSize: 20, color: Colors.black54),
        ),
      ),
    );
  }
}
