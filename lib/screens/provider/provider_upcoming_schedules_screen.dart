import 'package:flutter/material.dart';

class ProviderUpcomingSchedulesScreen extends StatefulWidget {
  const ProviderUpcomingSchedulesScreen({super.key});

  @override
  State<ProviderUpcomingSchedulesScreen> createState() => _ProviderUpcomingSchedulesScreenState();
}

class _ProviderUpcomingSchedulesScreenState extends State<ProviderUpcomingSchedulesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upcoming Schedules'),
        backgroundColor: const Color(0xFF1B1B4B),
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text('Upcoming schedules will appear here'),
      ),
    );
  }
}