// lib/screens/user/user_dashboard.dart

import 'package:flutter/material.dart';

class UserDashboard extends StatelessWidget {
  const UserDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.white, // we'll change to match your original later
      body: Column(
        children: [
          // Header with location and SOS
          Container(
            padding: const EdgeInsets.only(
              top: 50,
              left: 20,
              right: 20,
              bottom: 30,
            ),
            decoration: const BoxDecoration(
              color: Color(0xFF1B1B4B), // dark navy blue
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Location",
                          style: TextStyle(color: Colors.white54, fontSize: 12),
                        ),
                        Text(
                          "Bilzen, Tanjungbalai",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.error,
                      color: Colors.red,
                      size: 30,
                    ), // SOS Icon
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
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
                    ),
                    const SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white12,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Icon(Icons.tune, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Temporary placeholder for the rest of the body
          Expanded(
            child: Center(
              child: Text(
                'Dashboard content coming in next steps',
                style: TextStyle(fontSize: 20, color: Colors.black54),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
