import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../widgets/custom_header.dart';
import 'location_selection_screen.dart';

class DateTimeSelectionScreen extends StatefulWidget {
  const DateTimeSelectionScreen({Key? key}) : super(key: key);

  @override
  State<DateTimeSelectionScreen> createState() => _DateTimeSelectionScreenState();
}

class _DateTimeSelectionScreenState extends State<DateTimeSelectionScreen> {
  DateTime selectedDate = DateTime(2021, 7, 11);
  String selectedTime = "Afternoon";
  bool includeInstruments = true;

  final List<String> timeSlots = ["Afternoon", "Late Morning", "07:00 AM", "11:00 AM", "12:00 PM"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomHeader(title: "Home Cleaning"),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCalendar(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Text(
                "Pick time",
                style: GoogleFonts.outfit(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[400],
                ),
              ),
            ),
            _buildTimeSlots(),
            const SizedBox(height: 24),
            _buildInstrumentsCheckbox(),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LocationSelectionScreen()),
                  );
                },
                child: const Text("Proceed"),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildCalendar() {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                DateFormat('MMMM, y').format(selectedDate),
                style: GoogleFonts.outfit(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF1A1D1E),
                ),
              ),
              Row(
                children: [
                  _buildCalendarNavButton(Icons.chevron_left, () {}),
                  const SizedBox(width: 12),
                  _buildCalendarNavButton(Icons.chevron_right, () {}),
                ],
              ),
            ],
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: ["Mo", "Tu", "We", "Th", "Fr", "Sa", "Su"]
                .map((day) => Expanded(
                      child: Text(
                        day,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.outfit(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF4CAF50),
                        ),
                      ),
                    ))
                .toList(),
          ),
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            itemCount: 31,
            itemBuilder: (context, index) {
              final day = index + 1;
              final bool isSelected = day == selectedDate.day;
              final bool isToday = day == 11; // Based on screenshot

              return GestureDetector(
                onTap: () => setState(() => selectedDate = DateTime(2021, 7, day)),
                child: Container(
                  decoration: BoxDecoration(
                    color: isSelected ? const Color(0xFF4CAF50) : Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      "$day",
                      style: GoogleFonts.outfit(
                        fontSize: 16,
                        fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                        color: isSelected ? Colors.white : (day < 11 ? Colors.grey[300] : const Color(0xFF1A1D1E)),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCalendarNavButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Icon(icon, size: 24),
      ),
    );
  }

  Widget _buildTimeSlots() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Wrap(
        spacing: 12,
        runSpacing: 12,
        children: timeSlots.map((time) {
        final bool isSelected = selectedTime == time;
        return GestureDetector(
          onTap: () => setState(() => selectedTime = time),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFF4CAF50) : Colors.white,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: isSelected ? const Color(0xFF4CAF50) : const Color(0xFFE0E0E0),
              ),
            ),
            child: Text(
              time,
              style: GoogleFonts.outfit(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: isSelected ? Colors.white : const Color(0xFF1A1D1E),
              ),
            ),
          ),
        );
        }).toList(),
      ),
    );
  }

  Widget _buildInstrumentsCheckbox() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Checkbox(
            value: includeInstruments,
            activeColor: const Color(0xFF4CAF50),
            onChanged: (val) => setState(() => includeInstruments = val!),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          ),
          Text(
            "Include cleaning Instruments",
            style: GoogleFonts.outfit(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
