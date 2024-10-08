import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/l10n/l10n.dart';
import 'package:flutter_application/modules/auth/blocs/auth_bloc.dart';
import 'package:flutter_application/modules/auth/data/repositories/auth_repository.dart';
import 'package:flutter_application/modules/auth/data/services/auth_service.dart';
import 'package:flutter_application/modules/auth/ui/login_screen.dart';
import 'package:flutter_application/modules/auth/ui/register_screen.dart';
import 'package:flutter_application/modules/home/ui/workout_screen.dart';
import 'package:flutter_application/modules/profile/bloc/profile_bloc.dart';
import 'package:flutter_application/modules/profile/data/repositories/profile_repository.dart';
import 'package:flutter_application/modules/profile/data/services/profile_service.dart';
import 'package:flutter_application/modules/profile/provider/locale_provider.dart';
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
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

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
    final profileService = ProfileService();
    final profileRepository = ProfileRepository(profileService: profileService);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (ctx) => OnboardingCubit()),
        BlocProvider(create: (ctx) => OnboardingDeepBloc()),
        BlocProvider(create: (ctx) => AuthBloc(authRepository: authRepository)),
        BlocProvider(
            create: (ctx) => ProfileBloc(profileRepository: profileRepository)),
        ChangeNotifierProvider(create: (context) => LocaleProvider()),
      ],
      child: Consumer<LocaleProvider>(
        builder: (context, localeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: const LoginScreen(),
            supportedLocales: L10n.all,
            locale: localeProvider.locale,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            routes: {
              '/homeScreen': (context) => HomeScreen(),
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
              '/workoutScreen': (context) {
                final args = ModalRoute.of(context)!.settings.arguments
                    as Map<String, int>;
                return WorkoutScreen(
                  rangeNumber: args['rangeNumber']!,
                );
              }
            },
          );
        },
      ),
    );
  }
}
