import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:btt_cleanpro/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BTT CleanPro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.interTextTheme(
          const TextTheme(
            displayLarge: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w600,
              height: 34 / 28,
              color: Color(0xFF1A1A1A),
            ),
            displayMedium: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              height: 28 / 22,
              color: Color(0xFF1A1A1A),
            ),
            displaySmall: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              height: 24 / 18,
              color: Color(0xFF1A1A1A),
            ),
            bodyLarge: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              height: 24 / 16,
              color: Color(0xFF1A1A1A),
            ),
            bodyMedium: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              height: 20 / 14,
              color: Color(0xFF6B7280),
            ),
            labelSmall: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              height: 16 / 12,
              color: Color(0xFF9CA3AF),
            ),
          ),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2F80ED),
          primary: const Color(0xFF2F80ED),
          onPrimary: Colors.white,
          secondary: const Color(0xFF6B7280),
          surface: Colors.white,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Color(0xFF1A1A1A),
          centerTitle: true,
          elevation: 0,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF2F80ED),
            foregroundColor: Colors.white,
            elevation: 4,
            shadowColor: Colors.black.withOpacity(0.1),
            minimumSize: const Size(double.infinity, 56),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            textStyle: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}