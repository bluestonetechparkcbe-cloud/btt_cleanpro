import 'package:flutter/material.dart';
import 'login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  final List<Map<String, dynamic>> pages = [
    {
      "image": "images/img_onboard_1.jpg",
      "title": "We Provide Professional\nHome services at a very\nfriendly price",
    },
    {
      "image": "images/img_onboard_2.jpg",
      "title": "Get Beauty parlor at your\nhome & other Personal\nGrooming needs",
    },
    {
      "image": "images/img_onboard_3.png",
      "title": "Easy Service booking &\nScheduling",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: _controller,
              itemCount: pages.length,
              onPageChanged: (index) {
                setState(() => _currentIndex = index);
              },
              itemBuilder: (context, index) {
                return _buildPage(pages[index]);
              },
            ),
            // Updated Skip Button to match design background
            Positioned(
              top: 20,
              right: 20,
              child: TextButton(
                onPressed: _navigateToLogin,
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xFFE9F0FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                ),
                child: const Text(
                  "Skip",
                  style: TextStyle(
                    color: Color(0xFF003366),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPage(Map<String, dynamic> data) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenHeight = constraints.maxHeight;
        // Adjust sizes dynamically to be more conservative and avoid overflow
        final imageSize = screenHeight * 0.35; 
        final topSpacing = screenHeight * 0.12; 
        final midSpacing = screenHeight * 0.04;

        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: screenHeight),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  SizedBox(height: topSpacing),
                  // Centered Image Container with Border
                  Center(
                    child: Container(
                      width: imageSize,
                      height: imageSize,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xFFF0F5FF),
                          width: 12,
                        ),
                        image: DecorationImage(
                          image: AssetImage(data["image"]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40), // Balanced gap as requested
                  // Refined Typography
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      data["title"],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1A1D1E),
                        height: 1.2,
                        letterSpacing: -0.5,
                      ),
                    ),
                  ),
                  SizedBox(height: midSpacing),
                  // Improved Indicators (Pill + Circle)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      pages.length,
                      (dotIndex) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: _currentIndex == dotIndex ? 28 : 8,
                        height: 6,
                        decoration: BoxDecoration(
                          color: _currentIndex == dotIndex
                              ? const Color(0xFF1D92FF)
                              : const Color(0xFFE8F1FF),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: midSpacing),
                  // Next Button
                  GestureDetector(
                    onTap: () {
                      if (_currentIndex == pages.length - 1) {
                        _navigateToLogin();
                      } else {
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1D92FF),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF1D92FF).withOpacity(0.25),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          )
                        ],
                      ),
                      child: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Spacer(), // Added spacer here to push content up and keep layout balanced
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _navigateToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }
}