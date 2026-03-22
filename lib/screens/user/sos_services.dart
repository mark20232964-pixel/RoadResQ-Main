class SosScreen extends StatefulWidget {
  const SosScreen({super.key});

  @override
  State<SosScreen> createState() => _SosScreenState();
}

class _SosScreenState extends State<SosScreen> {
  bool _isLoading = false;
  Position? _currentPosition;
  List<Map<String, dynamic>> _nearbyServices = [];
  String? _errorMessage;
  String? _lastSosDocumentId;
  bool _sosActive = false;

  StreamSubscription<Position>? _positionStreamSubscription;

  @override
  void dispose() {
    _positionStreamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1117),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B1B4B),
        foregroundColor: Colors.white,
        title: const Text('SOS Emergency'),
        centerTitle: true,
      ),
      body: const Center(child: Text("SOS Screen")),
    );
  }
}