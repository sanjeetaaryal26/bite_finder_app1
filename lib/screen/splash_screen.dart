import 'package:flutter/material.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToOnboarding();
  }

  void _navigateToOnboarding() {
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const OnboardingPage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF7A0000), // Dark red background
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Bite Text
            Text(
              "Bite",
              style: TextStyle(
                fontSize: 80,
                fontWeight: FontWeight.w900,
                color: const Color(0xFFFFC400), // Yellow color
                // Use the custom OpenSansCondensed font registered in pubspec.yaml
                fontFamily: 'OpenSansCondensed',
              ),
            ),

            // Curved underline shape (made using Container)
            Transform.translate(
              offset: const Offset(0, -20),
              child: Container(
                height: 20,
                width: 180,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFC400),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
