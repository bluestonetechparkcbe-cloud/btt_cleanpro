import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'category_listing_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              _buildSearchBar(),
              _buildSectionHeader(context, "Offers & News", null),
              _buildFilterChips(),
              _buildPromotionalBanner(),
              _buildSectionHeader(context, "Most Booked Services", null),
              _buildServiceCategories(context),
              _buildSectionHeader(context, "Popular Near You", "View all"),
              _buildPopularServiceCard(),
              _buildCategorySection(context, "General Cleaning", [
                {"name": "Home Cleaning", "image": "https://images.unsplash.com/photo-1581578731548-c64695cc6952?auto=format&fit=crop&w=800&q=80", "discount": "10% OFF"},
                {"name": "Furniture Cleaning", "image": "https://images.unsplash.com/photo-1583847268964-b28dc8f51f92?auto=format&fit=crop&w=800&q=80"},
              ]),
              _buildCategorySection(context, "Salon & Spa at Home", [
                {"name": "Women's Salon", "image": "https://images.unsplash.com/photo-1560066984-138dadb4c035?auto=format&fit=crop&w=800&q=80", "discount": "10% OFF"},
                {"name": "Women's Spa", "image": "https://images.unsplash.com/photo-1693004925174-d9e06209d0ee?auto=format&fit=crop&w=800&q=80"},
              ]),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.network(
              "https://images.unsplash.com/photo-1544005313-94ddf0286df2?auto=format&fit=crop&w=100&q=80",
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "HELLO",
                    style: GoogleFonts.outfit(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[600],
                      letterSpacing: 1.1,
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Text("👋", style: TextStyle(fontSize: 14)),
                ],
              ),
              Text(
                "Lavanya",
                style: GoogleFonts.outfit(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF1A1D1E),
                ),
              ),
            ],
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.withOpacity(0.1)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.02),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Icon(Icons.notifications_none_rounded, color: Colors.blueGrey[700], size: 24),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 56,
              decoration: BoxDecoration(
                color: const Color(0xFFF8F9FB),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.withOpacity(0.05)),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search what you need...',
                  hintStyle: TextStyle(color: Colors.grey.withOpacity(0.6), fontSize: 14),
                  prefixIcon: null,
                  suffixIcon: Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF7B61FF), // Purple theme from design
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.search, color: Colors.white, size: 20),
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Container(
            height: 56,
            width: 56,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.withOpacity(0.1)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.02),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const Icon(Icons.tune_rounded, color: Color(0xFF1A1D1E)),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title, String? action) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 4,
                height: 20,
                decoration: BoxDecoration(
                  color: const Color(0xFF7B61FF),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: GoogleFonts.outfit(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF1A1D1E),
                ),
              ),
            ],
          ),
          if (action != null)
            InkWell(
              onTap: () {
                if (title == "General Cleaning") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CategoryListingScreen()),
                  );
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8F9FB),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Text(
                      action == "View all" ? "View all" : "See All",
                      style: GoogleFonts.outfit(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(Icons.chevron_right_rounded, size: 16, color: Colors.grey[600]),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildFilterChips() {
    final filters = ["Trending", "Promotion", "Summer Offer", "New"];
    return SizedBox(
      height: 40,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        itemBuilder: (context, index) {
          final bool isFirst = index == 0;
          return Container(
            margin: const EdgeInsets.only(right: 12),
            child: FilterChip(
              label: Text(filters[index]),
              selected: isFirst,
              onSelected: (val) {},
              backgroundColor: Colors.white,
              selectedColor: const Color(0xFF1D92FF),
              labelStyle: GoogleFonts.outfit(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: isFirst ? Colors.white : Colors.grey[600],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: isFirst ? Colors.transparent : Colors.grey.withOpacity(0.3)),
              ),
              showCheckmark: false,
              padding: const EdgeInsets.symmetric(horizontal: 12),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPromotionalBanner() {
    return Container(
      height: 180,
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF7B61FF).withValues(alpha: 0.8),
            const Color(0xFF7B61FF),
          ],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            bottom: 0,
            top: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
              child: Image.network(
                "https://images.unsplash.com/photo-1584820927498-cfe5211fd8bf?auto=format&fit=crop&w=400&q=80",
                width: 160,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                stops: const [0.5, 0.9],
                colors: [
                  const Color(0xFF7B61FF),
                  const Color(0xFF7B61FF).withValues(alpha: 0.0),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.flash_on, color: Colors.white, size: 12),
                      const SizedBox(width: 4),
                      Text(
                        "Limited Offer",
                        style: GoogleFonts.outfit(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  "40% OFF",
                  style: GoogleFonts.outfit(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  "On First Cleaning Service",
                  style: GoogleFonts.outfit(color: Colors.white.withOpacity(0.9), fontSize: 12, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Positioned(
            top: 20,
            left: 20,
            child: Row(
              children: [
                const Icon(Icons.wb_cloudy_rounded, color: Colors.white, size: 16),
                const SizedBox(width: 6),
                Text(
                  "Shifty",
                  style: GoogleFonts.outfit(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCategories(BuildContext context) {
    final services = [
      {"name": "Cleaning", "icon": Icons.cleaning_services_rounded, "color": const Color(0xFFE8F5E9), "isNew": true},
      {"name": "Labour Service", "icon": Icons.person_rounded, "color": const Color(0xFFE3F2FD)},
      {"name": "Vehicle", "icon": Icons.local_shipping_rounded, "color": const Color(0xFFF3E5F5)},
      {"name": "Painting", "icon": Icons.format_paint_rounded, "color": const Color(0xFFFFF3E0)},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: services.map((s) => _buildCategoryItem(context, s)).toList(),
      ),
    );
  }

  Widget _buildCategoryItem(BuildContext context, Map<String, dynamic> service) {
    return GestureDetector(
      onTap: () {
        if (service["name"] == "Cleaning") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CategoryListingScreen()),
          );
        }
      },
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 64,
                width: 64,
                decoration: BoxDecoration(
                  color: service["color"],
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: (service["color"] as Color).withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Icon(
                  service["icon"] as IconData,
                  color: (service["color"] as Color).withValues(alpha: 0.8, red: 0.2, green: 0.2, blue: 0.2),
                  size: 28,
                ),
              ),
              if (service["isNew"] == true)
                Positioned(
                  top: -5,
                  right: -10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFF4CAF50),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: Text(
                      "New",
                      style: GoogleFonts.outfit(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            service["name"] as String,
            style: GoogleFonts.outfit(fontSize: 12, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }

  Widget _buildPopularServiceCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.grey.withOpacity(0.05)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  "https://images.unsplash.com/photo-1560250097-0b93528c311a?auto=format&fit=crop&w=100&q=80",
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Expert Plumbing",
                      style: GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "\$45",
                      style: GoogleFonts.outfit(color: const Color(0xFF1D92FF), fontWeight: FontWeight.w800, fontSize: 18),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.star_rounded, color: Color(0xFFFFB800), size: 20),
                        const SizedBox(width: 4),
                        Text(
                          "4.5",
                          style: GoogleFonts.outfit(fontWeight: FontWeight.w700, fontSize: 13),
                        ),
                        Text(
                          "(120 reviews)",
                          style: GoogleFonts.outfit(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFFFF3B30),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "Plumber",
                  style: GoogleFonts.outfit(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    side: BorderSide(color: Colors.grey.withOpacity(0.2)),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.visibility_outlined, size: 18, color: Color(0xFF1A1D1E)),
                      const SizedBox(width: 8),
                      Text("View Profile", style: GoogleFonts.outfit(color: const Color(0xFF1A1D1E), fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    backgroundColor: const Color(0xFF3897FF),
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  ),
                  child: Text("Book Now", style: GoogleFonts.outfit(fontWeight: FontWeight.w700, color: Colors.white)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCategorySection(BuildContext context, String title, List<Map<String, String>> items) {
    return Column(
      children: [
        _buildSectionHeader(context, title, "See All"),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            children: items.map((item) {
              return Padding(
                padding: const EdgeInsets.only(right: 16),
                child: _buildServiceCard(item["name"]!, item["image"]!, item["discount"]),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildServiceCard(String title, String image, String? discount) {
    return Container(
      width: 160,
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FB),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                child: AspectRatio(
                  aspectRatio: 1.3,
                  child: Image.network(
                    image,
                    width: 160,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: Colors.grey[200],
                      child: const Icon(Icons.image, color: Colors.grey),
                    ),
                  ),
                ),
              ),
              if (discount != null)
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFF4B4B),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      discount,
                      style: GoogleFonts.outfit(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              title,
              style: GoogleFonts.outfit(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF1A1D1E),
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildBottomNav() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF1D92FF),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month_rounded), label: "Bookings"),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline_rounded), label: "Messages"),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline_rounded), label: "Profile"),
        ],
      ),
    );
  }
}
