import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomHeader extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final bool showBackButton;

  final bool isMinimal;

  const CustomHeader({
    Key? key,
    required this.title,
    this.actions,
    this.showBackButton = true,
    this.isMinimal = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isMinimal ? Colors.white : const Color(0xFF4CAF50),
        borderRadius: isMinimal
            ? null
            : const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Row(
            children: [
              if (showBackButton)
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: isMinimal
                        ? BoxDecoration(
                            border: Border.all(color: Colors.grey.withOpacity(0.1)),
                            borderRadius: BorderRadius.circular(12),
                          )
                        : null,
                    child: Icon(
                      Icons.arrow_back,
                      color: isMinimal ? const Color(0xFF1A1D1E) : Colors.white,
                      size: 20,
                    ),
                  ),
                )
              else
                const SizedBox(width: 40),
              Expanded(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.outfit(
                    color: isMinimal ? const Color(0xFF1A1D1E) : Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              if (actions != null)
                ...actions!
              else if (isMinimal)
                const SizedBox(width: 40)
              else
                Stack(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.notifications_none_rounded, color: Colors.white),
                      onPressed: () {},
                    ),
                    Positioned(
                      right: 12,
                      top: 12,
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: Color(0xFFFF5252),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
