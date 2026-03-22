// ignore_for_file: deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:roadresq/models/schedule.dart';
import 'package:roadresq/repositories/schedule_repository.dart';
import 'package:roadresq/screens/services/service.dart';

class ScheduleMechanicScreen extends StatefulWidget {
  final Map<String, dynamic> schedule;
  const ScheduleMechanicScreen({super.key, required this.schedule});

  @override
  State<ScheduleMechanicScreen> createState() => _ScheduleMechanicScreenState();
}

class _ScheduleMechanicScreenState extends State<ScheduleMechanicScreen> {
  static const _primary = Color(0xFF1B1B4B);
  static const _accent = Color(0xFFE53935);

  int? _selectedDate;
  DateTime _currentMonth = DateTime.now();
  int _startHour = 10;
  int _startMinute = 0;
  bool _startIsAm = true;
  bool _isLoading = false;

  final _repository = ScheduleRepository();

  Future<void> _scheduleNow() async {
    setState(() => _isLoading = true);
    print(widget.schedule['location']);
    final schedule = ScheduleModel(
      userId: AuthService().currentUser!.uid,
      providerId: widget.schedule['providerId'] as String,
      issue: '',
      location: widget.schedule['userLocation'],
      providerLocation: widget.schedule['location'] as GeoPoint,
      scheduledTime: DateTime(
        _currentMonth.year,
        _currentMonth.month,
        _selectedDate!,
        _startIsAm ? _startHour % 12 : (_startHour % 12) + 12,
        _startMinute,
      ),
    );
    try {
      await _repository.createSchedule(schedule);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Row(
              children: [
                Icon(Icons.check_circle, color: Colors.white),
                SizedBox(width: 10),
                Text(
                  'Schedule booked successfully!',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
            backgroundColor: Colors.green.shade600,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            duration: const Duration(seconds: 2),
          ),
        );
        await Future.delayed(const Duration(seconds: 2));
        if (mounted) Navigator.of(context).pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final name = widget.schedule['name'] as String? ?? 'Mechanic';

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F7),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
 }
}