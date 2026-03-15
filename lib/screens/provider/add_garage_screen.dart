// lib/screens/provider/add_garage_screen.dart

import 'package:flutter/material.dart';

class AddGarageScreen extends StatelessWidget {
  const AddGarageScreen({super.key});

  @override
  State<AddGarageScreen> createState() => _AddGarageScreenState();
}

class _AddGarageScreenState extends State<AddGarageScreen> {
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _contactController = TextEditingController();
  final _emailController = TextEditingController();
  final _descriptionController = TextEditingController();

  // Service categories 
  final Map<String, bool> _serviceCategories = {
    'Towing': true,
    'Battery Replacement': false,
    'Tire Change': false,
    'Fuel Delivery': false,
    'Jump Start': true,
    'Emergency Repair': true,
    'Other': true,
  };

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _contactController.dispose();
    _emailController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Add a Garage'),
        backgroundColor: const Color(0xFF1B1B4B),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Add Garage
            const SizedBox(height: 20),
            const Text('Garage Name', style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'e.g. ABC Motors',
                filled: true,
                fillColor: const Color(0xFFF5F5F5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Address
            const Text('Address', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            TextField(
              controller: _addressController,
              decoration: InputDecoration(
                hintText: 'e.g. 123, Main St, Colombo',
                filled: true,
                fillColor: const Color(0xFFF5F5F5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
             const SizedBox(height: 20),

            // Contact Number
            const Text('Contact Number', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            TextField(
              controller: _contactController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: 'e.g. 0778404504',
                filled: true,
                fillColor: const Color(0xFFF5F5F5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Email Address
            const Text('Email Address', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'e.g. abc@gmail.com',
                filled: true,
                fillColor: const Color(0xFFF5F5F5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Description
            const Text('Description', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            TextField(
              controller: _descriptionController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'e.g. Full-service auto repair shop',
                filled: true,
                fillColor: const Color(0xFFF5F5F5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Service Categoriess
            const Text(
              'Service Categories',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 16,
              runSpacing: 8,
              children: _serviceCategories.keys.map((service) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width * 0.42,
                  child: CheckboxListTile(
                    title: Text(service, style: const TextStyle(fontSize: 15)),
                    value: _serviceCategories[service],
                    activeColor: const Color(0xFF6A48FF),
                    onChanged: (bool? value) {
                      setState(() {
                        _serviceCategories[service] = value ?? false;
                      });
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.zero,
                  ),
                );
              }).toList(),
            ),



          ],
        ),
      ),
    );
  }
}