import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/services.dart';
import 'onboarding_screen.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    
    // Hide system UI (status bar and navigation bar) for true full-screen on mobile
    if (!kIsWeb) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    }

    // Common duration of 12 seconds for both Web and Mobile
    const int durationSeconds = 6;
    
    Timer(Duration(seconds: durationSeconds), () {
      if (mounted) {
        // Restore system UI before navigating
        if (!kIsWeb) {
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
        }
        
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const OnboardingScreen(),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    // Ensure system UI is restored if the widget is disposed before timer ends
    if (!kIsWeb) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox.expand(
        child: Image.asset(
          'images/img_splash_screen_mob.jpg',
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/img_btt_logo.png',
                  width: 200,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 20),
                const Text(
                  "Trusted Home Services\nAt Your Fingertips",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1D92FF),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
