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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  
  }
}