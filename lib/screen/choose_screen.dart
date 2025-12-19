import 'package:flutter/material.dart';
import 'package:bite_finder_app/screen/login_screen.dart';
import 'package:bite_finder_app/screen/signup_screen.dart';

class BiteWelcomePage extends StatelessWidget {
  const BiteWelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color backgroundRed = Color(0xFF8B0000); // deep red
    const Color logoYellow = Color(0xFFFFC727); // warm yellow

    return Scaffold(
      backgroundColor: backgroundRed,
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            // Bite logo text
            Text(
              'Bite',
              style: const TextStyle(
                fontSize: 80,
                fontWeight: FontWeight.w900,
                color: logoYellow,
                letterSpacing: 1.0,
              ),
            ),
            const Spacer(),

            // Buttons row
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _bottomButton(
                    label: 'Log in',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                  ),

                  const SizedBox(width: 16),
                  _bottomButton(
                    label: 'Sign up',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpScreen(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 200),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _bottomButton({required String label, required VoidCallback onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(21),
      ),

      child: Text(
        label,
        style: const TextStyle(
          color: Colors.red,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
