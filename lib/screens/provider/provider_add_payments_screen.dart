// lib/screens/provider/add_charges_screen.dart

import 'package:flutter/material.dart';

class AddChargesScreen extends StatefulWidget {
  final String customerName;
  final String serviceName;   // e.g. "Tyre Change" or "Headlight Change"

  const AddChargesScreen({
    super.key,
    required this.customerName,
    required this.serviceName,
  });

  @override
  State<AddChargesScreen> createState() => _AddChargesScreenState();
}

class _AddChargesScreenState extends State<AddChargesScreen> {

  String? _selectedService;
  final TextEditingController _priceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedService = widget.serviceName; // Pre-fill from the request
  }

  @override
  void dispose() {
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Add Charges'),
          backgroundColor: const Color(0xFF1B1B4B),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Adding charges for\n${widget.customerName}",
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              // fields will come here
            ],
          ),
        ),
    );
  }
}