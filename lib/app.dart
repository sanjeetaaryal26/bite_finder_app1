// import 'package:bite_finder_app/screen/onboarding_screen.dart';
import 'package:bite_finder_app/screen/splash_screen.dart';

import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen Demo',
      theme: ThemeData(fontFamily: 'OpenSansCondensed'),
      home: const SplashScreen(),
    );
  }
}
