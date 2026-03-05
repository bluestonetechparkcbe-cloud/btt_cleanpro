import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/custom_header.dart';
import 'order_success_screen.dart';

class OrderSummaryScreen extends StatefulWidget {
  const OrderSummaryScreen({Key? key}) : super(key: key);

  @override
  State<OrderSummaryScreen> createState() => _OrderSummaryScreenState();
}

class _OrderSummaryScreenState extends State<OrderSummaryScreen> {
  String paymentMethod = "Online";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomHeader(title: "Order Details"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle("Service Details"),
            _buildInfoCard(
              icon: Icons.cleaning_services_rounded,
              title: "Home Cleaning",
              subtitle: "3 Bedrooms, 1 Kitchen | 1 Person",
              trailing: "Edit",
            ),
            const SizedBox(height: 24),
            _buildSectionTitle("Schedule & Location"),
            _buildInfoCard(
              icon: Icons.calendar_month_rounded,
              title: "July 11, 2021",
              subtitle: "11:00 AM",
            ),
            const SizedBox(height: 12),
            _buildInfoCard(
              icon: Icons.location_on_rounded,
              title: "Home",
              subtitle: "3329 Joyce Stree, CA, USA",
            ),
            const SizedBox(height: 24),
            _buildSectionTitle("Promo Code"),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                   const Icon(Icons.confirmation_num_outlined, color: Color(0xFF4CAF50)),
                   const SizedBox(width: 12),
                   Text(
                     "BTTNEW40 applied",
                     style: GoogleFonts.outfit(
                       fontSize: 14,
                       fontWeight: FontWeight.w600,
                       color: const Color(0xFF4CAF50),
                     ),
                   ),
                   const Spacer(),
                   const Icon(Icons.check_circle, color: Color(0xFF4CAF50), size: 20),
                ],
              ),
            ),
            const SizedBox(height: 24),
            _buildSectionTitle("Payment Method"),
            Row(
              children: [
                _buildPaymentToggleButton("Online", Icons.credit_card_rounded),
                const SizedBox(width: 16),
                _buildPaymentToggleButton("Cash", Icons.payments_rounded),
              ],
            ),
            const SizedBox(height: 32),
            _buildPricingSection(),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const OrderSuccessScreen()),
                );
              },
              child: const Text("Confirm Order"),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        title,
        style: GoogleFonts.outfit(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: const Color(0xFF1A1D1E),
        ),
      ),
    );
  }

  Widget _buildInfoCard({required IconData icon, required String title, required String subtitle, String? trailing}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey[100]!),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: const Color(0xFF4CAF50), size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.outfit(fontSize: 14, fontWeight: FontWeight.w700),
                ),
                Text(
                  subtitle,
                  style: GoogleFonts.outfit(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
          if (trailing != null)
            Text(
              trailing,
              style: GoogleFonts.outfit(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF4CAF50),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildPaymentToggleButton(String label, IconData icon) {
    final bool isSelected = paymentMethod == label;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => paymentMethod = label),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF4CAF50) : const Color(0xFFF5F5F5),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: isSelected ? Colors.white : Colors.grey, size: 20),
              const SizedBox(width: 8),
              Text(
                label,
                style: GoogleFonts.outfit(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: isSelected ? Colors.white : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPricingSection() {
    return Column(
      children: [
        _buildPriceRow("Subtotal", "\$45.00"),
        const SizedBox(height: 12),
        _buildPriceRow("Promo Discount", "-\$18.00", isDiscount: true),
        const SizedBox(height: 12),
        _buildPriceRow("Tax", "\$2.00"),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Divider(),
        ),
        _buildPriceRow("Total Amount", "\$29.00", isTotal: true),
      ],
    );
  }

  Widget _buildPriceRow(String label, String value, {bool isDiscount = false, bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.outfit(
            fontSize: isTotal ? 18 : 14,
            fontWeight: isTotal ? FontWeight.w800 : FontWeight.w500,
            color: isTotal ? const Color(0xFF1A1D1E) : Colors.grey,
          ),
        ),
        Text(
          value,
          style: GoogleFonts.outfit(
            fontSize: isTotal ? 18 : 14,
            fontWeight: isTotal ? FontWeight.w800 : FontWeight.w700,
            color: isDiscount ? const Color(0xFF4CAF50) : const Color(0xFF1A1D1E),
          ),
        ),
      ],
    );
  }
}
