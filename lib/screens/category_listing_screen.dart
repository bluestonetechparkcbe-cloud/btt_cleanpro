import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/custom_header.dart';
import 'service_configuration_screen.dart';

class CategoryListingScreen extends StatelessWidget {
  const CategoryListingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final services = [
      {"name": "Home Cleaning", "image": "https://images.unsplash.com/photo-1581578731548-c64695cc6952?auto=format&fit=crop&w=800&q=80"},
      {"name": "Furniture Cleaning", "image": "https://images.unsplash.com/photo-1583847268964-b28dc8f51f92?auto=format&fit=crop&w=800&q=80"},
      {"name": "Home Deep Cleaning", "image": "https://images.unsplash.com/photo-1737372826589-baf8fd032d2f?auto=format&fit=crop&w=800&q=80"},
      {"name": "AC Cleaning & Repair", "image": "https://images.unsplash.com/photo-1621905251918-48416bd8575a?auto=format&fit=crop&w=800&q=80"},
      {"name": "Laundry & Dry Cleaning", "image": "https://images.unsplash.com/photo-1635274605638-d44babc08a4f?auto=format&fit=crop&w=800&q=80"},
      {"name": "Car Wash", "image": "https://images.unsplash.com/photo-1520340356584-f9917d1eea6f?auto=format&fit=crop&w=800&q=80"},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomHeader(
        title: "General Cleaning",
        isMinimal: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemCount: services.length,
        itemBuilder: (context, index) {
          final service = services[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ServiceConfigurationScreen(serviceName: service["name"]!),
                ),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.04),
                          blurRadius: 15,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Image.network(
                        service["image"]!,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: Colors.grey[200],
                          child: const Icon(Icons.image, color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  service["name"]!,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.outfit(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF1A1D1E),
                    letterSpacing: -0.2,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
