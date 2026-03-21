import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Schedule Time',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
        fontFamily: 'SF Pro Display',
      ),
      home: const ScheduleTimeScreen(),
    );
  }
}

class ScheduleTimeScreen extends StatefulWidget {
  const ScheduleTimeScreen({super.key});

  @override
  State<ScheduleTimeScreen> createState() => _ScheduleTimeScreenState();
}