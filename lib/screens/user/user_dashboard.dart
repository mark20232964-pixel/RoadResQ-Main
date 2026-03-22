import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'user_profile_screen.dart';
import 'mechanics_near_you.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({super.key});

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  int _selectedIndex = 0;

  Position? _cachedPosition;
  bool _isLoadingLocation = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _preloadLocation();
      _precacheImages();
    });
  }

  void _precacheImages() {
    precacheImage(const AssetImage('assets/images/mechanic.jpg'), context);
    precacheImage(const AssetImage('assets/images/garage.jpg'), context);
  }

  Future<void> _preloadLocation() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) return;

      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) return;

      _cachedPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium,
      );
    } catch (_) {}
  }

  Future<void> _handleBookMechanic() async {
    setState(() => _isLoadingLocation = true);

    try {
      Position position = _cachedPosition ??
          await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.medium);

      setState(() => _isLoadingLocation = false);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => MechanicsNearYouScreen(currentPosition: position),
        ),
      );

      _preloadLocation();
    } catch (e) {
      setState(() => _isLoadingLocation = false);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,

          body: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(
                    top: 50, left: 20, right: 20, bottom: 30),
                decoration: const BoxDecoration(
                  color: Color(0xFF1B1B4B),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Dashboard",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        Icon(Icons.error, color: Colors.red),
                      ],
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Search Service",
                        prefixIcon: const Icon(Icons.search),
                        filled: true,
                        fillColor: Colors.white12,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(20),
                  children: [
                    GestureDetector(
                      onTap: _handleBookMechanic,
                      child: _buildCard(
                          "Book a\nMechanic", 'assets/images/mechanic.jpg'),
                    ),
                    const SizedBox(height: 15),
                    _buildCard("Book a\nGarage", 'assets/images/garage.jpg'),
                  ],
                ),
              ),
            ],
          ),

          // 🔥 FIXED NAV BAR
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: const Color(0xFFF2F2F2), // 👈 light grey
              border: Border(
                top: BorderSide(
                  color: Colors.grey.shade300, // 👈 subtle line
                  width: 1,
                ),
              ),
            ),
            child: BottomNavigationBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.black54,
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              onTap: (index) {
                setState(() => _selectedIndex = index);

                if (index == 3) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const UserProfileScreen()),
                  );
                }
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
                BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
                BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_bag), label: ''),
                BottomNavigationBarItem(
                  icon: CircleAvatar(
                    radius: 12,
                    backgroundImage:
                        NetworkImage('https://via.placeholder.com/150'),
                  ),
                  label: '',
                ),
              ],
            ),
          ),
        ),
        if (_isLoadingLocation)
          Container(
            color: Colors.black26,
            child: const Center(child: CircularProgressIndicator()),
          ),
      ],
    );
  }

  Widget _buildCard(String title, String image) {
    return Container(
      height: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
      ),
      padding: const EdgeInsets.all(25),
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
      ),
    );
  }
}
