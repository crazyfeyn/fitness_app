import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/modules/auth/blocs/auth_bloc.dart';
import 'package:flutter_application/modules/auth/data/repositories/auth_repository.dart';
import 'package:flutter_application/modules/auth/data/services/auth_service.dart';
import 'package:flutter_application/modules/auth/ui/login_screen.dart';
import 'package:flutter_application/modules/auth/ui/register_screen.dart';
import 'package:flutter_application/modules/profile/ui/edit_profile_screen.dart';
import 'package:flutter_application/modules/profile/ui/privacy_policy_screen.dart';
import 'package:flutter_application/modules/profile/ui/profile_screen.dart';
import 'package:flutter_application/modules/profile/ui/settings_screen.dart';
import 'package:flutter_application/modules/user_info/ui/user_info_screen.dart';
import 'package:flutter_application/modules/home/ui/home_screen.dart';
import 'package:flutter_application/modules/on_boarding/cubit/on_boarding_cubit.dart';
import 'package:flutter_application/modules/on_boarding/ui/onboarding_screen.dart';
import 'package:flutter_application/modules/user_info/ui/bloc/onboarding_deep_bloc.dart';
import 'package:flutter_application/modules/splash/ui/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = AuthService();
    final authRepository = AuthRepository(authService: authService);
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (ctx) {
            return OnboardingCubit();
          }),
          BlocProvider(create: (ctx) {
            return OnboardingDeepBloc();
          }),
          BlocProvider(create: (ctx) {
            return AuthBloc(authRepository: authRepository);
          }),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const RegisterScreen(),
          routes: {
            '/homeScreen': (context) => const HomeScreen(),
            '/splashScreen': (context) => const SplashScreen(),
            '/onboardingScreen': (context) => const OnboardingScreen(),
            '/userInfoScreen': (context) {
              final args = ModalRoute.of(context)!.settings.arguments
                  as Map<String, String>;
              return UserInfoScreen(
                email: args['email']!,
                password: args['password']!,
              );
            },
            '/registerScreen': (context) => const RegisterScreen(),
            '/loginScreen': (context) => const LoginScreen(),
            '/editProfileScreen': (context) => const EditProfileScreen(),
            '/privacyPolicyScreen': (context) => const PrivacyPolicyScreen(),
            '/settingsScreen': (context) => const SettingsScreen(),
            '/profileScreen': (context) => const ProfileScreen(),
          },
        ));
  }
}
