import 'package:flutter/material.dart';
import 'package:flutter_application/modules/home/ui/home_screen.dart';
import 'package:flutter_application/modules/on_boarding/ui/onboarding_screen.dart';
import 'package:flutter_application/modules/splash/ui/splash_screen.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScreen(),
      routes: {
        '/homeScreen': (context) => const HomeScreen(),
        '/splashScreen': (context) => const SplashScreen(),
        '/onboardingScreen': (context) => const OnboardingScreen(),
      },
    );
  }
}
