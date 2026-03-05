import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../widgets/custom_header.dart';
import 'order_summary_screen.dart';

class LocationSelectionScreen extends StatefulWidget {
  const LocationSelectionScreen({Key? key}) : super(key: key);

  @override
  State<LocationSelectionScreen> createState() => _LocationSelectionScreenState();
}

class _LocationSelectionScreenState extends State<LocationSelectionScreen> {
  static const CameraPosition _initialPosition = CameraPosition(
    target: LatLng(34.0522, -118.2437), // Los Angeles
    zoom: 14.4746,
  );

  String selectedAddress = "3329 Joyce Stree, CA, USA";
  String addressType = "Home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomHeader(title: "Location"),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: _initialPosition,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            onMapCreated: (GoogleMapController controller) {},
          ),
          _buildInfoOverlay(),
          _buildAddressSelectionCard(),
        ],
      ),
    );
  }

  Widget _buildInfoOverlay() {
    return Positioned(
      top: 130, // Below Header
      left: 20,
      right: 20,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildInfoItem("🏠", "3 Bedrooms, 1 Kitchen"),
            Container(width: 1, height: 20, color: Colors.grey[200]),
            _buildInfoItem("👤", "1 Person"),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoItem(String emoji, String text) {
    return Row(
      children: [
        Text(emoji, style: const TextStyle(fontSize: 16)),
        const SizedBox(width: 8),
        Text(
          text,
          style: GoogleFonts.outfit(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF1A1D1E),
          ),
        ),
      ],
    );
  }

  Widget _buildAddressSelectionCard() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.02),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Row(
                children: [
                  const Icon(Icons.stars, color: Color(0xFF4CAF50)),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      selectedAddress,
                      style: GoogleFonts.outfit(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF1A1D1E),
                      ),
                    ),
                  ),
                  const Icon(Icons.close, color: Colors.grey, size: 20),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Container(height: 1, color: Colors.grey[100]),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildQuickSelect("Home", Icons.home_rounded),
                _buildQuickSelect("Work", Icons.work_rounded),
                _buildQuickSelect("Add New", Icons.add_circle_rounded),
              ],
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const OrderSummaryScreen()),
                );
              },
              child: const Text("Proceed"),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickSelect(String label, IconData icon) {
    final bool isSelected = addressType == label;
    return Column(
      children: [
        GestureDetector(
          onTap: () => setState(() => addressType = label),
          child: Container(
            height: 64,
            width: 64,
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFF1A1D1E) : const Color(0xFFF5F5F5),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: isSelected ? Colors.white : const Color(0xFF1A1D1E)),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          label,
          style: GoogleFonts.outfit(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF1A1D1E),
          ),
        ),
      ],
    );
  }
}
