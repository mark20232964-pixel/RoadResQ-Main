// lib/screens/common/role_selection_screen.dart

import 'package:flutter/material.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1117), // same dark theme as welcome
      body: const Center(
        child: Text(
          'Role Selection Screen - Step 1',
          style: TextStyle(color: Colors.white, fontSize: 28),
        ),
      ),
    );
  }
}
