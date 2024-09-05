import 'package:flutter/material.dart';
import 'package:flutter_application/modules/home/ui/home_screen.dart';
import 'package:flutter_application/modules/on_boarding/cubit/on_boarding_cubit.dart';
import 'package:flutter_application/modules/on_boarding/ui/onboarding_screen.dart';
import 'package:flutter_application/modules/splash/ui/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (ctx) {
            return OnboardingCubit();
          })
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const OnboardingScreen(),
          routes: {
            '/homeScreen': (context) => const HomeScreen(),
            '/splashScreen': (context) => const SplashScreen(),
            '/onboardingScreen': (context) => const OnboardingScreen(),
          },
        ));
  }
}
