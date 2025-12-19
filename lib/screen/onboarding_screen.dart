import 'package:bite_finder_app/screen/choose_screen.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  final Color primaryRed = const Color(0xFFB00020);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _goNext() {
    if (_currentIndex < 2) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const BiteWelcomePage()),
      );
    }
  }

  void _skip() {
    _controller.animateToPage(
      2,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Skip button at top-right
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: _skip,
                child: const Text('Skip', style: TextStyle(color: Colors.grey)),
              ),
            ),
            Expanded(
              child: PageView(
                controller: _controller,
                onPageChanged: (index) {
                  setState(() => _currentIndex = index);
                },
                children: const [
                  _OnboardFrame(
                    image: 'assets/icon/image/Pizza.jpg',
                    title: 'Welcome to BiteFinder',
                    text: 'We deliver your order quickly to your door.',
                  ),
                  _OnboardFrame(
                    image: 'assets/icon/image/momo.jpg',
                    title: 'Local Food',
                    text: 'Find the freshest and tastiest dishes near you.',
                  ),
                  _OnboardFrame(
                    image: 'assets/icon/image/burger.jpg',
                    title: 'Multiple Cuisines',
                    text: 'Discover pizza, momo and many more items.',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Dots + Next/Done button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Dot indicators
                  Row(
                    children: List.generate(3, (index) {
                      final bool isActive = index == _currentIndex;
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        height: 8,
                        width: isActive ? 22 : 8,
                        decoration: BoxDecoration(
                          color: isActive ? primaryRed : Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      );
                    }),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryRed,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 28,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    onPressed: _goNext,
                    child: Text(
                      _currentIndex == 2 ? 'Done' : 'Next',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OnboardFrame extends StatelessWidget {
  final String image;
  final String title;
  final String text;

  const _OnboardFrame({
    required this.image,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final Color primaryRed = const Color(0xFFB00020);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Column(
        children: [
          const SizedBox(height: 24),
          Expanded(child: Image.asset(image, fit: BoxFit.contain)),
          const SizedBox(height: 24),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: primaryRed,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.black54, fontSize: 14),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
