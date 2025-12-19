import 'package:bite_finder_app/screen/buttom_screen/favourite_screen.dart';
import 'package:bite_finder_app/screen/buttom_screen/home_screen.dart';
import 'package:bite_finder_app/screen/buttom_screen/notification_screen.dart';
import 'package:bite_finder_app/screen/buttom_screen/profile_screen.dart';
import 'package:flutter/material.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    FavouriteScreen(),
    ProfileScreen(),
    NotificationScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bottom Navigation"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 239, 250, 115),
      ),
      body: _screens[0],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Color.fromARGB(255, 72, 103, 255),
        unselectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: "Favourite",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "Notification",
          ),
        ],
        // backgroundColor: Colors.black,
        // selectedItemColor: const Color.fromARGB(255, 72, 103, 255),
        // unselectedItemColor: Colors.white,
        // currentIndex: _selectedIndex,
        // onTap: (index) {
        //   setState(() {
        //     _selectedIndex = index;
        //   });
      ),
    );
  }
}
