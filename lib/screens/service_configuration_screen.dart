import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/custom_header.dart';
import 'date_time_selection_screen.dart';

class ServiceConfigurationScreen extends StatefulWidget {
  final String serviceName;

  const ServiceConfigurationScreen({Key? key, required this.serviceName}) : super(key: key);

  @override
  State<ServiceConfigurationScreen> createState() => _ServiceConfigurationScreenState();
}

class _ServiceConfigurationScreenState extends State<ServiceConfigurationScreen> {
  int persons = 1;
  int hours = 2;
  int selectedRoomIndex = 1;

  final List<Map<String, dynamic>> roomConfigs = [
    {
      "title": "2 Bedrooms\n1 Kitchen",
      "image": "https://img.icons8.com/color/480/bungalow.png",
      "color": const Color(0xFFFFF1EB),
    },
    {
      "title": "3 Bedrooms\n1 Kitchen",
      "image": "https://img.icons8.com/color/480/home.png",
      "color": const Color(0xFFE6F7F9),
    },
    {
      "title": "4 Bedrooms\n1 Kitchen",
      "image": "https://img.icons8.com/color/480/mansion.png",
      "color": const Color(0xFFF2E9FF),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4CAF50),
      body: Column(
        children: [
          // Header with Back Button and Notification
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  Text(
                    widget.serviceName,
                    style: GoogleFonts.outfit(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  const Stack(
                    children: [
                      Icon(Icons.notifications_none_rounded, color: Colors.white),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: CircleAvatar(
                          radius: 4,
                          backgroundColor: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          
          // White Content Area with Overlapping Effect
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 32),
                    
                    // Service Title Section
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.network(
                                "https://cdn-icons-png.flaticon.com/512/3127/3127111.png",
                                width: 32,
                                height: 32,
                                color: const Color(0xFF4CAF50),
                              ),
                              const SizedBox(width: 12),
                              Text(
                                "Cleaning",
                                style: GoogleFonts.outfit(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xFF1A1D1E),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF5F5F7),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Row(
                              children: [
                                const Icon(Icons.add, color: Color(0xFF4CAF50), size: 20),
                                const SizedBox(width: 4),
                                Text(
                                  "Custom",
                                  style: GoogleFonts.outfit(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF4CAF50),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        "Select your house rooms and kitchen in order\nto measure estimated cleaning costs.",
                        style: GoogleFonts.outfit(
                          fontSize: 14,
                          color: const Color(0xFF909395),
                          height: 1.5,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    
                    // Promo Banners
                    SizedBox(
                      height: 160,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        children: [
                          _buildPromoBanner(
                            "40% OFF", 
                            "On First Cleaning Service",
                            "https://images.pexels.com/photos/4239145/pexels-photo-4239145.jpeg?auto=compress&cs=tinysrgb&w=800",
                            const Color(0xFF139A62),
                          ),
                          const SizedBox(width: 16),
                          _buildPromoBanner(
                            "10% OFF", 
                            "Online Payment Special",
                            "https://images.unsplash.com/photo-1581578731548-c64695cc6952?auto=format&fit=crop&w=400&q=80",
                            const Color(0xFF5AB9D9),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    
                    // Room Config Selection
                    SizedBox(
                      height: 140,
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        scrollDirection: Axis.horizontal,
                        itemCount: roomConfigs.length,
                        itemBuilder: (context, index) {
                          return _buildRoomConfigItem(index);
                        },
                      ),
                    ),
                    const SizedBox(height: 32),
                    
                    // Counters
                    _buildCounterSection(
                      "Required Person",
                      "Regular cost is $5/hr. Total cost\nwill be calculated later",
                      persons,
                      "https://cdn-icons-png.flaticon.com/512/1077/1077114.png",
                      (val) => setState(() => persons = val < 0 ? 0 : val),
                    ),
                    const SizedBox(height: 20),
                    _buildCounterSection(
                      "Working Hour",
                      "Cost will increase after 2 hrs\nof work.",
                      hours,
                      "https://cdn-icons-png.flaticon.com/512/2997/2997985.png",
                      (val) => setState(() => hours = val < 1 ? 1 : val),
                    ),
                    const SizedBox(height: 48),
                    
                    // Proceed Button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const DateTimeSelectionScreen()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4CAF50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Text(
                            "Proceed",
                            style: GoogleFonts.outfit(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPromoBanner(String offer, String subtitle, String imageUrl, Color bgColor) {
    return Container(
      width: 280,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const Icon(Icons.home_work_rounded, color: Colors.white, size: 24),
                    const SizedBox(width: 8),
                    Text(
                      "Shifty",
                      style: GoogleFonts.outfit(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.local_fire_department_rounded, color: Colors.white, size: 12),
                      const SizedBox(width: 4),
                      Text(
                        "Hot Deal",
                        style: GoogleFonts.outfit(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  offer,
                  style: GoogleFonts.outfit(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  subtitle,
                  style: GoogleFonts.outfit(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: -20,
            bottom: 0,
            top: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
              child: Image.network(
                imageUrl,
                width: 140,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRoomConfigItem(int index) {
    final bool isSelected = selectedRoomIndex == index;
    final config = roomConfigs[index];
    return GestureDetector(
      onTap: () => setState(() => selectedRoomIndex = index),
      child: Container(
        width: 110,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: config["color"],
          borderRadius: BorderRadius.circular(24),
          border: isSelected ? Border.all(color: const Color(0xFFFFB74D), width: 1.5) : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(config["image"]!, height: 60),
            const SizedBox(height: 12),
            Text(
              config["title"]!,
              textAlign: TextAlign.center,
              style: GoogleFonts.outfit(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: isSelected ? const Color(0xFFE65100) : const Color(0xFF616161),
                height: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCounterSection(String title, String subtitle, int value, String iconUrl, Function(int) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F7),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image.network(iconUrl, width: 28, height: 28, color: const Color(0xFF4CAF50)),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.outfit(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF1A1D1E),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: GoogleFonts.outfit(
                    fontSize: 12,
                    color: const Color(0xFF909395),
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              _buildCounterButton(Icons.remove, () => onChanged(value - 1)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "$value",
                  style: GoogleFonts.outfit(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF1A1D1E),
                  ),
                ),
              ),
              _buildCounterButton(Icons.add, () => onChanged(value + 1)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCounterButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F7),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, size: 20, color: const Color(0xFF1A1D1E)),
      ),
    );
  }
}
