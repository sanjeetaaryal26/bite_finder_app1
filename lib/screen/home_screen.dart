import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 12),
            // Search bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                height: 44,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(22),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: const [
                    Expanded(
                      child: Text(
                        'Search for FOOD',
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                    ),
                    Icon(Icons.search, color: Colors.black87),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            // List of restaurants
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: const [
                  FoodCard(
                    titleBanner: 'Fresh Hand-Streched Pizza',
                    imagePath: 'assets/icon/image/Pizza-3007395.jpg',
                    name: 'House Pizza -Maharajgunj',
                    rating: 4.5,
                    speciality: 'Speciality-BBQ pizza',
                    isFavorite: true,
                  ),
                  FoodCard(
                    titleBanner: '',
                    imagePath: 'assets/icon/image/momo.jpg',
                    name: 'Bagaicha Resturant -Naxal',
                    rating: 4.4,
                    speciality: 'Speciality-Jhol MO:MO',
                    isFavorite: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // Bottom navigation
      bottomNavigationBar: BottomAppBar(
        color: Colors.red.shade700,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Icon(Icons.home, color: Colors.black, size: 28),
              Icon(Icons.favorite, color: Colors.white, size: 26),
              Icon(Icons.notifications, color: Colors.white, size: 26),
              Icon(Icons.person, color: Colors.white, size: 26),
            ],
          ),
        ),
      ),
    );
  }
}

class FoodCard extends StatelessWidget {
  final String titleBanner;
  final String imagePath;
  final String name;
  final double rating;
  final String speciality;
  final bool isFavorite;

  const FoodCard({
    super.key,
    required this.titleBanner,
    required this.imagePath,
    required this.name,
    required this.rating,
    required this.speciality,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (titleBanner.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Text(
                  titleBanner,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(width: 4),
                const Text('🍕'),
              ],
            ),
          ),
        const SizedBox(height: 4),
        // Image
        AspectRatio(
          aspectRatio: 16 / 9,
          child: Image.asset(imagePath, fit: BoxFit.cover),
        ),
        // Text + rating row
        Container(
          color: Colors.white,
          padding: const EdgeInsets.fromLTRB(8, 4, 8, 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Name + heart
              Row(
                children: [
                  Expanded(
                    child: Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : Colors.black,
                    size: 20,
                  ),
                ],
              ),
              const SizedBox(height: 2),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    rating.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    speciality,
                    style: const TextStyle(color: Colors.red, fontSize: 13),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
