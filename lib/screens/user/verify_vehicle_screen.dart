import 'package:flutter/material.dart';

class VerifyVehicleScreen extends StatefulWidget {
  const VerifyVehicleScreen({super.key});

  @override
  State<VerifyVehicleScreen> createState() => _VerifyVehicleScreenState();
}

class _VerifyVehicleScreenState extends State<VerifyVehicleScreen> {
  String selectedType = 'Car';

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
      body: Column(
  children: [
    const SizedBox(height: 16),

    // Tab bar: Car | SUV | Van | Bike | Lorry | Three Wheeler
    SizedBox(
      height: 48,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          _buildTab("Car", selectedType == "Car"),
          _buildTab("SUV", selectedType == "SUV"),
          _buildTab("Van", selectedType == "Van"),
          _buildTab("Bike", selectedType == "Bike"),
          _buildTab("Lorry", selectedType == "Lorry"),
          _buildTab("Three Wheeler", selectedType == "Three Wheeler"),
        ],
      ),
    ),

    const SizedBox(height: 16),

    // Placeholder for brand list (next commit)
    Expanded(
      child: Center(
        child: Text(
          'Selected: $selectedType - Brands coming in next commit',
          style: TextStyle(fontSize: 20),
        ),
      ),
    ),
  ],
),
    );
  }
Widget _buildTab(String label, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedType = label;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF6A48FF) : Colors.grey[200],
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black87,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
          ),
        ),
      ),
    );
  }
}