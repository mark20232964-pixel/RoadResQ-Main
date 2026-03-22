// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class ScheduleMechanicScreen extends StatefulWidget {
  final Map<String, dynamic> schedule;
  const ScheduleMechanicScreen({super.key, required this.schedule});

  @override
  State<ScheduleMechanicScreen> createState() => _ScheduleMechanicScreenState();
}

class _ScheduleMechanicScreenState extends State<ScheduleMechanicScreen> {
  static const _primary = Color(0xFF1B1B4B);
  static const _accent = Color(0xFFE53935);

  DateTime _currentMonth = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final name = widget.schedule['name'] as String? ?? 'Mechanic';

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F7),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(name),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    _buildMechanicProfile(name),
                    const SizedBox(height: 20),
                    _buildSectionLabel('Pick a Date'),
                    const SizedBox(height: 10),
                    _buildCalendarCard(),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(String name) {
    return Container(
      color: _primary,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.chevron_left, color: Colors.white, size: 28),
            onPressed: () => Navigator.of(context).maybePop(),
          ),
          Expanded(
            child: Text(
              'Schedule with $name',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w600),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Icon(Icons.favorite_border, color: Colors.white70, size: 22),
          const SizedBox(width: 8),
        ],
      ),
    );
  }

  Widget _buildMechanicProfile(String name) {
    final experience = widget.schedule['experience'] as String? ?? '';

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 10,
              offset: const Offset(0, 4)),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: _primary.withOpacity(0.1),
            backgroundImage: widget.schedule['avatar'] != null
                ? NetworkImage(widget.schedule['avatar'] as String)
                : null,
            child: widget.schedule['avatar'] == null
                ? Text(
              name.isNotEmpty ? name[0].toUpperCase() : 'M',
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: _primary),
            )
                : null,
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1A1A1A))),
                if (experience.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(experience,
                      style: TextStyle(
                          fontSize: 12, color: Colors.grey.shade500)),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCalendarCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 3)),
        ],
      ),
      child: Column(
        children: [
          _buildMonthHeader(),
        ],
      ),
    );
  }

  Widget _buildMonthHeader() {
    const monthNames = [
      '', 'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December',
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => setState(() => _currentMonth =
              DateTime(_currentMonth.year, _currentMonth.month - 1)),
          child: const Icon(Icons.chevron_left, size: 22, color: _primary),
        ),
        Text(
          '${monthNames[_currentMonth.month]} ${_currentMonth.year}',
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.w700, color: _primary),
        ),
        GestureDetector(
          onTap: () => setState(() => _currentMonth =
              DateTime(_currentMonth.year, _currentMonth.month + 1)),
          child: const Icon(Icons.chevron_right, size: 22, color: _primary),
        ),
      ],
    );
  }
// Only showing what changed inside _buildCalendarCard():

  Widget _buildCalendarCard() {
    return Container(
      // ...same decoration...
      child: Column(
        children: [
          _buildMonthHeader(),
          const SizedBox(height: 10),
          _buildDayLabels(),   // ← added
        ],
      ),
    );
  }

  Widget _buildDayLabels() {
    const days = ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: days
          .map((d) => SizedBox(
        width: 34,
        child: Center(
          child: Text(d,
              style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade400)),
        ),
      ))
          .toList(),
    );
  }

  void _showTimePicker() {
    int h = _startHour, m = _startMinute;
    bool am = _startIsAm;

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (ctx) => StatefulBuilder(
        builder: (_, setModal) => Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 36,
                height: 4,
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(2)),
              ),
              const SizedBox(height: 16),
              const Text('Select Time',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _spinnerColumn(
                      value: h,
                      min: 1,
                      max: 12,
                      onChanged: (v) => setModal(() => h = v)),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(':',
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold)),
                  ),
                  _spinnerColumn(
                      value: m,
                      min: 0,
                      max: 59,
                      onChanged: (v) => setModal(() => m = v)),
                  const SizedBox(width: 16),
                  Column(
                    children: [
                      _amPmButton(
                          label: 'AM',
                          active: am,
                          onTap: () => setModal(() => am = true)),
                      const SizedBox(height: 8),
                      _amPmButton(
                          label: 'PM',
                          active: !am,
                          onTap: () => setModal(() => am = false)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _startHour = h;
                      _startMinute = m;
                      _startIsAm = am;
                    });
                    Navigator.pop(ctx);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text('Confirm',
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _amPmButton({
    required String label,
    required bool active,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: active ? _primary : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(label,
            style: TextStyle(
                color: active ? Colors.white : Colors.black87,
                fontWeight: FontWeight.w600)),
      ),
    );
  }

  Widget _spinnerColumn({
    required int value,
    required int min,
    required int max,
    required void Function(int) onChanged,
  }) {
    return Column(
      children: [
        IconButton(
          icon: const Icon(Icons.keyboard_arrow_up),
          onPressed: () => onChanged(value < max ? value + 1 : min),
        ),
        Text(value.toString().padLeft(2, '0'),
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w700)),
        IconButton(
          icon: const Icon(Icons.keyboard_arrow_down),
          onPressed: () => onChanged(value > min ? value - 1 : max),
        ),
      ],
    );
  }
  // Add _isLoading state:
  bool _isLoading = false;

// Add to build() Column as last child (outside Expanded):
  _buildScheduleButton(),

  Widget _buildScheduleButton() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 10,
              offset: const Offset(0, -3)),
        ],
      ),
      child: ElevatedButton(
        onPressed: (_selectedDate != null && !_isLoading) ? _scheduleNow : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: _primary,
          disabledBackgroundColor: Colors.grey.shade300,
          foregroundColor: Colors.white,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        child: Text(
          _selectedDate == null ? 'Pick a Date to Continue' : 'Schedule Now',
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w700, letterSpacing: 0.3),
        ),
      ),
    );
  }

  void _scheduleNow() {} // stub — wired in next commit

  Widget _buildSectionLabel(String label) {
    return Text(label,
        style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1A1A1A)));
  }
}