// lib/screens/user/app_payments.dart
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AppPaymentsScreen extends StatefulWidget {
  const AppPaymentsScreen({super.key});

  @override
  State<AppPaymentsScreen> createState() => _AppPaymentsScreenState();
}

class _AppPaymentsScreenState extends State<AppPaymentsScreen> {
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Payments"),
        ),
        body: const Center(
          child: Text("Please log in"),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payments History"),
        backgroundColor: const Color(0xFF1B1B4B),
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text("Loading Payments..."),
      ),
    );
  }
}
